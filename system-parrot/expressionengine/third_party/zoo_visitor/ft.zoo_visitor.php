<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
require_once PATH_THIRD . 'zoo_visitor/config.php';

class Zoo_visitor_ft extends EE_Fieldtype
{

	var $info = array(
		'name'    => ZOO_VISITOR_NAME,
		'version' => ZOO_VISITOR_VER
	);
	var $class_name = ZOO_VISITOR_CLASS;

	// Parser Flag (preparse pairs?)
	var $has_array_data = TRUE;

	/**
	 * Constructor
	 *
	 * @access    public
	 */
	function Zoo_visitor_ft()
	{
		if ((version_compare(APP_VER, '2.6.0', '<'))) {
			parent::EE_Fieldtype();
		} else {
			EE_Fieldtype::__construct();
		}

		$this->EE->load->add_package_path(PATH_THIRD . 'zoo_visitor/');
		$this->EE->load->library('zoo_visitor_lib');
		$this->EE->load->helper('zoo_visitor');
		$this->EE->lang->loadfile('zoo_visitor');
		$this->zoo_settings = get_zoo_settings($this->EE);

		if (REQ == 'CP') {
			$this->EE->cp->add_to_head('<link rel="stylesheet" href="' . _theme_url($this->EE) . 'css/zoo_visitor.css" type="text/css" media="screen" /> ');
		}
	}


	// --------------------------------------------------------------------

	function display_field($data)
	{

		if ($this->EE->session->userdata['can_admin_members'] == 'y') {
			$entry_id   = isset($_GET['entry_id']) ? $_GET['entry_id'] : 0; //isset($this->EE->uri->config->_global_vars['gv_get_entry_id']) ? $this->EE->uri->config->_global_vars['gv_get_entry_id'] : 0;
			$channel_id = $_GET['channel_id']; //$this->EE->uri->config->_global_vars['gv_get_channel_id'];

			if (!isset($this->zoo_settings['member_channel_id']) || $this->zoo_settings['member_channel_id'] != $channel_id) {
				return "This channel is not linked with member profiles";
			} else {

				$member = $this->EE->zoo_visitor_lib->get_member_id($entry_id);

				if ($member == FALSE) {
					return $this->add_form();
				} else {
					return $this->edit_form($member);
				}

			}
		} else {
			return '<div class="notice">' . lang('zoo_visitor_error_can_admin_members') . '</div>';
		}
	}

