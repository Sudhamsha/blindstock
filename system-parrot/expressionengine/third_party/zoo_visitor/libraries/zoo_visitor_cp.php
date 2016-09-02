<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class Zoo_visitor_cp
{

	/**
	 * Constructor
	 *
	 * @access public
	 */
	function Zoo_visitor_cp()
	{
		// Creat EE Instance
		$this->EE =& get_instance();


		$this->EE->load->helper('zoo_visitor');
		$this->zoo_settings = get_zoo_settings($this->EE);

	}


	function validate_member($use_screen_name = 'yes')
	{

		/** -------------------------------------
		/**  Instantiate validation class
		/** -------------------------------------*/
		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate' . EXT;
		}

		$VAL = new EE_Validate(
			array(
				'member_id'            => '',
				'val_type'             => 'new', // new or update
				'fetch_lang'           => TRUE,
				'require_cpw'          => FALSE,
				'enable_log'           => FALSE,
				'username'             => $_POST['username'],
				'cur_username'         => '',
				'screen_name'          => $_POST['screen_name'],
				'cur_screen_name'      => '',
				'password'             => $_POST['password'],
				'password_confirm'     => $_POST['password_confirm'],
				'cur_password'         => '',
				'email'                => $_POST['email'],
				'cur_email'            => ''
			)
		);

		$VAL->validate_username();
		$VAL->validate_email();
		$VAL->validate_password();

		if ($use_screen_name == 'yes') {
			$VAL->validate_screen_name();
		}


		// Display errors if there are any

		if (count($VAL->errors) > 0) {
			return array('result' => 'failed',
			             'errors' => $VAL->errors);
		} else {
			return TRUE;
		}


	}

	/**
	 * Register Member
	 *
	 * Create a member profile
	 *
	 * @access    public
	 * @return    mixed
	 */
	function register_member()
	{
		$this->EE->load->helper('security');

		$data = array();

		$data['group_id'] = $_POST['group_id'];

		// -------------------------------------------
		// 'cp_members_member_create_start' hook.
		//  - Take over member creation when done through the CP
		//  - Added 1.4.2
		//
		$edata = $this->EE->extensions->call('cp_members_member_create_start');
		if ($this->EE->extensions->end_script === TRUE) return;
		//
		// -------------------------------------------

		// If the screen name field is empty, we'll assign is
		// from the username field.

		$data['screen_name'] = ($_POST['screen_name']) ? $_POST['screen_name'] : $_POST['username'];

		// Assign the query data

		$data['username']         = $_POST['username'];
		$data['password']         = (version_compare(APP_VER, '2.6.0', '<')) ?  do_hash($_POST['password']) : md5($_POST['password']);
		$data['email']            = $_POST['email'];
		$data['ip_address']       = $this->EE->input->ip_address();
		$data['unique_id']        = random_string('encrypt');
		$data['join_date']        = $this->EE->localize->now;
		$data['language']         = $this->EE->config->item('deft_lang');
		$data['timezone']         = ($this->EE->config->item('default_site_timezone') && $this->EE->config->item('default_site_timezone') != '') ? $this->EE->config->item('default_site_timezone') : $this->EE->config->item('server_timezone');

		if(APP_VER < '2.6.0'){
			$data['daylight_savings'] = ($this->EE->config->item('default_site_dst') && $this->EE->config->item('default_site_dst') != '') ? $this->EE->config->item('default_site_dst') : $this->EE->config->item('daylight_savings');
		}

		$data['time_format']      = ($this->EE->config->item('time_format') && $this->EE->config->item('time_format') != '') ? $this->EE->config->item('time_format') : 'us';

		// Was a member group ID submitted?

		$data['group_id'] = (!$_POST['group_id']) ? 2 : $_POST['group_id'];

		// Extended profile fields
		$cust_fields = FALSE;
		$query       = $this->EE->member_model->get_all_member_fields(array(array('m_field_cp_reg' => 'y')), FALSE);

		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				if ($this->EE->input->post('m_field_id_' . $row['m_field_id']) !== FALSE) {
					$cust_fields['m_field_id_' . $row['m_field_id']] = $this->input->post('m_field_id_' . $row['m_field_id'], TRUE);
				}
			}
		}

		$member_id = $this->EE->member_model->create_member($data, $cust_fields);

		// Write log file

		$message = $this->EE->lang->line('new_member_added');
		$this->EE->load->library('logger');
		$this->EE->logger->log_action($message . NBS . NBS . stripslashes($data['username']));

		// -------------------------------------------
		// 'cp_members_member_create' hook.
		//  - Additional processing when a member is created through the CP
		//
		$edata = $this->EE->extensions->call('cp_members_member_create', $member_id, $data);
		if ($this->EE->extensions->end_script === TRUE) return;
		//
		// -------------------------------------------

		// Update Stats
		$this->EE->stats->update_member_stats();

		return $member_id;
	}


	/**
	 *     Update username and password
	 */
	function update_username_password($save = FALSE)
	{
		/*
if ($this->EE->config->item('allow_username_change') != 'y' AND $this->session->userdata('group_id') != 1)
		{
			if ($_POST['current_password'] == '')
			{
				$this->functions->redirect(BASE.AMP.'C=myaccount'.AMP.'M=username_password'.AMP.'id='.$this->id);
			}

			$_POST['username'] = $_POST['current_username'];
		}
*/

		// validate for unallowed blank values
		if (empty($_POST)) {
			//show_error($this->lang->line('unauthorized_access'));

		}

		// If the screen name field is empty, we'll assign is from the username field.
		if ($_POST['screen_name'] == '') {
			$_POST['screen_name'] = $_POST['username'];
		}

		// Validate submitted data

		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate' . EXT;
		}

		// Fetch member data
		$query = $this->EE->member_model->get_member_data($this->id, array('username', 'screen_name'));

		$this->VAL = new EE_Validate(
			array(
				'member_id'            => $this->id,
				'val_type'             => 'update', // new or update
				'fetch_lang'           => FALSE,
				'require_cpw'          => ($this->EE->session->userdata('can_admin_members')) ? FALSE : TRUE,
				'enable_log'           => TRUE,
				'username'             => $_POST['username'],
				'cur_username'         => $query->row('username'),
				'screen_name'          => $_POST['screen_name'],
				'cur_screen_name'      => $query->row('screen_name'),
				'password'             => $_POST['password'],
				'password_confirm'     => $_POST['password_confirm'],
				'cur_password'         => $_POST['current_password']
			)
		);

		$this->VAL->validate_screen_name();

		if ($this->EE->config->item('allow_username_change') == 'y') // OR $this->session->userdata('group_id') == 1)
		{
			$this->VAL->validate_username();
		}

		if ($_POST['password'] != '') {
			$this->VAL->validate_password();
		}

		// Display errors if there are any
		if (count($this->VAL->errors) > 0) {
			return array('result' => 'failed',
			             'errors' => $this->VAL->errors);
		}

		if ($save) {

			// Update "last post" forum info if needed

			if ($query->row('screen_name') != $_POST['screen_name'] AND $this->EE->config->item('forum_is_installed') == "y") {
				$this->EE->db->where('forum_last_post_author_id', $this->id);
				$this->EE->db->update('forums', array('forum_last_post_author' =>
				                                      $_POST['screen_name']));

				$this->EE->db->where('mod_member_id', $this->id);
				$this->EE->db->update('forum_moderators', array('mod_member_name' =>
				                                                $_POST['screen_name']));
			}

			// Assign the query data

			$data['screen_name'] = $_POST['screen_name'];

			if ($this->EE->config->item('allow_username_change') == 'y') // OR $this->EE->session->userdata('group_id') == 1)
			{
				$data['username'] = $_POST['username'];
			}

			// Was a password submitted?

			$pw_change = FALSE;

			if ($_POST['password'] != '') {
				$this->EE->load->helper('security');

				// ============================
				// = Password security update =
				// ============================
				$this->EE->load->library('auth');
				$this->EE->auth->update_password($this->id,
					$_POST['password']);
				/*
				if ($this->id == $this->session->userdata('member_id'))
				{
					$pw_change = TRUE;
				}
				*/
			}

			$this->EE->member_model->update_member($this->id, $data);

			$installed_modules = $this->EE->addons->get_installed('modules');


			if (isset($installed_modules['comment'])) {
				if ($query->row('screen_name') != $_POST['screen_name']) {
					$query = $this->EE->member_model->get_member_data($this->id, array('screen_name'));

					$screen_name = ($query->row('screen_name') != '') ? $query->row('screen_name') : '';

					// Update comments with current member data

					$data = array('name' => ($screen_name != '') ? $screen_name : $_POST['username']);

					$this->EE->db->where('author_id', $this->id);
					$this->EE->db->update('comments', $data);
				}
			}

		}
	}


	/**
	 * Update Email Preferences
	 */

	function update_email($save = TRUE)
	{
		// validate for unallowed blank values
		if (empty($_POST)) {
			show_error($this->lang->line('unauthorized_access'));
		}

		// if this is a super admin changing stuff, don't worry
		// about this db call since it won't be used anyhow
		$current_email = '';
		/*
if ($this->session->userdata('group_id') != 1)
		{
			// what's this users current email?
			$query = $this->member_model->get_member_data($this->id, array('email'));
			$current_email = $query->row('email');
		}
*/

		//	Validate submitted data
		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate' . EXT;
		}

		$this->VAL = new EE_Validate(
			array(
				'member_id'            => $this->id,
				'val_type'             => 'update', // new or update
				'fetch_lang'           => FALSE,
				'require_cpw'          => ($current_email == $_POST['email'] || $this->EE->session->userdata('can_admin_members')) ? FALSE : TRUE,
				'enable_log'           => TRUE,
				'email'                => $_POST['email'],
				'cur_email'            => $current_email,
				'cur_password'         => $_POST['current_password']
			)
		);

		$this->VAL->validate_email();

		if (count($this->VAL->errors) > 0) {
			return array('result' => 'failed',
			             'errors' => $this->VAL->errors);
		}

		if ($save) {
			// Assign the query data
			$data = array(
				'email'                   => $_POST['email'],
				'accept_admin_email'      => (isset($_POST['accept_admin_email'])) ? 'y' : 'n',
				'accept_user_email'       => (isset($_POST['accept_user_email'])) ? 'y' : 'n',
				'notify_by_default'       => (isset($_POST['notify_by_default'])) ? 'y' : 'n',
				'notify_of_pm'            => (isset($_POST['notify_of_pm'])) ? 'y' : 'n',
				'smart_notifications'     => (isset($_POST['smart_notifications'])) ? 'y' : 'n'
			);

			$this->EE->member_model->update_member($this->id, $data);


			//////////////////

			$this->EE->load->library('addons');

			$installed_modules = $this->EE->addons->get_installed('modules');

			if (isset($installed_modules['comment'])) {
				//	Update comments and log email change
				if ($current_email != $_POST['email']) {
					$this->EE->db->where('author_id', $this->id);
					$this->EE->db->update('comments', array('email' => $_POST['email']));

					//$this->logger->log_action($this->VAL->log_msg);
				}
			}

			//$id = ($this->id != $this->session->userdata('member_id')) ? AMP.'id='.$this->id : '';

			//$this->session->set_flashdata('message_success', $this->lang->line('settings_updated'));
			//$this->functions->redirect(BASE.AMP.'C=myaccount'.AMP.'M=email_settings'.$id);
		}
	}


	/**
	 *     Update Member Group
	 */
	function member_group_update()
	{
		//update member status based on membergroup
		$this->update_member_status($_POST['group_id']);
		// 	
		$data['group_id'] = $_POST['group_id'];
		$this->EE->member_model->update_member($this->id, $data);

	}

	function sync_member_status($member_id)
	{
		if ($member_id != 0) {
			$member_query = $this->EE->db->select('group_id')->where(array('member_id'=> $member_id))->get('members');
			if ($member_query->num_rows() > 0) {
				$group_id = $member_query->row()->group_id;
				$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id($member_id);
				if ($entry_id) {
					$this->EE->zoo_visitor_cp->entry_id = $entry_id;
					$this->EE->zoo_visitor_cp->id       = $member_id;
					$this->EE->zoo_visitor_cp->update_member_status($group_id);
				}
			}
		}
	}

	function update_member_status($membergroup_id)
	{

		if (!isset($this->zoo_settings['membergroup_as_status']) || $this->zoo_settings['membergroup_as_status'] != 'no') {

			$group_query = $this->EE->member_model->get_member_groups(array(), array('group_id' => $membergroup_id));

			if ($group_query->num_rows() > 0) {
				//check if status exists, if not, insert
				$this->check_membergroup_status($group_query->row()->group_title, $group_query->row()->group_id);

				$status = format_status($group_query->row()->group_title, $group_query->row()->group_id);
				$this->EE->db->where('entry_id', $this->entry_id);
				$this->EE->db->update('channel_titles', array('status' => $status));
			}
		}
	}

	function check_membergroup_status($group_title, $group_id)
	{
		$status = format_status($group_title, $group_id);
		//check if membergroup exists is statusses?
		//get statusgroup
		$query_statusgroups = $this->EE->db->select('group_id')->where('group_name', 'Zoo Visitor Membergroup')->get('status_groups'); //->where('site_id',$this->EE->config->item('site_id'))->get('status_groups');

		if ($query_statusgroups->num_rows() > 0) {
			//check existence 
			$query_statusses = $this->EE->db->select('status')->where('status', $status)->where('group_id', $query_statusgroups->row()->group_id)->get('statuses'); //->where('site_id',$this->EE->config->item('site_id'))->get('statuses');
			if ($query_statusses->num_rows() == 0) {
				//status does not exist in group -> insert
				$this->EE->db->insert('statuses', array('status'   => $status,
				                                        'group_id' => $query_statusgroups->row()->group_id,
				                                        'site_id'  => $this->EE->config->item('site_id')));
			}
		}
	}

	function update_membergroup_status($membergroup_name, $group_id, $new_group_id = 0)
	{


		//group_id is not set, this is a new membergroup, get next auto_increment value
		if (empty($group_id)) {
			$query    = $this->EE->db->query("SELECT MAX(group_id) as max_group FROM exp_member_groups");
			$group_id = $query->row('max_group') + 1;
		}

		$status = format_status($membergroup_name, $group_id);
		$exists = FALSE;
		//check based on $group_id if the status exists
		$query_statusgroups = $this->EE->db->select('group_id')->where('group_name', 'Zoo Visitor Membergroup')->get('status_groups'); //->where('site_id',$this->EE->config->item('site_id'))->get('status_groups');

		if ($query_statusgroups->num_rows() > 0) {

			$query_statusses = $this->EE->db->select('status, status_id')->where('group_id', $query_statusgroups->row()->group_id)->get('statuses'); //->where('site_id',$this->EE->config->item('site_id'))->get('statuses');
			if ($query_statusses->num_rows() > 0) {
				foreach ($query_statusses->result() as $row) {
					$status_id = explode('-id', $row->status);
					//status exists => update
					if ($status_id[1] == $group_id) {

						if ($new_group_id != 0) {
							$new_membergroup = $this->EE->db->select('*')->where('group_id', $new_group_id)->where('site_id', $this->EE->config->item('site_id'))->get('member_groups');
							$status          = format_status($new_membergroup->row()->group_title, $new_group_id);
						}

						$this->EE->db->update('statuses', array("status" => $status), "status_id = '" . $row->status_id . "'");
						$this->EE->db->update('channel_titles', array("status" => $status), "status = '" . $row->status . "'");
						$exists = TRUE;
						break;
					}
				}

				if (!$exists) {
					$this->EE->db->insert('statuses', array('status'       => $status,
					                                        'group_id'     => $query_statusgroups->row()->group_id,
					                                        'site_id'      => $this->EE->config->item('site_id'),
					                                        'status_order' => '0',
					                                        'highlight'    => ''));
				}

			}
		}

	}

	// --------------------------------------------------------------------

	function sync_back_to_member($entry_id)
	{
		//COMPARE CHANNEL FIELD NAMES AND MEMBER FIELD NAME
		//SYNC THE ONES WITH SAME NAME 
		// member_firstname field_id 164 -> 2 // member_lastname field_id 165 -> 3 // membership type field_id 313 -> 28 // member_receive_newsletter field_id_329 -> 26 

		$do_sync = FALSE;

		if ($this->EE->config->item('visitor_sync_back_to_member') == "y") {
			$do_sync     = TRUE;
			$sync_fields = $this->EE->config->item('visitor_sync_back_fields');
		}

		if ($do_sync) {
			$this->EE->db->where('entry_id', $entry_id);
			$this->EE->db->select('*');
			$qmem = $this->EE->db->get('channel_titles');

			if ($qmem->num_rows() > 0) {
				$row_mem = $qmem->row_array();

				$member_id = $row_mem['author_id'];

				$this->EE->db->where('entry_id', $entry_id);
				$this->EE->db->select('*');
				$q = $this->EE->db->get('channel_data');

				if ($q->num_rows() > 0) {
					$row = $q->row_array();

					$data = array();

					foreach ($sync_fields as $e_field_id => $m_field_id) {
						$data['m_field_id_' . $m_field_id] = $row['field_id_' . $e_field_id];
					}

					$this->EE->db->where('member_id', $member_id);
					$this->EE->db->update('member_data', $data);


					$results = $this->EE->db->query("SELECT class FROM " . $this->EE->db->dbprefix('extensions') . " WHERE class = 'Campaigner_ext'");
					if ($results->num_rows > 0) {
						$this->campaigner_sync($member_id);
					}

				}

			}
		}
	}

	function campaigner_sync($member_id)
	{
		require_once PATH_THIRD . 'campaigner/ext.campaigner' . EXT;

		$camp = new Campaigner_ext();
		$camp->subscribe_member($member_id, TRUE);

	}


}

?>