	function add_form()
	{
		//use when publishing new entry or when member hasn't been linked with entry
		//group, username, screen_name, email, password, confirm password
		//OR dropdown with members
		//validate to see if the user hasn't been linked yet.
		//current member_id
		$member_id = form_input(array(
			'name'  => "EE_member_id",
			'id'    => "EE_member_id",
			'value' => '',
			'dir'   => $this->settings['field_text_direction'],
			'style' => 'display:none;'
		));

		//get current email
		$email = '<label>Email:</label>' . form_input(array(
				'name'  => "EE_email",
				'id'    => "EE_email",
				'value' => isset($_POST['EE_email']) ? $_POST['EE_email'] : '',
				'dir'   => $this->settings['field_text_direction']
			));

		//get current screen_name
		$screen_name_style = ($this->zoo_settings['use_screen_name'] == "no") ? 'display:none;' : '';
		$screen_name       = '<div style=' . $screen_name_style . '><label>Screen name:</label>' . form_input(array(
				'name'  => "EE_screen_name",
				'id'    => "EE_screen_name",
				'value' => isset($_POST['EE_screen_name']) ? $_POST['EE_screen_name'] : '',
				'dir'   => $this->settings['field_text_direction']
			)) . '</div>';

		//get current username
		$username_style = ($this->zoo_settings['email_is_username'] == 'yes') ? 'display:none;' : '';
		$username       = '<div style=' . $username_style . '><label>Username:</label>' . form_input(array(
				'name'  => "EE_username",
				'id'    => "EE_username",
				'value' => isset($_POST['EE_username']) ? $_POST['EE_username'] : '',
				'dir'   => $this->settings['field_text_direction']
			)) . '</div>';

		//get current member group
		$unlocked_groups = $this->EE->zoo_visitor_lib->get_member_groups();
		if ($this->EE->cp->allowed_group('can_admin_mbr_groups') && count($unlocked_groups) > 0) {
			$groupSel = isset($_POST['EE_group_id']) ? $_POST['EE_group_id'] : $this->EE->config->item('default_member_group');
			$group    = '<label>Member group:</label>' . form_dropdown('EE_group_id', $this->EE->zoo_visitor_lib->get_member_groups(), $groupSel, 'style="width:100%;"');

		} else {
			$group = '<div style="display:none;"><label>Member group:</label>' . form_input(array(
					'name'  => "EE_group_id",
					'id'    => "EE_group_id",
					'value' => '4',
					'dir'   => $this->settings['field_text_direction']
				)) . '</div>';
		}
		//new password
		$password = '<label>Password:</label>' . form_password(array(
				'name'         => "EE_password",
				'id'           => "EE_password",
				'autocomplete' => "off",
				'value'        => isset($_POST['EE_password']) ? $_POST['EE_password'] : '',
				'dir'          => $this->settings['field_text_direction']
			));

		//confirm new password
		$confirm_password = '<label>Confirm password:</label>' . form_password(array(
				'name'         => "EE_new_password_confirm",
				'id'           => "EE_new_password_confirm",
				'autocomplete' => "off",
				'value'        => isset($_POST['EE_new_password_confirm']) ? $_POST['EE_new_password_confirm'] : '',
				'dir'          => $this->settings['field_text_direction']
			));

		if ((isset($this->zoo_settings['hide_link_to_existing_member']) && $this->zoo_settings['hide_link_to_existing_member'] != 'yes') || $this->EE->session->userdata('group_id') == '1') {
			$anon_mem = (isset($this->zoo_settings['anonymous_member_id'])) ? $this->zoo_settings['anonymous_member_id'] : 0;

			//Get all member_id's 
			$sql         = "SELECT mem.member_id, mem.screen_name, mem.email FROM exp_members mem WHERE mem.member_id != '" . $anon_mem . "'";
			$q_mem       = $this->EE->db->query($sql);
			$all_members = array();

			foreach ($q_mem->result_array() as $member) {
				$all_members[$member['member_id']] = $member['screen_name'] . ' (' . $member['email'] . ')';
			}

			//get members who already have a Visitor profile
			$sql          = "SELECT ct.author_id FROM exp_channel_titles ct WHERE ct.channel_id = '" . $this->zoo_settings['member_channel_id'] . "'";
			$q_visitor    = $this->EE->db->query($sql);
			$all_visitors = array();

			foreach ($q_visitor->result_array() as $entry) {
				$all_visitors[$entry['author_id']] = $entry;
			}

			$memberData[''] = 'Select a member';
			$memberData += array_diff_key($all_members, $all_visitors);

			$members = (count($memberData) > 1) ? '<b>OR Link an existing member:</b><br/><br/>' . form_dropdown('EE_existing_member_id', $memberData, '') . '</b>' : '';

		} else {
			$members = '';
		}


		$hide_title = '<script>$(document).ready(function() {  $("#title").val("temp"); $("#author").parent().parent().parent().hide();$("#title").parent().parent().parent().children("#sub_hold_field_title").hide();$("#title").parent().parent().parent().children("label").children("span").children(".required").html("");$("#url_title").parent().parent().parent().hide(); $("#hold_field_title").hide(); $("#hold_field_url_title").hide(); });</script>';

		$member_id_input = form_input($this->field_name, '', 'id="' . $this->field_name . '" style="display: none;"');

		return $member_id_input . '<div class="zoo_visitor_ft_left"><b>Create a new member:</b><br/><br/>' . $group . $member_id . $username . $email . $screen_name . $password . $confirm_password . '</div><div class="zoo_visitor_ft_right">' . $members . '</div><div style="clear:left;"></div>' . $hide_title;


	}

	function edit_form($member)
	{

		$own_account = ($this->EE->session->userdata('member_id') == $member->member_id) ? '<br/><b>Warning: this is your own account</b>' : '';

		//current member_id
		$member_id = form_input(array(
			'name'  => "EE_member_id",
			'id'    => "EE_member_id",
			'value' => $member->member_id,
			'dir'   => $this->settings['field_text_direction'],
			'style' => 'display:none;'
		));

		//get current email
		$email = '<label>Email:</label>' . form_input(array(
				'name'  => "EE_email",
				'id'    => "EE_email",
				'value' => $member->email,
				'dir'   => $this->settings['field_text_direction']
			)) . form_input(array(
				'name'  => "EE_current_email",
				'id'    => "EE_current_email",
				'value' => $member->email,
				'dir'   => $this->settings['field_text_direction'],
				'style' => 'display:none;'
			));

		//get current screen_name
		$screen_name_style = ($this->zoo_settings['use_screen_name'] == "no") ? 'display:none;' : '';
		$screen_name       = '<div style=' . $screen_name_style . '><label>Screen name:</label>' . form_input(array(
				'name'  => "EE_screen_name",
				'id'    => "EE_screen_name",
				'value' => $member->screen_name,
				'dir'   => $this->settings['field_text_direction']
			)) . form_input(array(
				'name'  => "EE_current_screen_name",
				'id'    => "EE_current_screen_name",
				'value' => $member->screen_name,
				'dir'   => $this->settings['field_text_direction'],
				'style' => 'display:none;'
			)) . '</div>';

		//get current username
		$username_style = ($this->zoo_settings['email_is_username'] == 'yes') ? 'display:none;' : '';
		$username       = '<div style=' . $username_style . '><label>Username:</label>' . form_input(array(
				'name'  => "EE_username",
				'id'    => "EE_username",
				'value' => $member->username,
				'dir'   => $this->settings['field_text_direction']
			)) . form_input(array(
				'name'  => "EE_current_username",
				'id'    => "EE_current_username",
				'value' => $member->username,
				'dir'   => $this->settings['field_text_direction'],
				'style' => 'display:none;'
			)) . '</div>';

		//get current member group
		if ($this->EE->cp->allowed_group('can_admin_mbr_groups')) {
			$groups = $this->EE->zoo_visitor_lib->get_member_groups();

			if ($member->group_id == 1 && $this->EE->session->userdata('group_id') != 1) {
				$group = '<div style="display:none;"><label>Member group:</label>' . form_input(array(
						'name'  => "EE_group_id",
						'id'    => "EE_group_id",
						'value' => $member->group_id,
						'dir'   => $this->settings['field_text_direction']
					)) . "</div>";
			} elseif (!empty($groups)) {
				if (!in_array($member->group_id, $groups)) {
					$current_group = $this->EE->member_model->get_member_groups('', array('group_id' => $member->group_id));

					$groups[$member->group_id] = $current_group->first_row()->group_title;
				}
				$group = '<label>Member group:</label>' . form_dropdown('EE_group_id', $groups, $member->group_id);
			} else {
				$group = '<div style="display:none;"><label>Member group:</label>' . form_input(array(
						'name'  => "EE_group_id",
						'id'    => "EE_group_id",
						'value' => $member->group_id,
						'dir'   => $this->settings['field_text_direction']
					)) . "</div>";
			}

		} else {
			$group = '<div style="display:none;"><label>Member group:</label>' . form_input(array(
					'name'  => "EE_group_id",
					'id'    => "EE_group_id",
					'value' => $member->group_id,
					'dir'   => $this->settings['field_text_direction']
				)) . "</div>";
		}
		//current password

		if ($this->EE->session->userdata('group_id') == 1 || $this->EE->cp->allowed_group('can_admin_members')) {
			$current_password = '';
		} else {
			$current_password = '<label>Current member password:</label>' . form_password(array(
					'name'         => "EE_current_password",
					'id'           => "EE_current_password",
					'value'        => '',
					'autocomplete' => "off",
					'dir'          => $this->settings['field_text_direction']
				));
		}
		//new password
		$new_password = '<label>New password:</label>' . form_password(array(
				'name'         => "EE_new_password",
				'id'           => "EE_new_password",
				'value'        => '',
				'autocomplete' => "off",
				'dir'          => $this->settings['field_text_direction']
			));
		//confirm new password
		$confirm_new_password = '<label>Confirm new password:</label>' . form_password(array(
				'name'         => "EE_new_password_confirm",
				'id'           => "EE_new_password_confirm",
				'value'        => '',
				'autocomplete' => "off",
				'dir'          => $this->settings['field_text_direction']
			));

		// ====================================
		// = Administrative Member functions  =
		// ====================================
		$this->EE->lang->loadfile('myaccount');

		$email_member = '';
		if ($member->member_id != $this->EE->session->userdata('member_id')) {
			$email_member = '<a href="' . BASE . AMP . 'C=tools_communicate' . AMP . 'email_member=' . $member->member_id . '" class="email">' . lang('member_email') . ' &raquo;</a>';
		}

		$login_as_member = '';
		if ($this->EE->session->userdata('group_id') == 1 && $member->member_id != $this->EE->session->userdata('member_id')) {
			$login_as_member = '<a href="' . BASE . AMP . 'C=members' . AMP . 'M=login_as_member' . AMP . 'mid=' . $member->member_id . '" class="login">' . lang('login_as_member') . ' &raquo;</a>';
		}

		$resend_activation = '';
		if ($member->member_id != $this->EE->session->userdata('member_id') && $this->EE->config->item('req_mbr_activation') == 'email' && $this->EE->cp->allowed_group('can_admin_members')) {
			$resend_activation = '';
		}

		$delete_member = '';
		if ($this->EE->cp->allowed_group('can_delete_members') AND $member->member_id != $this->EE->session->userdata('member_id')) {
			if ($member->group_id == '1' AND $this->EE->session->userdata('group_id') != '1') {

			} else {
				$delete_member = '<a href="' . BASE . AMP . 'C=members' . AMP . 'M=member_delete_confirm' . AMP . 'mid=' . $member->member_id . '" class="delete">' . lang('delete') . ' &raquo;</a>';
			}
			//$delete_member = '<a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=zoo_visitor'.AMP.'method=delete'.AMP.'mid='.$member->member_id.'" class="delete">'.lang('delete').' &raquo;</a>';


		}

		$join_date       = (version_compare(APP_VER, '2.6.0', '<')) ? $this->EE->localize->set_human_time($member->join_date) : $this->EE->localize->human_time($member->join_date);
		$last_visit_date = (version_compare(APP_VER, '2.6.0', '<')) ? $this->EE->localize->set_human_time($member->last_visit) : $this->EE->localize->human_time($member->last_visit);

		$join_data  = '<br/><b>' . lang('join_date') . '</b>: ' . $join_date . '<br/><br/>';
		$last_visit = ($member->last_visit == 0 OR $member->last_visit == '') ? '--' : $last_visit_date;
		$last_visit = '<b>' . lang('last_visit') . '</b>: ' . $last_visit . '<br/>';

		if ($this->EE->cp->allowed_group('can_admin_members')) {
			$member_functionality       = $email_member . $login_as_member . $delete_member;
			$member_functionality_title = ($member_functionality != '') ? '<h3>' . lang('administrative_options') . ':</h3>' : '';

		}

		$hide_title = '<script>$(document).ready(function() { ;$("#title").parent().parent().parent().children("#sub_hold_field_title").hide();$("#title").parent().parent().parent().children("label").children("span").children(".required").html("");  $("#author").parent().parent().parent().hide();  $("#url_title").parent().parent().parent().hide();$("#hold_field_title").hide(); $("#hold_field_url_title").hide();  });</script>';


		return '<div class="zoo_visitor_ft_left"><h3>' . lang('personal_settings') . ':</h3>' . $member_id . $group . $email . $screen_name . $username . $current_password . $new_password . $confirm_new_password . $own_account . $hide_title . '</div> <div class="zoo_visitor_ft_right">' . $member_functionality_title . $member_functionality . $join_data . $last_visit . '</div>';

	}

	// --------------------------------------------------------------------

	function validate($data)
	{


		if (REQ != 'CP') {
			//request comes from frontend SafeCracker, validation is done in extension
			return TRUE;
		} else {
			//TODO, custom member fields, for example campaigner triggers
			//edit POST title with email

			$this->prepare_post();

			//member has been linked
			if (isset($_POST['EE_member_id']) && $_POST['EE_member_id'] != 0 && $_POST['EE_member_id'] != '') {

				if ($_POST['EE_current_email'] != $_POST['EE_email']) {
					$result = $this->EE->zoo_visitor_cp->update_email(FALSE);
					if ($result['result'] == 'failed') {
						return $this->showError($result);
					}
				}
				//&& $this->zoo_settings['email_is_username'] == "no"
				if (($_POST['EE_current_username'] != $_POST['EE_username']) || $_POST['EE_new_password'] != '' || ($_POST['EE_current_screen_name'] != $_POST['EE_screen_name'] && $this->zoo_settings['use_screen_name'] == "yes")) {

					$result = $this->EE->zoo_visitor_cp->update_username_password(FALSE);

					if ($result['result'] == 'failed') {
						return $this->showError($result);
					}
				}

			} else {
				//member has not been linked yet
				if (isset($_POST['EE_existing_member_id']) && $_POST['EE_existing_member_id'] != 0 && $_POST['EE_existing_member_id'] != '') {
					//existing member has been selected, valid
					//set member as entry author id 
					//$_POST['author'] = $_POST['EE_existing_member_id']; 


					return TRUE;
				} else {

					$result = $this->EE->zoo_visitor_cp->validate_member($this->zoo_settings['use_screen_name']);
					if ($result['result'] == 'failed') {
						return $this->showError($result);
					}
				}
			}

			return TRUE;
		}
	}

	function post_save($data)
	{

		//PREFIX THESE FIELDS with member_

//CHECK IF THERE ARE ANY MATCHING CUSTOM MEMBER FIELD NAMES OR STANDARD FIELDS LIKE signature, url, location etc...
// If this is a CP request, we have to run through field_id's

		//get custom member field names -> query
		//array of native fields like signature

		//run through posted field_id_x to see if it matches any of the above fields, if it does, save it.

		if (isset($_POST)) {
			//sync back to member, for certain add-ons

			$this->EE->zoo_visitor_cp->sync_back_to_member($this->settings['entry_id']);

			if (REQ != 'CP' && REQ != 'PAGE') {
				//request comes from frontend SafeCracker, validation is done in extension
				return TRUE;
			} else {

				$this->prepare_post();

				$this->EE->zoo_visitor_cp->entry_id = $this->settings['entry_id'];

				//member has been already been linked, update the details
				if (isset($_POST['EE_member_id']) && $_POST['EE_member_id'] != 0 && $_POST['EE_member_id'] != '') {

					$ft_action = "update";

					//set member_id, needed as field value
					$member_id = $_POST['EE_member_id'];
					//save email if it has been saved
					if ($_POST['EE_current_email'] != $_POST['EE_email']) {
						$this->EE->zoo_visitor_cp->update_email(TRUE);
					}
					//save username or password or screen_name
					//&& $this->zoo_settings['email_is_username'] == "no"
					if (($_POST['EE_current_username'] != $_POST['EE_username']) || $_POST['EE_new_password'] != '' || ($_POST['EE_current_screen_name'] != $_POST['EE_screen_name'] && $this->zoo_settings['use_screen_name'] == "yes")) {
						$this->EE->zoo_visitor_cp->update_username_password(TRUE);
					}

					if (isset($_POST['group_id']) && $_POST['group_id'] != 0 && $_POST['group_id'] != '') {
						$this->EE->zoo_visitor_cp->member_group_update();
					}

				} else {

					$ft_action = "register";

					if (isset($_POST['EE_existing_member_id']) && $_POST['EE_existing_member_id'] != 0 && $_POST['EE_existing_member_id'] != '') {
						$member_id = $_POST['EE_existing_member_id'];
					} else {
						//register member

						$member_id = $this->EE->zoo_visitor_cp->register_member();
					}

					//set member as author of this entry
					$this->EE->db->query("UPDATE exp_channel_titles SET author_id = '" . $member_id . "' WHERE channel_id='" . $this->zoo_settings['member_channel_id'] . "' AND entry_id = '" . $this->settings['entry_id'] . "'");
					//sync the membergroup status
					$this->EE->zoo_visitor_cp->sync_member_status($member_id);

				}

				//update zoo_visitor field to contain the member_id
				if (strpos($this->field_name, 'field_id_')) {
					$field = $this->field_name;
				} else {
					$field = 'field_id_' . $this->field_id;
				}

				$this->EE->db->query("UPDATE exp_channel_data SET " . $field . " = '" . $member_id . "' WHERE entry_id = '" . $this->settings['entry_id'] . "'");

				//sync the screen_name based on the provided override fields
				if ($this->zoo_settings['use_screen_name'] == "no" && $this->zoo_settings['screen_name_override'] != '') {
					$this->EE->zoo_visitor_lib->update_screen_name($member_id);
				}

				$this->EE->zoo_visitor_lib->update_entry_title($this->settings['entry_id']);

				$this->EE->zoo_visitor_lib->update_native_member_fields($member_id, $this->settings['entry_id']);


				// ========================
				// = ZOO VISITOR CP HOOKS =
				// ========================
				if ($ft_action == "update") {
					// -------------------------------------------
					// 'zoo_visitor_cp_update' hook.
					//  - Additional processing when a member is updated through the Control Panel entry
					//
					$hook_data = $_POST;
					$edata     = $this->EE->extensions->call('zoo_visitor_cp_update_end', $hook_data, $member_id);
					if ($this->EE->extensions->end_script === TRUE) return;
				}

				if ($ft_action == "register") {
					// -------------------------------------------
					// 'zoo_visitor_cp_register' hook.
					//  - Additional processing when a member is created through the Control Panel entry publish
					//
					$hook_data = $_POST;
					$edata     = $this->EE->extensions->call('zoo_visitor_cp_register_end', $hook_data, $member_id);
					if ($this->EE->extensions->end_script === TRUE) return;
				}

			}
		}
	}

	// --------------------------------------------------------------------

	function showError($result)
	{

		$this->EE->load->language('member');
		$this->EE->load->language('myaccount');
		$return = '';
		foreach ($result['errors'] as $error) {

			$return .= $this->EE->lang->line($error) . '<br/>';
		}

		return $return;

	}

	// --------------------------------------------------------------------

	function prepare_post()
	{

		//get existing member data to set as entry title
		if (isset($_POST['EE_existing_member_id']) && $_POST['EE_existing_member_id'] != 0 && $_POST['EE_existing_member_id'] != '') {

		} else {

			if ($this->zoo_settings['email_is_username'] == 'yes') {
				$_POST['EE_username'] = (isset($_POST['EE_email'])) ? $_POST['EE_email'] : "";
			}
			if ($this->zoo_settings['use_screen_name'] == "no") {
				$_POST['EE_screen_name'] = (isset($_POST['EE_username'])) ? $_POST['EE_username'] : "";
			}

			$_POST['email']            = isset($_POST['EE_email']) ? $_POST['EE_email'] : '';
			$_POST['username']         = isset($_POST['EE_username']) ? $_POST['EE_username'] : '';
			$_POST['current_username'] = isset($_POST['EE_current_username']) ? $_POST['EE_current_username'] : '';
			$_POST['password']         = isset($_POST['EE_new_password']) ? $_POST['EE_new_password'] : '';
			$_POST['password_confirm'] = isset($_POST['EE_new_password_confirm']) ? $_POST['EE_new_password_confirm'] : '';
			$_POST['current_password'] = isset($_POST['EE_current_password']) ? $_POST['EE_current_password'] : '';
			$_POST['screen_name']      = isset($_POST['EE_screen_name']) ? $_POST['EE_screen_name'] : '';
			$_POST['group_id']         = isset($_POST['EE_group_id']) ? $_POST['EE_group_id'] : '';

			//member passwords for publish, not update
			$_POST['password']         = isset($_POST['EE_password']) ? $_POST['EE_password'] : $_POST['password'];
			$_POST['password_confirm'] = isset($_POST['EE_password_confirm']) ? $_POST['EE_password_confirm'] : $_POST['password_confirm'];

			$this->EE->zoo_visitor_cp->id = isset($_POST['EE_member_id']) ? $_POST['EE_member_id'] : '';

		}
		////

		if ($this->zoo_settings['title_override'] != '') {
			$title = '';

			$title  = $this->zoo_settings['title_override'];
			$fields = array_reverse($_POST);
			foreach ($fields as $key => $val) {
				if (is_string($val)) $title = str_replace($key, $val, $title);
			}


			// ========================================================
			// = if custom fields are empty, fall back to screenname  =
			// ========================================================
			$title = (str_replace(' ', '', $title) == "") ? $_POST['screen_name'] : $title;

		} else {
			// $title = $member->email;
			//
			// if($this->zoo_settings['email_is_username'] != 'yes')
			// {
			// 	$title .= $member->username;
			// }
			// if($this->zoo_settings['use_screen_name'] != "no")
			// {
			$title = $_POST['screen_name'];
			//}

		}
		////

		$_POST['title'] = ($title != '') ? $title : "temp"; //$_POST['email'].' // '.$_POST['username']; //$this->prepare_title();

	}

	/**
	 *    =============================
	 *    function zenbu_get_table_data
	 *    =============================
	 *    Retrieve data stored in other database tables
	 *    based on results from Zenbu's entry list
	 * @uses    Instead of many small queries, this function can be used to carry out
	 *            a single query of data to be later processed by the zenbu_display() method
	 *
	 * @param    $entry_ids                array    An array of entry IDs from Zenbu's entry listing results
	 * @param    $field_ids                array    An array of field IDs tied to/associated with result entries
	 * @param    $channel_id                int        The ID of the channel in which Zenbu searched entries (0 = "All channels")
	 * @param    $output_upload_prefs    array    An array of upload preferences
	 * @param    $settings                array    The settings array, containing saved field order, display, extra options etc settings
	 * @param    $rel_array                array    A simple array useful when using related entry-type fields (optional)
	 * @return    $output                    array    An array of data (typically broken down by entry_id then field_id) that can be used and processed by the zenbu_display() method
	 */
	function zenbu_get_table_data($entry_ids, $field_ids, $channel_id, $output_upload_prefs, $settings)
	{

		$output = array();
		if (empty($entry_ids) || empty($channel_id)) {
			return $output;
		}

		$output['entries'] = array();


		if (count($entry_ids) > 0) {
			$in_entry_ids = implode(',', $entry_ids);
			$sql          = 'SELECT group_title, entry_id, author_id, username, screen_name, email from exp_members mem LEFT JOIN exp_channel_titles ct ON (ct.author_id = mem.member_id) LEFT JOIN exp_member_groups gr on (gr.group_id=mem.group_id) WHERE ct.entry_id IN (' . $in_entry_ids . ')';
			$query        = $this->EE->db->query($sql);
			$output       = $query->result_array();
			// Create array for output
			if ($query->num_rows() > 0) {
				foreach ($query->result_array() as $row) {
					if (isset($output['memberdata'][$row['entry_id']]) === FALSE) $output['memberdata'][$row['entry_id']] = array();
					$output['memberdata'][$row['entry_id']] = $row;
				}
			}
		}
		return $output;
	}


	/**
	 *    ======================
	 *    function zenbu_display
	 *    ======================
	 *    Set up display in entry result cell
	 *
	 * @param    $entry_id            int        The entry ID of this single result entry
	 * @param    $channel_id            int        The channel ID associated to this single result entry
	 * @param    $data                array    Raw data as found in database cell in exp_channel_data
	 * @param    $table_data            array    Data array usually retrieved from other table than exp_channel_data
	 * @param    $field_id            int        The ID of this field
	 * @param    $settings            array    The settings array, containing saved field order, display, extra options etc settings
	 * @param    $rules                array    An array of entry filtering rules
	 * @param    $upload_prefs        array    An array of upload preferences (optional)
	 * @param     $installed_addons    array    An array of installed addons and their version numbers (optional)
	 * @param    $fieldtypes            array    Fieldtype of available fieldtypes: id, name, etc (optional)
	 * @return    $output        The HTML used to display data
	 */
	public function zenbu_display($entry_id, $channel_id, $field_data, $visitor_data = array(), $field_id, $settings, $rules = array(), $upload_prefs = array(), $installed_addons)
	{
		$extra_options = $settings['setting'][$channel_id]['extra_options'];

		$outputArr = array();

		if (isset($visitor_data['memberdata'][$entry_id])) {
			if (isset($extra_options['field_' . $field_id]['show_username']) && $extra_options['field_' . $field_id]['show_username'] == 'yes') {
				$outputArr[] = $visitor_data['memberdata'][$entry_id]['username'];
			}
			if (isset($extra_options['field_' . $field_id]['show_screen_name']) && $extra_options['field_' . $field_id]['show_screen_name'] == 'yes') {
				$outputArr[] = $visitor_data['memberdata'][$entry_id]['screen_name'];
			}
			if (isset($extra_options['field_' . $field_id]['show_email']) && $extra_options['field_' . $field_id]['show_email'] == 'yes') {
				$outputArr[] = $visitor_data['memberdata'][$entry_id]['email'];
			}
			if (isset($extra_options['field_' . $field_id]['show_member_group']) && $extra_options['field_' . $field_id]['show_member_group'] == 'yes') {
				$outputArr[] = $visitor_data['memberdata'][$entry_id]['group_title'];
			}
			if (empty($outputArr)) $outputArr[] = $visitor_data['memberdata'][$entry_id]['username'];
		}

		return implode('<br/>', $outputArr);

	}


	/**
	 *    ===================================
	 *    function zenbu_field_extra_settings
	 *    ===================================
	 *    Set up display for this fieldtype in "display settings"
	 *
	 * @param    $table_col            string    A Zenbu table column name to be used for settings and input field labels
	 * @param    $channel_id            int        The channel ID for this field
	 * @param    $extra_options        array    The Zenbu field settings, used to retieve pre-saved data
	 * @return    $output        The HTML used to display setting fields
	 */
	public function zenbu_field_extra_settings($table_col, $channel_id, $extra_options)
	{

		$option_label_array = array(
			'show_username'     => $this->EE->lang->line('zenbu_show_username'),
			'show_screen_name'  => $this->EE->lang->line('zenbu_show_screen_name'),
			'show_email'        => $this->EE->lang->line('zenbu_show_email'),
			'show_member_group' => $this->EE->lang->line('zenbu_show_member_group')
		);

		foreach ($option_label_array as $label => $lang_string) {
			$checked        = (isset($extra_options[$label])) ? TRUE : FALSE;
			$output[$label] = form_label(form_checkbox('settings[' . $channel_id . '][' . $table_col . '][' . $label . ']', 'yes', $checked) . '&nbsp;' . $lang_string) . '<br />';
		}

		return $output;
	}


	/**
	 *    ===================================
	 *    function zenbu_result_query
	 *    ===================================
	 *    Extra queries to be intergrated into main entry result query
	 *
	 * @param    $rules                int        An array of entry filtering rules
	 * @param    $field_id            array    The ID of this field
	 * @param    $fieldtypes            array    $fieldtype data
	 * @param    $already_queried    bool    Used to avoid using a FROM statement for the same field twice
	 * @return                    A query to be integrated with entry results. Should be in CI Active Record format ($this->EE->db->…)
	 */
	public function zenbu_result_query($rules = array(), $field_id = "", $fieldtypes, $already_queried = FALSE)
	{

		if (empty($rules)) {
			return;
		}

		if ($already_queried === FALSE) {
			$this->EE->db->from("exp_members");
		}

		$concat = 'username, screen_name, email';

		// Find member ids that have the keyword
		foreach ($rules as $rule) {
			$rule_field_id = (strncmp($rule['field'], 'field_', 6) == 0) ? substr($rule['field'], 6) : 0;
			if (isset($fieldtypes['fieldtype'][$rule_field_id]) && $fieldtypes['fieldtype'][$rule_field_id] == "zoo_visitor") {
				$keyword = $rule['val'];

				$keyword_query = $this->EE->db->query("/* Zenbu: Search Zoo Visitor */\nSELECT member_id FROM exp_members WHERE \nCONCAT_WS(',', " . $concat . ") \nLIKE '%" . $this->EE->db->escape_like_str($keyword) . "%'");

				$where_in = array();
				if ($keyword_query->num_rows() > 0) {
					foreach ($keyword_query->result_array() as $row) {
						$where_in[] = $row['member_id'];
					}
				}
			}
		}

		// If $keyword_query has hits, $where_in should not be empty.
		// In that case finish the query
		if (!empty($where_in)) {
			if ($rule['cond'] == "doesnotcontain") {
				// …then query entries NOT in the group of entries
				$this->EE->db->where_not_in("exp_channel_titles.author_id", $where_in);
			} else {
				$this->EE->db->where_in("exp_channel_titles.author_id", $where_in);
			}
		} else {
			// However, $keyword_query has no hits (like on an unexistent word), $where_in will be empty
			// Send no results for: "search field containing this unexistent word".
			// Else, just show everything, as obviously all entries will not contain the odd word
			if ($rule['cond'] == "contains") {
				$where_in[] = 0;
				$this->EE->db->where_in("exp_channel_titles.author_id", $where_in);
			}
		}


	}
}

?>