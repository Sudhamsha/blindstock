<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once PATH_THIRD . 'zoo_visitor/helpers/zoo_visitor_helper.php';

class Zoo_visitor_lib
{

	public $allowed_groups = '';

	/**
	 * Constructor
	 *
	 * @access public
	 */
	function Zoo_visitor_lib()
	{
		// Creat EE Instance
		$this->EE =& get_instance();
		$this->EE->load->model("member_model");
		$this->EE->load->library("logger");
		$this->EE->load->helper("url");

		$this->zoo_settings = get_zoo_settings($this->EE);

	}

	function get_visitor_id($member_id = 'current')
	{

		$this->EE =& get_instance();

		if ($member_id == 'current' || $member_id == '') {
			if (!isset($this->EE->session->userdata)) {
				//no session is available, this will handle trying to get the gloval var zoo_visitor_id when user is not logged in;
				$member_id = 0;
			} else {
				$member_id = $this->EE->session->userdata['member_id'];
			}
		}
		if ($member_id == 0) {
			return FALSE;
		}

		if (isset($this->zoo_settings['member_channel_id'])) {
			$visitor_query = $this->EE->db->select('entry_id')->where('author_id', $member_id)->where('channel_id', $this->zoo_settings['member_channel_id'])->order_by('entry_id', 'desc')->limit(1)->get('channel_titles');

			$sql = "SELECT entry_id FROM exp_channel_titles WHERE author_id = '" . $member_id . "' AND channel_id = '" . $this->zoo_settings['member_channel_id'] . "' ORDER BY entry_id DESC LIMIT 1";

			$visitor_query = $this->EE->db->query($sql);

			if ($visitor_query->num_rows() > 0) {
				return $visitor_query->first_row()->entry_id;
			} else {
				return FALSE;
			}
		}
	}

	function get_visitor_id_by_username($username = '')
	{


		if ($username == '') {
			return FALSE;
		}

		if (isset($this->zoo_settings['member_channel_id'])) {

			$visitor_query = $this->EE->db->query("SELECT ct.entry_id FROM " . $this->EE->db->dbprefix . "members m, " . $this->EE->db->dbprefix . "channel_titles as ct WHERE m.username = '" . $username . "' and ct.author_id = m.member_id AND ct.channel_id = '" . $this->zoo_settings['member_channel_id'] . "'");
			if ($visitor_query->num_rows() > 0) {
				return $visitor_query->first_row()->entry_id;
			} else {
				return FALSE;
			}
		}
	}

	function get_visitor_title($member_id = 'current')
	{

		if ($member_id == 'current') {
			$member_id = $this->EE->session->userdata['member_id'];
		}
		if ($member_id == 0) {
			return FALSE;
		}

		$this->EE->db->select('title');
		$this->EE->db->where('author_id', $member_id);
		$this->EE->db->where('channel_id', $this->zoo_settings['member_channel_id']);
		$this->EE->db->order_by('entry_id', 'desc');
		$this->EE->db->limit(1);
		$visitor_query = $this->EE->db->get('channel_titles');
		if ($visitor_query->num_rows() > 0) {
			return $visitor_query->first_row()->title;
		} else {
			return FALSE;
		}
	}

	function login_form()
	{

		$return          = ($this->EE->TMPL->fetch_param('return') != '') ? $this->EE->TMPL->fetch_param('return') : $this->EE->functions->fetch_current_uri();
		$error_handling  = $this->EE->TMPL->fetch_param('error_handling', '');
		$is_ajax_request = $this->EE->TMPL->fetch_param('json', 'no');

		$vars    = array();
		$vars[0] = array('username'    => '',
		                 'password'    => '',
		                 'error:login' => '');

		// ===============================
		// = Process the submitted login =
		// ===============================
		if (isset($_POST['visitor_action']) && $_POST['visitor_action'] == 'login') {

			$this->EE->load->library('zoo_visitor_member_auth');

			/* -------------------------------------------
			/* 'zoo_visitor_login_start' hook.
			/*  - Take control of member login routine
			/*  - Added EE 1.4.2
			*/
			$edata = $this->EE->extensions->call('zoo_visitor_login_start');
			if ($this->EE->extensions->end_script === TRUE) return;
			/*
			/* -------------------------------------------*/

			$result = $this->EE->zoo_visitor_member_auth->member_login();

			//XID needs to be restored, otherwise security check fails
			if (version_compare(APP_VER, 2.7, '>=')) {
				$this->EE->security->restore_xid();
			}

			if (array_key_exists("success", $result)) {
				if ($is_ajax_request == 'yes') {
					$return = array(
						'success' => 1,
						'errors'  => array(),
						'return'  => $return
					);

					$this->EE->output->send_ajax_response($return);
				}

				$this->EE->TMPL->tagdata = $this->EE->functions->prep_conditionals($this->EE->TMPL->tagdata, array('success' => TRUE));

				$redirect = $this->EE->input->post('RET');

				if ($redirect) {
					if ($this->EE->TMPL->fetch_param('secure_return') == 'yes') {
						$return = preg_replace('/^http:/', 'https:', $redirect);
					}
					$this->EE->functions->redirect($redirect);
				}
			} else {
				if ($is_ajax_request == 'yes') {
					$return = array(
						'success' => 0,
						'errors'  => $result
					);

					$this->EE->output->send_ajax_response($return);
				}
				if ($error_handling != 'inline') {
					$this->EE->output->show_user_error(FALSE, $result['login']);
				} else {
					$result['login'] = prep_errors($this->EE, array($result['login']));
					$vars[0]         = array('username'    => $this->EE->input->post('username'),
					                         'password'    => $this->EE->input->post('password'),
					                         'error:login' => implode('<br/>', $result['login']));
				}

				$this->EE->TMPL->tagdata = $this->EE->functions->prep_conditionals($this->EE->TMPL->tagdata, array('success' => FALSE));
			}

		}

		$this->EE->TMPL->tagdata = $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, $vars);

		if ($this->EE->config->item('user_session_type') != 'c') {
			$this->EE->TMPL->tagdata = preg_replace("/{if\s+auto_login}.*?{" . '\/' . "if}/s", '', $this->EE->TMPL->tagdata);
		} else {
			$this->EE->TMPL->tagdata = preg_replace("/{if\s+auto_login}(.*?){" . '\/' . "if}/s", "\\1", $this->EE->TMPL->tagdata);
		}

		// Create form

		$data['action']        = $this->EE->TMPL->fetch_param('form_action', $this->EE->functions->create_url($this->EE->uri->uri_string));
		$data['hidden_fields'] = array(
			'visitor_action' => 'login',
			'RET'            => $return
		);

		if ($this->EE->TMPL->fetch_param('name') !== FALSE &&
			preg_match("#^[a-zA-Z0-9_\-]+$#i", $this->EE->TMPL->fetch_param('name'), $match)
		) {
			$data['name'] = $this->EE->TMPL->fetch_param('name');
		}

		$data['id'] = $this->EE->TMPL->fetch_param('id', $this->EE->TMPL->fetch_param('form_id', ''));

		$data['class'] = $this->EE->TMPL->fetch_param('class', $this->EE->TMPL->fetch_param('form_class', ''));

		$res = $this->EE->functions->form_declaration($data);

		$res .= stripslashes($this->EE->TMPL->tagdata);

		$res .= "</form>";

		if ($this->EE->TMPL->fetch_param('secure_action') == 'yes') {
			$res = preg_replace('/(<form.*?action=")http:/', '\\1https:', $res);
		}

		return $res;

	}

	function logout()
	{

		// Kill the session and cookies
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->where('ip_address', $this->EE->input->ip_address());
		$this->EE->db->where('member_id', $this->EE->session->userdata('member_id'));
		$this->EE->db->delete('online_users');

		$this->EE->session->destroy();

		$this->EE->functions->set_cookie('read_topics');

		/* -------------------------------------------
		/* 'member_member_logout' hook.
		/*  - Perform additional actions after logout
		/*  - Added EE 1.6.1
		*/
		$edata = $this->EE->extensions->call('member_member_logout');
		if ($this->EE->extensions->end_script === TRUE) return;
		/*
		/* -------------------------------------------*/

		// Is this a forum redirect?
		$name = '';
		unset($url);

		if ($this->EE->input->get_post('FROM') == 'forum') {
			if ($this->EE->input->get_post('board_id') !== FALSE &&
				is_numeric($this->EE->input->get_post('board_id'))
			) {
				$query = $this->EE->db->select("board_forum_url, board_label")
					->where('board_id', $this->EE->input->get_post('board_id'))
					->get('forum_boards');
			} else {
				$query = $this->EE->db->select('board_forum_url, board_label')
					->where('board_id', (int)1)
					->get('forum_boards');
			}

			$url  = $query->row('board_forum_url');
			$name = $query->row('board_label');
		}


		if (($return = $this->EE->TMPL->fetch_param('return')) !== FALSE) {
			$this->EE->functions->redirect($this->EE->functions->create_url($return));
		} else {
			// return to most recent page
			$this->EE->functions->redirect($this->EE->functions->form_backtrack(1));
		}

	}

	// =======================
	// = Delete account form =
	// =======================

	function delete_account($tagdata, $ret, $error_handling, $is_ajax_request = 'no')
	{

		$TMPL_cache = $this->EE->TMPL;

		$errors  = array();
		$vars    = array();
		$vars[0] = array('error:password' => '');

		if (isset($_POST['visitor_action']) && $_POST['visitor_action'] == 'delete_account') {


			/** -------------------------------------
			 * /**  Validate submitted password
			 * /** -------------------------------------*/
			if (!class_exists('EE_Validate')) {
				require APPPATH . 'libraries/Validate' . EXT;
			}

			$VAL = new EE_Validate(
				array(
					'member_id'    => $this->EE->session->userdata('member_id'),
					'cur_password' => $_POST['password']
				)
			);

			$VAL->password_safety_check();

			if (count($VAL->errors) == 0) {
				$result = $this->_member_delete();

				//IF SUCCESS, REDIRECT TO RETURN PARAM

				if (isset($result['success']) && $ret != '') {

					if ($this->EE->TMPL->fetch_param('secure_return') == 'yes') {
						$ret = preg_replace('/^http:/', 'https:', $ret);
					}

					/* -------------------------------------------
					 /* 'zoo_visitor_delete_end' hook.
					 */
					$edata = $this->EE->extensions->call('zoo_visitor_delete_end');
					if ($this->EE->extensions->end_script === TRUE) return;

					$this->EE->functions->redirect($ret);
				}

				if (isset($result['error'])) {

					//IF ERROR HANDLING INLINE, PREP ERRORS, OTHERWISE SHOW USER OUTPUT
					if ($error_handling == "inline") {
						$errors  = prep_errors($this->EE, array($result['error']));
						$vars[0] = array('error:password' => $errors[0]);
					} else {
						$this->EE->output->show_user_error('submission', $result['error']);
					}
				}


			} else {
				//IF ERROR HANDLING INLINE, PREP ERRORS, OTHERWISE SHOW USER OUTPUT
				if ($error_handling == "inline") {
					$errors  = prep_errors($this->EE, array($VAL->errors[0]));
					$vars[0] = array('error:password' => $errors[0]);
				} else {
					$this->EE->output->show_user_error('submission', $VAL->errors[0]);
				}
			}

		}

		$data['id']            = 'delete_account_form';
		$data['action']        = $this->EE->functions->create_url($this->EE->uri->uri_string);
		$data['hidden_fields'] = array(
			'visitor_action' => 'delete_account',
			'RET'            => $ret
		);

		$tagdata = $this->EE->TMPL->parse_variables($tagdata, $vars);

		$form_declared = $this->EE->functions->form_declaration($data);

		if ($this->EE->TMPL->fetch_param('secure_action') == 'yes') {
			$form_declared = preg_replace('/(<form.*?action=")http:/', '\\1https:', $form_declared);
		}

		return $form_declared . $tagdata . '</form>';

	}

	// ========================
	// = Forgot password form =
	// ========================

	function forgot_password($tagdata, $ret, $error_handling, $is_ajax_request = 'no', $reset_url = '')
	{

		$TMPL_cache = $this->EE->TMPL;

		$errors  = array();
		$vars    = array();
		$vars[0] = array('email'       => '',
		                 'error:email' => '');

		if (isset($_POST['visitor_action']) && $_POST['visitor_action'] == 'forgot_password') {


			if (version_compare(APP_VER, '2.6.0', '>=')) {
				$result = $this->send_reset_token($reset_url);
			} else {
				$result = $this->_retrieve_password();
			}

			if (array_key_exists("success", $result)) {

				if ($ret != '') {
					if ($this->EE->TMPL->fetch_param('secure_return') == 'yes') {
						$ret = preg_replace('/^http:/', 'https:', $ret);
					}
					$this->EE->functions->redirect($ret);
				}


				if ($is_ajax_request == 'yes') {
					$return = array(
						'success' => 1,
						'errors'  => array(),
					);

					$this->EE->output->send_ajax_response($return);
				}

				$tagdata = $this->EE->functions->prep_conditionals($tagdata, array('password_sent' => TRUE));
			} else {
				if ($is_ajax_request == 'yes') {
					$return = array(
						'success' => 0,
						'errors'  => $result
					);

					$this->EE->output->send_ajax_response($return);
				}
				if ($error_handling != 'inline') {
					$this->EE->output->show_user_error(FALSE, $result['email']);
				} else {
					$result['email'] = prep_errors($this->EE, array($result['email']));
					$vars[0]         = array('email'       => $_POST['email'],
					                         'error:email' => implode('<br/>', $result['email']));
				}

				$tagdata = $this->EE->functions->prep_conditionals($tagdata, array('password_sent' => FALSE));
			}

		} else {
			$tagdata = $this->EE->functions->prep_conditionals($tagdata, array('password_sent' => FALSE));
		}

		// Create form

		$data['action']        = $this->EE->TMPL->fetch_param('action', $this->EE->functions->create_url($this->EE->uri->uri_string));
		$data['hidden_fields'] = array(
			'visitor_action' => 'forgot_password',
			'RET'            => $ret
		);

		if ($this->EE->TMPL->fetch_param('name') !== FALSE &&
			preg_match("#^[a-zA-Z0-9_\-]+$#i", $this->EE->TMPL->fetch_param('name'), $match)
		) {
			$data['name'] = $this->EE->TMPL->fetch_param('name');
		}

		$data['id'] = $this->EE->TMPL->fetch_param('id', $this->EE->TMPL->fetch_param('form_id', ''));

		$data['class'] = $this->EE->TMPL->fetch_param('class', $this->EE->TMPL->fetch_param('form_class', ''));

		$form_declared = $this->EE->functions->form_declaration($data);

		$tagdata = $this->EE->TMPL->parse_variables($tagdata, $vars);

		if ($this->EE->TMPL->fetch_param('secure_action') == 'yes') {
			$form_declared = preg_replace('/(<form.*?action=")http:/', '\\1https:', $form_declared);
		}

		return $form_declared . $tagdata . '</form>';

	}


	// ========================
	// = Forgot password form =
	// ========================

	function reset_password($tagdata, $ret, $error_handling, $is_ajax_request = 'no')
	{

		$TMPL_cache = $this->EE->TMPL;

		$errors  = array();
		$vars    = array();
		$vars[0] = array('email'          => '',
		                 'error:password' => '');

		if (isset($_POST['visitor_action']) && $_POST['visitor_action'] == 'reset_password') {

			$result = $this->process_reset_password();

			if (array_key_exists("success", $result)) {

				if ($ret != '') {
					if ($this->EE->TMPL->fetch_param('secure_return') == 'yes') {
						$ret = preg_replace('/^http:/', 'https:', $ret);
					}
					$this->EE->functions->redirect($ret);
				}


				if ($is_ajax_request == 'yes') {
					$return = array(
						'success' => 1,
						'errors'  => array(),
					);

					$this->EE->output->send_ajax_response($return);
				}

				$tagdata = $this->EE->functions->prep_conditionals($tagdata, array('password_reset' => TRUE));
			} else {
				if ($is_ajax_request == 'yes') {
					$return = array(
						'success' => 0,
						'errors'  => $result
					);

					$this->EE->output->send_ajax_response($return);
				}
				if ($error_handling != 'inline') {
					$this->EE->output->show_user_error(FALSE, $result['password']);
				} else {
					$result['password'] = prep_errors($this->EE, array($result['password']));
					$vars[0]            = array('password'       => $_POST['password'],
					                            'error:password' => implode('<br/>', $result['password']));
				}

				$tagdata = $this->EE->functions->prep_conditionals($tagdata, array('password_reset' => FALSE));
			}

		} else {
			$tagdata = $this->EE->functions->prep_conditionals($tagdata, array('password_reset' => FALSE));
		}

		// if the use is logged in, then send them away
		if (ee()->session->userdata('member_id') !== 0) {
			return ee()->functions->redirect(ee()->functions->fetch_site_index());
		}
		// If the user is banned, send them away.
		if (ee()->session->userdata('is_banned') === TRUE) {
			return ee()->output->show_user_error('general', array(lang('not_authorized')));
		}

		// They didn't include their token.  Give em an error.
		if (!($resetcode = ee()->input->get_post('id'))) {
			return ee()->output->show_user_error('submission', array(lang('mbr_no_reset_id')));
		}

		$data = array();

		$data['action'] = $this->EE->TMPL->fetch_param('action', $this->EE->functions->create_url($this->EE->uri->uri_string)) . '?&id=' . $resetcode;
		$data['id']     = $this->EE->TMPL->fetch_param('id', $this->EE->TMPL->fetch_param('form_id', ''));
		$data['class']  = $this->EE->TMPL->fetch_param('class', $this->EE->TMPL->fetch_param('form_class', ''));

		// Check to see whether we're in the forum or not.
		$in_forum                                = isset($_GET['r']) && $_GET['r'] == 'f';
		$data['hidden_fields']['from']           = ($in_forum == TRUE) ? 'forum' : '';
		$data['hidden_fields']['visitor_action'] = 'reset_password';
		$data['hidden_fields']['RET']            = $ret;
		$data['hidden_fields']['resetcode']      = $resetcode;

		$form_declared = $this->EE->functions->form_declaration($data);

		$tagdata = $this->EE->TMPL->parse_variables($tagdata, $vars);

		if ($this->EE->TMPL->fetch_param('secure_action') == 'yes') {
			$form_declared = preg_replace('/(<form.*?action=")http:/', '\\1https:', $form_declared);
		}

		return $form_declared . $tagdata . '</form>';

	}


	/**
	 * E-mail Forgotten Password Reset Token to User
	 *
	 * Handler page for the forgotten password form.  Processes the e-mail
	 * given us in the form, generates a token and then sends that token
	 * to the given e-mail with a backlink to a location where the user
	 * can set their password.  Expects to find the e-mail in `$_POST['email']`.
	 *
	 * @return void
	 */
	public function send_reset_token($reset_url)
	{

		$this->EE->load->language("member");

		// if this user is logged in, then send them away.
		if (ee()->session->userdata('member_id') !== 0) {
			return ee()->functions->redirect(ee()->functions->fetch_site_index());
		}

		// Is user banned?
		if (ee()->session->userdata('is_banned') === TRUE) {
			//return ee()->output->show_user_error('general', array(lang('not_authorized')));
			return array('email' => lang('not_authorized'));
		}

		// Error trapping
		if (!$address = ee()->input->post('email')) {
			//return ee()->output->show_user_error('submission', array(lang('invalid_email_address')));
			return array('email' => lang('invalid_email_address'));
		}

		ee()->load->helper('email');
		if (!valid_email($address)) {
			//return ee()->output->show_user_error('submission', array(lang('invalid_email_address')));
			return array('email' => lang('invalid_email_address'));
		}

		$address = strip_tags($address);

		$memberQuery = ee()->db->select('member_id, username, screen_name')
			->where('email', $address)
			->get('members');

		if ($memberQuery->num_rows() == 0) {
			//return ee()->output->show_user_error('submission', array(lang('no_email_found')));
			return array('email' => lang('no_email_found'));
		}

		$member_id = $memberQuery->row('member_id');
		$username  = $memberQuery->row('username');
		$name  = ($memberQuery->row('screen_name') == '') ? $memberQuery->row('username') : $memberQuery->row('screen_name');

		// Kill old data from the reset_password field
		$a_day_ago = time() - (60 * 60 * 24);
		ee()->db->where('date <', $a_day_ago)
			->or_where('member_id', $member_id)
			->delete('reset_password');

		// Create a new DB record with the temporary reset code
		$rand = ee()->functions->random('alnum', 8);
		$data = array('member_id' => $member_id, 'resetcode' => $rand, 'date' => time());
		ee()->db->query(ee()->db->insert_string('exp_reset_password', $data));

		// Build the email message
		if (ee()->input->get_post('FROM') == 'forum') {
			if (ee()->input->get_post('board_id') !== FALSE &&
				is_numeric(ee()->input->get_post('board_id'))
			) {
				$query = ee()->db->select('board_forum_url, board_id, board_label')
					->where('board_id', ee()->input->get_post('board_id'))
					->get('forum_boards');
			} else {
				$query = ee()->db->select('board_forum_url, board_id, board_label')
					->where('board_id', (int)1)
					->get('forum_boards');
			}

			$return    = $query->row('board_forum_url');
			$site_name = $query->row('board_label');
			$board_id  = $query->row('board_id');
		} else {
			$site_name = stripslashes(ee()->config->item('site_name'));
			$return    = ee()->config->item('site_url');
		}

		$forum_id = (ee()->input->get_post('FROM') == 'forum') ? '&r=f&board_id=' . $board_id : '';

		$reset_url = ($reset_url != '') ? $reset_url . QUERY_MARKER . '&id=' . $rand . $forum_id : ee()->functions->fetch_site_index(0, 0) . '/' . ee()->config->item('profile_trigger') . '/reset_password' . QUERY_MARKER . '&id=' . $rand . $forum_id;


		$swap = array(
			'username'  => $username,
			'name'      => $name,
			'reset_url' => $reset_url,
			'site_name' => $site_name,
			'site_url'  => $return
		);

		$template = ee()->functions->fetch_email_template('forgot_password_instructions');

		// _var_swap calls string replace on $template[] for each key in
		// $swap.  If the key doesn't exist then no swapping happens.
		$email_tit = $this->_var_swap($template['title'], $swap);
		$email_msg = $this->_var_swap($template['data'], $swap);

		// Instantiate the email class
		ee()->load->library('email');
		ee()->email->wordwrap = true;
		ee()->email->from(ee()->config->item('webmaster_email'), ee()->config->item('webmaster_name'));
		ee()->email->to($address);
		ee()->email->subject($email_tit);
		ee()->email->message($email_msg);

		if (!ee()->email->send()) {
			//return ee()->output->show_user_error('submission', array(lang('error_sending_email')));
			return array('email' => lang('error_sending_email'));
		}

		// Build success message
		$data = array(
			'title'   => lang('mbr_passwd_email_sent'),
			'heading' => lang('thank_you'),
			'content' => lang('forgotten_email_sent'),
			'link'    => array($return, $site_name)
		);

		//ee()->output->show_message($data);
		return array('success' => $data);
	}


	/**
	 * Reset Password Processing Action
	 *
	 * Processing action to process a reset password.  Sent here by the form presented
	 * to the user in `Member_auth::reset_password()`.  Process the form and return
	 * the user to the appropriate login page.  Expects to find the contents of the
	 * form in `$_POST`.
	 *
	 * @since 2.6
	 */
	public function process_reset_password()
	{
		$this->EE->load->language("member");

		// if the user is logged in, then send them away
		if (ee()->session->userdata('member_id') !== 0) {
			return ee()->functions->redirect(ee()->functions->fetch_site_index());
		}

		// If the user is banned, send them away.
		if (ee()->session->userdata('is_banned') === TRUE) {
			//return ee()->output->show_user_error('general', array(lang('not_authorized')));
			return array('password' => lang('not_authorized'));
		}

		if (!($resetcode = ee()->input->get_post('resetcode'))) {
			//return ee()->output->show_user_error('submission', array(lang('mbr_no_reset_id')));
			return array('password' => lang('mbr_no_reset_id'));
		}

		// We'll use this in a couple of places to determine whether a token is still valid
		// or not.  Tokens expire after exactly 1 day.
		$a_day_ago = time() - (60 * 60 * 24);

		// Make sure the token is valid and belongs to a member.
		$member_id_query = ee()->db->select('member_id')
			->where('resetcode', $resetcode)
			->where('date >', $a_day_ago)
			->get('reset_password');

		if ($member_id_query->num_rows() === 0) {
			//return ee()->output->show_user_error('submission', array(lang('mbr_id_not_found')));
			return array('password' => lang('mbr_id_not_found'));
		}

		// Ensure the passwords match.
		if (!($password = ee()->input->get_post('password'))) {
			//return ee()->output->show_user_error('submission', array(lang('mbr_missing_password')));
			return array('password' => lang('mbr_missing_password'));
		}

		if (!($password_confirm = ee()->input->get_post('password_confirm'))) {
			//return ee()->output->show_user_error('submission', array(lang('mbr_missing_confirm')));
			return array('password' => lang('mbr_missing_confirm'));
		}

		// Validate the password, using EE_Validate. This will also
		// handle checking whether the password and its confirmation
		// match.
		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate.php';
		}

		$VAL = new EE_Validate(array(
			'password'         => $password,
			'password_confirm' => $password_confirm,
		));

		$VAL->validate_password();
		if (count($VAL->errors) > 0) {
			//return ee()->output->show_user_error('submission', $VAL->errors);
			return array('password' => implode('<br/>', $VAL->errors));
		}

		// Update the database with the new password.  Apply the appropriate salt first.
		ee()->load->library('auth');
		ee()->auth->update_password(
			$member_id_query->row('member_id'),
			$password
		);

		// Invalidate the old token.  While we're at it, may as well wipe out expired
		// tokens too, just to keep them from building up.
		ee()->db->where('date <', $a_day_ago)
			->or_where('member_id', $member_id_query->row('member_id'))
			->delete('reset_password');


		// If we can get their last URL from the tracker,
		// then we'll use it.
		if (isset(ee()->session->tracker[3])) {
			$site_name = stripslashes(ee()->config->item('site_name'));
			$return    = ee()->functions->fetch_site_index() . '/' . ee()->session->tracker[3];
		}
		// Otherwise, it's entirely possible they are clicking the e-mail link after
		// their session has expired.  In that case, the only information we have
		// about where they came from is in the POST data (where it came from the GET data).
		// Use it to get them as close as possible to where they started.
		else if (ee()->input->get_post('FROM') == 'forum') {
			$board_id = ee()->input->get_post('board_id');
			$board_id = ($board_id === FALSE OR !is_numeric($board_id)) ? 1 : $board_id;

			$forum_query = ee()->db->select('board_forum_url, board_label')
				->where('board_id', (int)$board_id)
				->get('forum_boards');

			$site_name = $forum_query->row('board_label');
			$return    = $forum_query->row('board_forum_url');
		} else {
			$site_name = stripslashes(ee()->config->item('site_name'));
			$return    = ee()->functions->fetch_site_index();
		}

		// Build the success message that we'll show to the user.
		$data = array(
			'title'    => lang('mbr_password_changed'),
			'heading'  => lang('mbr_password_changed'),
			'content'  => lang('mbr_successfully_changed_password'),
			'link'     => array($return, $site_name), // The link to show them. In the form of (URL, Name)
			'redirect' => $return, // Redirect them to this URL...
			'rate'     => '5' // ...after 5 seconds.

		);

		//ee()->output->show_message($data);
		return array('success' => $data);
	}


	// =====================
	// = Retrieve password =
	// =====================
	function _retrieve_password()
	{
		$this->EE->load->language("member");
		// Is user banned?
		if ($this->EE->session->userdata('is_banned') === TRUE) {
			return array('email' => lang('not_authorized'));
		}

		// Error trapping
		if (!$address = $this->EE->input->post('email')) {
			return array('email' => lang('invalid_email_address'));
		}

		$this->EE->load->helper('email');

		if (!valid_email($address)) {
			return array('email' => lang('invalid_email_address'));
		}

		$address = strip_tags($address);

		// Fetch user data
		$query = $this->EE->db->select('member_id, username')
			->where('email', $address)
			->get('members');

		if ($query->num_rows() == 0) {
			return array('email' => lang('no_email_found'));
		}

		$member_id = $query->row('member_id');
		$username  = $query->row('username');

		// Kill old data from the reset_password field

		$time = time() - (60 * 60 * 24);

		$this->EE->db->where('date <', $time)
			->or_where('member_id', $member_id)
			->delete('reset_password');

		// Create a new DB record with the temporary reset code
		$rand = $this->EE->functions->random('alnum', 8);

		$data = array('member_id' => $member_id,
		              'resetcode' => $rand,
		              'date'      => time());

		$this->EE->db->query($this->EE->db->insert_string('exp_reset_password', $data));

		// Buid the email message

		if ($this->EE->input->get_post('FROM') == 'forum') {
			if ($this->EE->input->get_post('board_id') !== FALSE &&
				is_numeric($this->EE->input->get_post('board_id'))
			) {
				$query = $this->EE->db->select('board_forum_url, board_id, board_label')
					->where('board_id', $this->EE->input->get_post('board_id'))
					->get('forum_boards');
			} else {
				$query = $this->EE->db->select('board_forum_url, board_id, board_label')
					->where('board_id', (int)1)
					->get('forum_boards');
			}

			$return    = $query->row('board_forum_url');
			$site_name = $query->row('board_label');
			$board_id  = $query->row('board_id');
		} else {
			$site_name = stripslashes($this->EE->config->item('site_name'));
			$return    = $this->EE->config->item('site_url');
		}

		$forum_id = ($this->EE->input->get_post('FROM') == 'forum') ? '&r=f&board_id=' . $board_id : '';

		$swap = array(
			'name'      => $username,
			'reset_url' => $this->EE->functions->fetch_site_index(0, 0) . QUERY_MARKER . 'ACT=' . $this->EE->functions->fetch_action_id('Member', 'reset_password') . '&id=' . $rand . $forum_id,
			'site_name' => $site_name,
			'site_url'  => $return
		);

		$template  = $this->EE->functions->fetch_email_template('forgot_password_instructions');
		$email_tit = $this->_var_swap($template['title'], $swap);
		$email_msg = $this->_var_swap($template['data'], $swap);

		// Instantiate the email class

		$this->EE->load->library('email');
		$this->EE->email->wordwrap = true;
		$this->EE->email->from($this->EE->config->item('webmaster_email'), $this->EE->config->item('webmaster_name'));
		$this->EE->email->to($address);
		$this->EE->email->subject($email_tit);
		$this->EE->email->message($email_msg);

		if (!$this->EE->email->send()) {
			return array('email' => lang('error_sending_email'));
		}

		// Build success message
		$data = array('title'   => lang('mbr_passwd_email_sent'),
		              'heading' => lang('thank_you'),
		              'content' => lang('forgotten_email_sent'),
		              'link'    => array($return, $site_name)
		);

		return array('success' => $data);
	}



	// ==========================
	// = Process delete account =
	// ==========================

	private
	function _member_delete()
	{

		// No sneakiness - we'll do this in case the site administrator
		// has foolishly turned off secure forms and some monkey is
		// trying to delete their account from an off-site form or
		// after logging out.

		if ($this->EE->session->userdata('member_id') == 0 OR
			$this->EE->session->userdata('can_delete_self') !== 'y'
		) {
			return array('error' => $this->EE->lang->line('not_authorized'));
		}

		// If the user is a SuperAdmin, then no deletion
		if ($this->EE->session->userdata('group_id') == 1) {
			return array('error' => $this->EE->lang->line('cannot_delete_super_admin'));
		}

		// Is IP and User Agent required for login?  Then, same here.
		if ($this->EE->config->item('require_ip_for_login') == 'y') {
			if ($this->EE->session->userdata('ip_address') == '' OR
				$this->EE->session->userdata('user_agent') == ''
			) {
				return array('error' => $this->EE->lang->line('unauthorized_request'));
			}
		}

		// Check password lockout status
		if ($this->EE->session->check_password_lockout($this->EE->session->userdata('username')) === TRUE) {
			$this->EE->lang->loadfile('login');

			return array('error' =>
				             sprintf(lang('password_lockout_in_effect'), $this->EE->config->item('password_lockout_interval'))
			);
		}

		/** -------------------------------------
		 * /**  Validate submitted password
		 * /** -------------------------------------*/
		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate' . EXT;
		}

		$VAL = new EE_Validate(
			array(
				'member_id'    => $this->EE->session->userdata('member_id'),
				'cur_password' => $_POST['password']
			)
		);

		$VAL->password_safety_check();

		if (isset($VAL->errors) && count($VAL->errors) > 0) {
			$this->EE->session->save_password_lockout($this->EE->session->userdata('username'));

			return array('error' => $this->EE->lang->line('invalid_pw'));
		}
		// Are you who you say you are, or someone sitting at someone
		// else's computer being mean?!
		// 		$query = $this->EE->db->select('password')
		// 							  ->where('member_id', $this->EE->session->userdata('member_id'))
		// 							  ->get('members');
		//
		// 		$password = $this->EE->functions->hash(stripslashes($_POST['password']));
		// echo '<br/>'.$query->row('password') .'<br/>'. $password;
		// 		if ($query->row('password') != $password)
		// 		{
		// 			$this->EE->session->save_password_lockout($this->EE->session->userdata('username'));
		//
		// 			return array('error' => $this->EE->lang->line('invalid_pw'));
		// 		}

		// No turning back, get to deletin'!
		$id = $this->EE->session->userdata('member_id');

		$this->EE->db->where('member_id', (int)$id)->delete('members');
		$this->EE->db->where('member_id', (int)$id)->delete('member_data');
		$this->EE->db->where('member_id', (int)$id)->delete('member_homepage');
		$this->EE->db->where('sender_id', (int)$id)->delete('message_copies');
		$this->EE->db->where('sender_id', (int)$id)->delete('message_data');
		$this->EE->db->where('member_id', (int)$id)->delete('message_folders');
		$this->EE->db->where('member_id', (int)$id)->delete('message_listed');

		$message_query = $this->EE->db->query("SELECT DISTINCT recipient_id FROM exp_message_copies WHERE sender_id = '{$id}' AND message_read = 'n'");

		if ($message_query->num_rows() > 0) {
			foreach ($message_query->result_array() as $row) {
				$count_query = $this->EE->db->query("SELECT COUNT(*) AS count FROM exp_message_copies WHERE recipient_id = '" . $row['recipient_id'] . "' AND message_read = 'n'");
				$this->EE->db->query($this->EE->db->update_string('exp_members', array('private_messages' => $count_query->row('count')), "member_id = '" . $row['recipient_id'] . "'"));
			}
		}

		// Delete Forum Posts
		if ($this->EE->config->item('forum_is_installed') == "y") {
			$this->EE->db->where('member_id', (int)$id)->delete('forum_subscriptions');
			$this->EE->db->where('member_id', (int)$id)->delete('forum_pollvotes');
			$this->EE->db->where('author_id', (int)$id)->delete('forum_topics');
			$this->EE->db->where('admin_member_id', (int)$id)->delete('forum_administrators');
			$this->EE->db->where('mod_member_id', (int)$id)->delete('forum_moderators');

			// Snag the affected topic id's before deleting the member for the update afterwards
			$query = $this->EE->db->query("SELECT topic_id FROM exp_forum_posts WHERE author_id = '{$id}'");

			if ($query->num_rows() > 0) {
				$topic_ids = array();

				foreach ($query->result_array() as $row) {
					$topic_ids[] = $row['topic_id'];
				}

				$topic_ids = array_unique($topic_ids);
			}

			$this->EE->db->where('author_id', (int)$id)->delete('forum_posts');
			$this->EE->db->where('author_id', (int)$id)->delete('forum_polls');

			// Kill any attachments
			$query = $this->EE->db->query("SELECT attachment_id, filehash, extension, board_id FROM exp_forum_attachments WHERE member_id = '{$id}'");

			if ($query->num_rows() > 0) {
				// Grab the upload path
				$res = $this->EE->db->query('SELECT board_id, board_upload_path FROM exp_forum_boards');

				$paths = array();
				foreach ($res->result_array() as $row) {
					$paths[$row['board_id']] = $row['board_upload_path'];
				}

				foreach ($query->result_array() as $row) {
					if (!isset($paths[$row['board_id']])) {
						continue;
					}

					$file  = $paths[$row['board_id']] . $row['filehash'] . $row['extension'];
					$thumb = $paths[$row['board_id']] . $row['filehash'] . '_t' . $row['extension'];

					@unlink($file);
					@unlink($thumb);

					$this->EE->db->where('attachment_id', (int)$row['attachment_id'])
						->delete('forum_attachments');
				}
			}

			// Update the forum stats
			$query = $this->EE->db->query("SELECT forum_id FROM exp_forums WHERE forum_is_cat = 'n'");

			if (!class_exists('Forum')) {
				require PATH_MOD . 'forum/mod.forum.php';
				require PATH_MOD . 'forum/mod.forum_core.php';
			}

			$FRM = new Forum_Core;

			foreach ($query->result_array() as $row) {
				$FRM->_update_post_stats($row['forum_id']);
			}

			if (isset($topic_ids)) {
				foreach ($topic_ids as $topic_id) {
					$FRM->_update_topic_stats($topic_id);
				}
			}
		}

		// Va-poo-rize Channel Entries and Comments
		$entry_ids   = array();
		$channel_ids = array();
		$recount_ids = array();

		// Find Entry IDs and Channel IDs, then delete
		$query = $this->EE->db->query("SELECT entry_id, channel_id FROM exp_channel_titles WHERE author_id = '{$id}'");

		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				$entry_ids[]   = $row['entry_id'];
				$channel_ids[] = $row['channel_id'];
			}

			$this->EE->db->query("DELETE FROM exp_channel_titles WHERE author_id = '{$id}'");
			$this->EE->db->query("DELETE FROM exp_channel_data WHERE entry_id IN ('" . implode("','", $entry_ids) . "')");
			$this->EE->db->query("DELETE FROM exp_comments WHERE entry_id IN ('" . implode("','", $entry_ids) . "')");
		}

		// Find the affected entries AND channel ids for author's comments
		$query = $this->EE->db->query("SELECT DISTINCT(entry_id), channel_id FROM exp_comments WHERE author_id = '{$id}'");

		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				$recount_ids[] = $row['entry_id'];
				$channel_ids[] = $row['channel_id'];
			}

			$recount_ids = array_diff($recount_ids, $entry_ids);
		}

		// Delete comments by member
		$this->EE->db->query("DELETE FROM exp_comments WHERE author_id = '{$id}'");

		// Update stats on channel entries that were NOT deleted AND had comments by author

		if (count($recount_ids) > 0) {
			foreach (array_unique($recount_ids) as $entry_id) {
				$query = $this->EE->db->query("SELECT MAX(comment_date) AS max_date FROM exp_comments WHERE status = 'o' AND entry_id = '" . $this->EE->db->escape_str($entry_id) . "'");

				$comment_date = ($query->num_rows() == 0 OR !is_numeric($query->row('max_date'))) ? 0 : $query->row('max_date');

				$query = $this->EE->db->query("SELECT COUNT(*) AS count FROM exp_comments WHERE entry_id = '{$entry_id}' AND status = 'o'");

				$this->EE->db->query("UPDATE exp_channel_titles SET comment_total = '" . $this->EE->db->escape_str($query->row('count')) . "', recent_comment_date = '$comment_date' WHERE entry_id = '{$entry_id}'");
			}
		}

		if (count($channel_ids) > 0) {
			foreach (array_unique($channel_ids) as $channel_id) {
				$this->EE->stats->update_channel_stats($channel_id);
				$this->EE->stats->update_comment_stats($channel_id);
			}
		}

		// Email notification recipients
		if ($this->EE->session->userdata('mbr_delete_notify_emails') != '') {

			$notify_address = $this->EE->session->userdata('mbr_delete_notify_emails');

			$swap = array(
				'name'      => $this->EE->session->userdata('screen_name'),
				'email'     => $this->EE->session->userdata('email'),
				'site_name' => stripslashes($this->EE->config->item('site_name'))
			);

			$email_tit = $this->EE->functions->var_swap($this->EE->lang->line('mbr_delete_notify_title'), $swap);
			$email_msg = $this->EE->functions->var_swap($this->EE->lang->line('mbr_delete_notify_message'), $swap);

			// No notification for the user themselves, if they're in the list
			if (strpos($notify_address, $this->EE->session->userdata('email')) !== FALSE) {
				$notify_address = str_replace($this->EE->session->userdata('email'), "", $notify_address);
			}

			$this->EE->load->helper('string');
			// Remove multiple commas
			$notify_address = reduce_multiples($notify_address, ',', TRUE);

			if ($notify_address != '') {
				// Send email
				$this->EE->load->library('email');

				// Load the text helper
				$this->EE->load->helper('text');

				foreach (explode(',', $notify_address) as $addy) {
					$this->EE->email->EE_initialize();
					$this->EE->email->wordwrap = FALSE;
					$this->EE->email->from($this->EE->config->item('webmaster_email'), $this->EE->config->item('webmaster_name'));
					$this->EE->email->to($addy);
					$this->EE->email->reply_to($this->EE->config->item('webmaster_email'));
					$this->EE->email->subject($email_tit);
					$this->EE->email->message(entities_to_ascii($email_msg));
					$this->EE->email->send();
				}
			}
		}

		// Trash the Session and cookies
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'))
			->where('ip_address', $this->EE->input->ip_address())
			->where('member_id', (int)$id)
			->delete('online_users');

		$this->EE->db->where('session_id', $this->EE->session->userdata('session_id'))
			->delete('sessions');

		$this->EE->functions->set_cookie($this->EE->session->c_session);
		$this->EE->functions->set_cookie($this->EE->session->c_expire);
		$this->EE->functions->set_cookie($this->EE->session->c_anon);
		$this->EE->functions->set_cookie('read_topics');
		$this->EE->functions->set_cookie('tracker');

		// Update
		$this->EE->stats->update_member_stats();

		// Build Success Message
		$url  = $this->EE->config->item('site_url');
		$name = stripslashes($this->EE->config->item('site_name'));

		$data = array('title'    => $this->EE->lang->line('mbr_delete'),
		              'heading'  => $this->EE->lang->line('thank_you'),
		              'content'  => $this->EE->lang->line('mbr_account_deleted'),
		              'redirect' => '',
		              'link'     => array($url, $name)
		);

		return array('success' => $data);

	}


	function update($do_update = TRUE)
	{

		$errors = array();

		//PASSWORD CHANGE
		if (array_key_exists('new_password', $_POST) && $_POST['new_password'] != '') {

			$_POST['password']         = $_POST['new_password'];
			$_POST['password_confirm'] = $_POST['new_password_confirm'];

		} else {
			$_POST['password']         = '';
			$_POST['password_confirm'] = '';
		}

		////////////////////////

		if (array_key_exists('password', $_POST) || array_key_exists('username', $_POST) || array_key_exists('screen_name', $_POST)) {

			$native_profile_update = TRUE;

			if ((isset($_POST['username']) && $_POST['username'] != $this->EE->session->userdata['username']) ||
				(isset($_POST['screen_name']) && $_POST['screen_name'] != $this->EE->session->userdata['screen_name']) ||
				(isset($_POST['new_password']) && $_POST['new_password'] != '')
			) {

				if (!isset($_POST['username'])) {
					$query             = $this->EE->db->query("SELECT username, screen_name FROM exp_members WHERE member_id = '" . $this->EE->input->post('author_id') . "'");
					$_POST['username'] = $query->row('username'); //$this->EE->session->userdata['username'];
				}
				if (!isset($_POST['screen_name'])) {
					//$_POST['screen_name'] = $this->EE->session->userdata['screen_name'];
					$query                = $this->EE->db->query("SELECT username, screen_name FROM exp_members WHERE member_id = '" . $this->EE->input->post('author_id') . "'");
					$_POST['screen_name'] = $query->row('screen_name');
				}
				if (!isset($_POST['password'])) {
					$_POST['password'] = $_POST['current_password'];
				}

				$errors = array_merge($errors, $this->update_userpass($do_update));

			}
		}

		if (array_key_exists('email', $_POST) && $_POST['email'] != $this->EE->session->userdata['email']) {

			//current password in this function is just "password"
			$_POST['password'] = $_POST['current_password'];

			$errors = array_merge($errors, $this->update_email($do_update, $this->EE->input->post('author_id')));
		}

		return $errors;

	}

	function update_native_member_fields($member_id = '', $entry_id = NULL)
	{

		$author_id = $member_id;

		$entry_id = ($entry_id != NULL) ? $entry_id : $this->EE->input->post('entry_id');

		// ===============================
		// = Custom member fields =
		// ===============================
		$custom_member_data = array();

		$sql = 'SELECT mf.m_field_id member_field_id, mf.m_field_name, cf.field_id channel_field_id, cf.field_name FROM exp_member_fields mf, exp_channel_fields cf WHERE cf.field_name = CONCAT("member_", mf.m_field_name) ';

		$query = $this->EE->db->query($sql);

		//get data from channel entry instead from post array
		$data_sql           = 'SELECT * from exp_channel_data WHERE entry_id = "' . $entry_id . '"';
		$data_query         = $this->EE->db->query($data_sql);
		$entry_channel_data = $data_query->first_row('array');

		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				$custom_member_data['m_field_id_' . $row->member_field_id] = $entry_channel_data['field_id_' . $row->channel_field_id];
			}
		}

		if (count($custom_member_data) > 0) {
			$this->EE->member_model->update_member_data($author_id, $custom_member_data);
		}

		// ==========================
		// = Standard member fields =
		// ==========================

		//deprecated method for saving native fields based on name m_field_id_x
		$native_member_fields_data = contains_native_member_fields();

		if ($native_member_fields_data !== FALSE) {
			$this->EE->db->where('member_id', $author_id);
			$this->EE->db->update('member_data', $native_member_fields_data);
		}


		//new method for saving native fields
		$data   = array();
		$fields = array('bday_y', 'bday_m', 'bday_d', 'birthday', 'url', 'location', 'occupation', 'interests', 'aol_im', 'icq', 'yahoo_im', 'msn_im', 'bio', 'signature', 'avatar', 'photo', 'timezone', 'time_format', 'language');

		if (APP_VER < '2.6.0') {
			$fields[] = 'daylight_savings';
		}

		//get the channel field ids based on the name of the member fields
		$member_fields = array();
		foreach ($fields as $field) {
			$member_fields[] = 'member_' . $field;
		}

		$member_fields_str = implode('","', $member_fields);
		$sql               = 'SELECT field_name, field_id FROM exp_channel_fields WHERE field_name IN ("' . $member_fields_str . '")';

		$query = $this->EE->db->query($sql);

		//place the fields in an array field_name => field_id, we need this because fields are in post array based on field_id
		$field_map = array();
		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				$field_map[str_replace('member_', '', $row->field_name)] = $row->field_id;
			}

			foreach ($fields as $val) {

				if (isset($field_map[$val])) {

					if (isset($entry_channel_data['field_id_' . $field_map[$val]])) {

						$field_value = $entry_channel_data['field_id_' . $field_map[$val]];

						if (strpos($field_value, '}')) {
							$field_value = substr($field_value, strpos($field_value, '}') + 1);
						}

						$data[$val] = $field_value;
					}
				}
			}

			if (isset($data['birthday'])) {

				//dropdate passes date as an array
				if (is_array($data['birthday'])) {
					$data['bday_d'] = $data['birthday'][0];
					$data['bday_m'] = $data['birthday'][1];
					$data['bday_y'] = $data['birthday'][2];
				} else {
					$data['bday_d'] = date('j', strtotime($data['birthday']));
					$data['bday_m'] = date('n', strtotime($data['birthday']));
					$data['bday_y'] = date('Y', strtotime($data['birthday']));
				}
				unset($data['birthday']);

			}
			if (isset($data['bday_d']) && isset($data['bday_m']) && is_numeric($data['bday_d']) AND is_numeric($data['bday_m'])) {
				$year = (isset($data['bday_y']) && $data['bday_y'] != '') ? $data['bday_y'] : date('Y');

				if ((version_compare(APP_VER, '2.6.0', '<'))) {
					$mdays = $this->EE->localize->fetch_days_in_month($data['bday_m'], $year);
				} else {
					$this->EE->load->helper('date');
					$mdays = days_in_month($data['bday_m'], $year);
				}

				if ($data['bday_d'] > $mdays) {
					$data['bday_d'] = $mdays;
				}
			}
		}


		// ============================================
		// = Check if there is a membergroup selected =
		// ============================================
		$this->check_membergroup_change($data);

		if (isset($data['avatar'])) {
			$data['avatar_filename'] = 'uploads/' . $data['avatar'];
			unset($data['avatar']);
		}

		if (isset($data['photo'])) {
			$data['photo_filename'] = $data['photo'];
			unset($data['photo']);
		}

		if (count($data) > 0) {
			$this->EE->member_model->update_member($author_id, $data);
		}

	}

	function check_membergroup_change(&$data)
	{

		$selected_group_id = '';

		// ============================================
		// = Check if there is a membergroup selected =
		// ============================================

		$allowed_groups = (isset($_POST['AG'])) ? decrypt_input($this->EE, $_POST['AG']) : '';

		if (isset($_POST['AG']) && isset($_POST['group_id']) && ctype_digit($_POST['group_id']) && $allowed_groups !== '') {
			$sql = "SELECT DISTINCT group_id FROM exp_member_groups WHERE group_id NOT IN (1,2,3,4) AND group_id = '" . $this->EE->db->escape_str($_POST['group_id']) . "'" . $this->EE->functions->sql_andor_string($allowed_groups, 'group_id');

			$query = $this->EE->db->query($sql);
			if ($query->num_rows() > 0) {
				$selected_group_id = $query->row('group_id');
			}

			if (isset($_POST['entry_id']) && $_POST['entry_id'] != '0') {
				$data['group_id'] = $selected_group_id;
			} else {
				if (isset($selected_group_id) && is_numeric($selected_group_id)) {

					if ($this->EE->config->item('req_mbr_activation') == 'manual' OR $this->EE->config->item('req_mbr_activation') == 'email') {
						$data['group_id'] = 4; // Pending
					} else {
						$data['group_id'] = $selected_group_id;
					}

				}
			}


		}

		return $selected_group_id;
	}

	// =============================================================
	// = Update screen_name - used in combi with override settings =
	// =============================================================
	function update_screen_name($member_id = 'current')
	{

		$entry_id = $this->get_visitor_id($member_id);

		if ($entry_id) {

			$this->EE->db->where('entry_id', $entry_id);
			//$this->EE->db->where('site_id',$this->EE->config->item('site_id'));

			$screen_name = '';

			$query = $this->EE->db->get('channel_data');
			if ($query->num_rows() > 0) {

				$screen_name = $this->zoo_settings['screen_name_override'];
				$fields      = array_reverse($query->row_array());
				foreach ($fields as $key => $val) {
					$screen_name = str_replace($key, $val, $screen_name);
				}
			}

			$screen_name_check = str_replace(' ', '', $screen_name);

		}

		if (isset($screen_name) && $screen_name_check != '') {
			$data                = array();
			$data['screen_name'] = $screen_name;
			$member_id           = ($member_id == 'current') ? $this->EE->session->userdata('member_id') : $member_id;
			$this->EE->member_model->update_member($member_id, $data);
			return $screen_name;
		} else {
			return FALSE;
		}
	}

	function get_override_screen_name()
	{

		//replace screen_name_override with field names
		$this->EE->db->select('field_name, field_id');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->order_by('field_id', 'desc');

		$query = $this->EE->db->get('channel_fields');
		if ($query->num_rows() > 0) {
			$screen_name = $this->zoo_settings['screen_name_override'];
			foreach ($query->result_array() as $row) {
				/**
				 * @author  Stephen Lewis
				 *
				 * Additional check to ensure that $_POST data is a string. Ensures ZV
				 * doesn't choke on DropDate, or any other "array" fields.
				 */

				$field_name = $row['field_name'];

				$value = (isset($_POST[$field_name]) && is_string($_POST[$field_name]))
					? $_POST[$field_name] : '';

				/* End of modifications. */

				$screen_name = str_replace('field_id_' . $row['field_id'], $value,
					$screen_name);
			}

			return (str_replace(' ', '', $screen_name) != '') ? $screen_name : FALSE;

		} else {
			return FALSE;
		}


	}

	// =========================
	// = Update email function =
	// =========================
	function update_email($do_update = TRUE, $member_id)
	{


		$errors = array();

		if (!isset($_POST['email'])) {
			$errors["invalid_actions"] = $this->EE->lang->line('invalid_action');
			return $errors;
		}

		/** ----------------------------------------
		 * /**  Blacklist/Whitelist Check
		 * /** ----------------------------------------*/
		if ($this->EE->blacklist->blacklisted == 'y' && $this->EE->blacklist->whitelisted == 'n') {
			$errors["not_authorized"] = $this->EE->lang->line('not_authorized');
			return $errors;
		}

		/** -------------------------------------
		 * /**  Validate submitted data
		 * /** -------------------------------------*/
		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate' . EXT;
		}

		$query = $this->EE->db->query("SELECT email, password FROM exp_members WHERE member_id = '" . $member_id . "'");

		$VAL = new EE_Validate(
			array(
				'member_id'    => $member_id,
				'val_type'     => 'update', // new or update
				'fetch_lang'   => TRUE,
				'require_cpw'  => TRUE,//FALSE, //ADDED IN ZOO VISITOR
				'enable_log'   => FALSE,
				'email'        => $_POST['email'],
				'cur_email'    => $query->row('email'),
				'cur_password' => $_POST['current_password']
			)
		);

		// load the language file
		$this->EE->lang->loadfile('zoo_visitor');

		$errors["current_password"] = $VAL->errors;
		$offset                     = count($VAL->errors);

		$VAL->validate_email();
		$errors["email"] = array_slice($VAL->errors, $offset);
		$offset          = count($VAL->errors);

		if (count($VAL->errors) > 0) {
			return $errors;
		}

		if (!$do_update) {
			return array();
		}
		/** -------------------------------------
		 * /**  Assign the query data
		 * /** -------------------------------------*/

		$data = array(
			'email'               => $_POST['email'],
			'accept_admin_email'  => (isset($_POST['accept_admin_email'])) ? 'y' : 'n',
			'accept_user_email'   => (isset($_POST['accept_user_email'])) ? 'y' : 'n',
			'notify_by_default'   => (isset($_POST['notify_by_default'])) ? 'y' : 'n',
			'notify_of_pm'        => (isset($_POST['notify_of_pm'])) ? 'y' : 'n',
			'smart_notifications' => (isset($_POST['smart_notifications'])) ? 'y' : 'n'
		);

		$this->EE->db->query($this->EE->db->update_string('exp_members', $data, "member_id = '" . $member_id . "'"));

		/** -------------------------------------
		 * /**  Update comments and log email change
		 * /** -------------------------------------*/

		if ($query->row('email') != $_POST['email']) {
			$this->EE->db->select('module_id');
			$this->EE->db->where('module_name', 'Comment');
			$module_query = $this->EE->db->get('modules');

			if ($module_query->num_rows() > 0) {
				$this->EE->db->query($this->EE->db->update_string('exp_comments', array('email' => $_POST['email']), "author_id = '" . $member_id . "'"));
			}
		}

		return array();
	}

	// =====================================
	// = update username/password function =
	// =====================================
	function update_userpass($do_update = TRUE, $error_handling = '')
	{

		if ($this->EE->input->post('author_id')) {
			$errors = array();

			if (!isset($_POST['current_password'])) {
				$errors['invalid_action'] = $this->EE->lang->line('invalid_action');
			}

			$query = $this->EE->db->query("SELECT username, screen_name FROM exp_members WHERE member_id = '" . $this->EE->input->post('author_id') . "'");

			if ($query->num_rows() == 0) {
				return FALSE;
			}

			if ($this->EE->config->item('allow_username_change') != 'y') {
				$_POST['username'] = $query->row('username');
			}

			// If the screen name field is empty, we'll assign is
			// from the username field.

			if ($_POST['screen_name'] == '')
				$_POST['screen_name'] = $_POST['username'];

			if (!isset($_POST['username']))
				$_POST['username'] = '';

			/** -------------------------------------
			 * /**  Validate submitted data
			 * /** -------------------------------------*/
			if (!class_exists('EE_Validate')) {
				require APPPATH . 'libraries/Validate' . EXT;
			}

			$VAL = new EE_Validate(
				array(
					'member_id'        => $this->EE->input->post('author_id'),
					'val_type'         => 'update', // new or update
					'fetch_lang'       => TRUE,
					'require_cpw'      => TRUE,//FALSE,
					'enable_log'       => FALSE,
					'username'         => $_POST['username'],
					'cur_username'     => $query->row('username'),
					'screen_name'      => $_POST['screen_name'],
					'cur_screen_name'  => $query->row('screen_name'),
					'password'         => $_POST['password'],
					'password_confirm' => $_POST['password_confirm'],
					'cur_password'     => $_POST['current_password']
				)
			);

			// load the language file
			$this->EE->lang->loadfile('zoo_visitor');

			$errors["current_password"] = $VAL->errors;
			$offset                     = count($VAL->errors);

			$VAL->validate_screen_name();
			$errors["screen_name"] = array_slice($VAL->errors, $offset);
			$offset                = count($VAL->errors);


			if ($this->EE->config->item('allow_username_change') == 'y') {
				$VAL->validate_username();
				$errors["username"] = array_slice($VAL->errors, $offset);
				$offset             = count($VAL->errors);
			}

			if ($_POST['password'] != '') {
				$VAL->validate_password();
				$errors["password"] = array_slice($VAL->errors, $offset);
				$offset             = count($VAL->errors);
			}
			/** -------------------------------------
			 * /**  Display error is there are any
			 * /** -------------------------------------*/

			if (count($VAL->errors) > 0) {
				return $errors;
			}

			//Just validate, no update
			if (!$do_update) {
				return array();
			}

			/** -------------------------------------
			 * /**  Update "last post" forum info if needed
			 * /** -------------------------------------*/

			if ($query->row('screen_name') != $_POST['screen_name'] AND $this->EE->config->item('forum_is_installed') == "y") {
				$this->EE->db->query("UPDATE exp_forums SET forum_last_post_author = '" . $this->EE->db->escape_str($_POST['screen_name']) . "' WHERE forum_last_post_author_id = '" . $this->EE->input->post('author_id') . "'");
				$this->EE->db->query("UPDATE exp_forum_moderators SET mod_member_name = '" . $this->EE->db->escape_str($_POST['screen_name']) . "' WHERE mod_member_id = '" . $this->EE->input->post('author_id') . "'");
			}

			/** -------------------------------------
			 * /**  Assign the query data
			 * /** -------------------------------------*/
			$data['screen_name'] = $_POST['screen_name'];

			if ($this->EE->config->item('allow_username_change') == 'y') {
				$data['username'] = $_POST['username'];
			}

			// Was a password submitted?

			$pw_change = '';

			if ($_POST['password'] != '') {
				//$data['password'] = $this->EE->functions->hash(stripslashes($_POST['password']));

				$this->EE->load->library('auth');
				$this->EE->auth->update_password($this->EE->input->post('author_id'),
					$_POST['password']);

			}

			$this->EE->db->query($this->EE->db->update_string('exp_members', $data, "member_id = '" . $this->EE->input->post('author_id') . "'"));

			/** -------------------------------------
			 * /**  Update comments if screen name has changed
			 * /** -------------------------------------*/
			if ($query->row('screen_name') != $_POST['screen_name']) {
				$this->EE->db->select('module_id');
				$this->EE->db->where('module_name', 'Comment');
				$module_query = $this->EE->db->get('modules');

				if ($module_query->num_rows() > 0) {
					$this->EE->db->query($this->EE->db->update_string('exp_comments', array('name' => $_POST['screen_name']), "author_id = '" . $this->EE->input->post('author_id') . "'"));
				}

				$this->EE->session->userdata['screen_name'] = stripslashes($_POST['screen_name']);
			}

			return array('success');

		}
	}


	// ==================
	// = Update profile =
	// ==================
	function update_profile()
	{

		if (!class_exists('Member')) {
			require PATH_MOD . 'member/mod.member.php';
		}

		if (!class_exists('Member_settings')) {
			require PATH_MOD . 'member/mod.member_settings.php';
		}

		$MS = new Member_settings();

		foreach (get_object_vars($this) as $key => $value) {
			$MS->{$key} = $value;
		}

		return $MS->update_profile();
	}


	// ===================
	// = Register member =
	// ===================
	function register_member($ext, $doRegister = TRUE, $error_handling = '')
	{

		$this->EE->load->helper('security');

		$inline_errors = array();

		//$this->EE->load->language("member");
		/** -------------------------------------
		 * /**  Do we allow new member registrations?
		 * /** ------------------------------------*/

		if ($this->EE->config->item('allow_member_registration') == 'n') {
			return array('general', array($this->EE->lang->line('member_registrations_not_allowed')));;
		}

		/** ----------------------------------------
		 * /**  Is user banned?
		 * /** ----------------------------------------*/

		if ($this->EE->session->userdata['is_banned'] == TRUE) {
			return array('general', array($this->EE->lang->line('not_authorized')));
		}

		/** ----------------------------------------
		 * /**  Blacklist/Whitelist Check
		 * /** ----------------------------------------*/

		if ($this->EE->blacklist->blacklisted == 'y' && $this->EE->blacklist->whitelisted == 'n') {
			return array('general', array($this->EE->lang->line('not_authorized')));
		}

		$this->EE->load->helper('url');

		/* -------------------------------------------
				 /* 'member_member_register_start' hook.
				 /*  - Take control of member registration routine
				 /*  - Added EE 1.4.2
				 */
		$edata = $this->EE->extensions->call('member_member_register_start');
		if ($this->EE->extensions->end_script === TRUE) return;
		/*
							/* -------------------------------------------*/


		/** ----------------------------------------
		 * /**  Set the default globals
		 * /** ----------------------------------------*/

		$default = array('username', 'password', 'password_confirm', 'email', 'screen_name', 'url', 'location');

		foreach ($default as $val) {
			if (!isset($_POST[$val])) $_POST[$val] = '';
		}

		if ($_POST['screen_name'] == '')
			$_POST['screen_name'] = $_POST['username'];

		/** -------------------------------------
		 * /**  Instantiate validation class
		 * /** -------------------------------------*/
		if (!class_exists('EE_Validate')) {
			require APPPATH . 'libraries/Validate' . EXT;
		}

		$VAL = new EE_Validate(
			array(
				'member_id'        => '',
				'val_type'         => 'new', // new or update
				'fetch_lang'       => TRUE,
				'require_cpw'      => FALSE,
				'enable_log'       => FALSE,
				'username'         => $_POST['username'],
				'cur_username'     => '',
				'screen_name'      => $_POST['screen_name'],
				'cur_screen_name'  => '',
				'password'         => $_POST['password'],
				'password_confirm' => $_POST['password_confirm'],
				'cur_password'     => '',
				'email'            => $_POST['email'],
				'cur_email'        => ''
			)
		);

		// load the language file
		$this->EE->lang->loadfile('zoo_visitor');


		$VAL->validate_email();
		$inline_errors["email"] = $VAL->errors;
		$offset                 = count($VAL->errors);

		/** -------------------------------------
		 * /**  Zoo Visitor conditional checking
		 * /** -------------------------------------*/

		if ($this->zoo_settings['email_is_username'] != 'yes') {
			$VAL->validate_username();

			$inline_errors["username"] = array_slice($VAL->errors, $offset);
			$offset                    = count($VAL->errors);
		}


		if ($this->zoo_settings['use_screen_name'] != "no") {
			$VAL->validate_screen_name();
			$inline_errors["screen_name"] = array_slice($VAL->errors, $offset);
			$offset                       = count($VAL->errors);
		}


		$VAL->validate_password();
		$inline_errors["password"] = array_slice($VAL->errors, $offset);
		$offset                    = count($VAL->errors);

		/** -------------------------------------
		 * /**  Do we have any custom fields?
		 * /** -------------------------------------*/

		$query = $this->EE->db->query("SELECT m_field_id, m_field_name, m_field_label, m_field_required FROM exp_member_fields");

		$cust_errors = array();
		$cust_fields = array();

		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				if ($row['m_field_required'] == 'y' && (!isset($_POST['m_field_id_' . $row['m_field_id']]) OR $_POST['m_field_id_' . $row['m_field_id']] == '')) {
					$cust_errors[]                       = $this->EE->lang->line('mbr_field_required') . '&nbsp;' . $row['m_field_label'];
					$inline_errors[$row['m_field_name']] = array($this->EE->lang->line('mbr_field_required') . '&nbsp;' . $row['m_field_label']);
				} elseif (isset($_POST['m_field_id_' . $row['m_field_id']])) {
					$cust_fields['m_field_id_' . $row['m_field_id']] = $this->EE->security->xss_clean($_POST['m_field_id_' . $row['m_field_id']]);
				}
			}
		}

		if (isset($_POST['email_confirm']) && $_POST['email'] != $_POST['email_confirm']) {
			$cust_errors[]                  = $this->EE->lang->line('mbr_emails_not_match');
			$inline_errors["email_confirm"] = array($this->EE->lang->line('mbr_emails_not_match'));
		}

		if ($this->EE->config->item('use_membership_captcha') == 'y') {

			if (!isset($_POST['captcha']) OR $_POST['captcha'] == '') {
				$cust_errors[]            = $this->EE->lang->line('captcha_required');
				$inline_errors["captcha"] = array($this->EE->lang->line('captcha_required'));
			}
		}

		/** ----------------------------------------
		 * /**  Do we require captcha?
		 * /** ----------------------------------------*/

		if ($this->EE->config->item('use_membership_captcha') == 'y') {
			$query = $this->EE->db->query("SELECT COUNT(*) AS count FROM exp_captcha WHERE word='" . $this->EE->db->escape_str($_POST['captcha']) . "' AND ip_address = '" . $this->EE->input->ip_address() . "' AND date > UNIX_TIMESTAMP()-7200");

			if ($query->row('count') == 0) {
				$cust_errors[]            = $this->EE->lang->line('captcha_incorrect');
				$inline_errors["captcha"] = array($this->EE->lang->line('captcha_incorrect'));

			}

			//$this->EE->db->query("DELETE FROM exp_captcha WHERE (word='" . $this->EE->db->escape_str($_POST['captcha']) . "' AND ip_address = '" . $this->EE->input->ip_address() . "') OR date < UNIX_TIMESTAMP()-7200");
		}

		if ($this->EE->config->item('require_terms_of_service') == 'y') {
			if (!isset($_POST['accept_terms'])) {
				$cust_errors[]                 = $this->EE->lang->line('mbr_terms_of_service_required');
				$inline_errors["accept_terms"] = array($this->EE->lang->line('mbr_terms_of_service_required'));
			}
		}

		$errors = array_merge($VAL->errors, $cust_errors);

		// ===========================
		// = Set default membergroup =
		// ===========================
		if ($this->EE->config->item('req_mbr_activation') == 'manual' OR $this->EE->config->item('req_mbr_activation') == 'email') {
			$data['group_id'] = 4; // Pending
		} else {
			if ($this->EE->config->item('default_member_group') == '') {
				$data['group_id'] = 4; // Pending
			} else {
				$data['group_id'] = $this->EE->config->item('default_member_group');
			}
		}

		// ============================================
		// = Check if there is a membergroup selected =
		// ============================================
		$selected_group_id = $this->check_membergroup_change($data);

		/** -------------------------------------
		 * /**  Display error is there are any
		 * /** -------------------------------------*/
		if (count($errors) > 0) {
			return array('submission', $inline_errors);
			//return array('submission', $errors);
		}

		if (!$doRegister) {
			return TRUE;
		}


		/** ----------------------------------------
		 * /**  Secure Mode Forms?
		 * /** ----------------------------------------*/

		if ($this->EE->config->item('secure_forms') == 'y') {
			if (version_compare(APP_VER, '2.5.4', '>=')) {
				// Secure Mode Forms?
				if ($this->EE->config->item('secure_forms') == 'y' AND !$this->EE->security->secure_forms_check($this->EE->input->post('XID'))) {
					return $this->EE->output->show_user_error('general', array(lang('not_authorized')));
				}
			} else {

				$query = $this->EE->db->query("SELECT COUNT(*) AS count FROM exp_security_hashes WHERE hash='" . $this->EE->db->escape_str($_POST['XID']) . "' AND ip_address = '" . $this->EE->input->ip_address() . "' AND ip_address = '" . $this->EE->input->ip_address() . "' AND date > UNIX_TIMESTAMP()-7200");

				if ($query->row('count') == 0) {
					return array('general', array($this->EE->lang->line('not_authorized')));
				}

				$this->EE->db->query("DELETE FROM exp_security_hashes WHERE (hash='" . $this->EE->db->escape_str($_POST['XID']) . "' AND ip_address = '" . $this->EE->input->ip_address() . "') OR date < UNIX_TIMESTAMP()-7200");
			}
		}


		/** -------------------------------------
		 * /**  Assign the base query data
		 * /** -------------------------------------*/

		$data['username'] = $_POST['username'];

		if (version_compare(APP_VER, '2.8.0', '>=')) {
			$data['password'] = sha1($_POST['password']);
		} elseif (version_compare(APP_VER, '2.6.0', '<')) {
			$data['password'] = $this->EE->functions->hash(stripslashes($_POST['password']));
		} else {
			$data['password'] = do_hash(stripslashes($_POST['password']));
		}

		$data['ip_address']  = $this->EE->input->ip_address();
		$data['unique_id']   = $this->EE->functions->random('encrypt');
		$data['join_date']   = $this->EE->localize->now;
		$data['email']       = $_POST['email'];
		$data['screen_name'] = $_POST['screen_name'];
		$data['url']         = prep_url($_POST['url']);
		$data['location']    = $_POST['location'];
		// overridden below if used as optional fields
		$data['language']    = ($this->EE->config->item('deft_lang')) ? $this->EE->config->item('deft_lang') : 'english';
		$data['time_format'] = ($this->EE->config->item('time_format')) ? $this->EE->config->item('time_format') : 'us';
		$data['timezone']    = ($this->EE->config->item('default_site_timezone') && $this->EE->config->item('default_site_timezone') != '') ? $this->EE->config->item('default_site_timezone') : $this->EE->config->item('server_timezone');

		if (APP_VER < '2.6.0') {
			$data['daylight_savings'] = ($this->EE->config->item('default_site_dst') && $this->EE->config->item('default_site_dst') != '') ? $this->EE->config->item('default_site_dst') : $this->EE->config->item('daylight_savings');
		}

		// ==========================
		// = Standard member fields =
		// ==========================

		$fields = array('bday_y',
			'bday_m',
			'bday_d',
			'url',
			'location',
			'occupation',
			'interests',
			'aol_im',
			'icq',
			'yahoo_im',
			'msn_im',
			'bio'
		);

		foreach ($fields as $val) {
			if ($this->EE->input->post($val)) {
				$data[$val] = (isset($_POST[$val])) ? $this->EE->security->xss_clean($_POST[$val]) : '';
				unset($_POST[$val]);
			}
		}

		if (isset($data['bday_d']) && is_numeric($data['bday_d']) && is_numeric($data['bday_m'])) {
			$year  = ($data['bday_y'] != '') ? $data['bday_y'] : date('Y');
			$mdays = $this->EE->localize->fetch_days_in_month($data['bday_m'], $year);

			if ($data['bday_d'] > $mdays) {
				$data['bday_d'] = $mdays;
			}
		}

		// Optional Fields
		$optional = array('bio'         => 'bio',
		                  'language'    => 'deft_lang',
		                  'timezone'    => 'server_timezone',
		                  'time_format' => 'time_format');

		foreach ($optional as $key => $value) {
			if (isset($_POST[$value])) {
				$data[$key] = $_POST[$value];
			}
		}

		/*
		if ($this->EE->input->post('daylight_savings') == 'y') {
			$data['daylight_savings'] = 'y';
		}
		elseif ($this->EE->input->post('daylight_savings') == 'n') {
			$data['daylight_savings'] = 'n';
		}
		*/
		// We generate an authorization code if the member needs to self-activate

		if ($this->EE->config->item('req_mbr_activation') == 'email') {
			$data['authcode'] = $this->EE->functions->random('alnum', 10);
		}

		/** -------------------------------------
		 * /**  Insert basic member data
		 * /** -------------------------------------*/
		$this->EE->db->query($this->EE->db->insert_string('exp_members', $data));

		$member_id = $this->EE->db->insert_id();


		// =============================================
		// = Override the screenname for use in emails =
		// =============================================
		$screen_name_overriden = $this->get_override_screen_name();
		$data['screen_name']   = ($screen_name_overriden !== FALSE) ? $screen_name_overriden : $data['screen_name'];


		// =========================================================================================
		// = Store the selected membergroup if it is defined in the form AND activation is required =
		// ==========================================================================================

		if (isset($selected_group_id) AND is_numeric($selected_group_id) AND $selected_group_id != '1') {
			if ($this->EE->config->item('req_mbr_activation') == 'email' || $this->EE->config->item('req_mbr_activation') == 'manual') {
				$activation_data              = array();
				$activation_data['member_id'] = $member_id;
				$activation_data['group_id']  = $selected_group_id;

				$this->EE->db->insert('zoo_visitor_activation_membergroup', $activation_data);
			}
		}

		// =====================
		// = HASH THE PASSWORD =
		// =====================
		$this->EE->load->library('auth');
		$hashed_pair = $this->EE->auth->hash_password($_POST['password']);

		if ($hashed_pair === FALSE) {

		} else {
			$this->EE->db->where('member_id', (int)$member_id);
			$this->EE->db->update('members', $hashed_pair);
		}


		/** -------------------------------------
		 * /**  Insert custom fields
		 * /** -------------------------------------*/
		$cust_fields['member_id'] = $member_id;

		$this->EE->db->query($this->EE->db->insert_string('exp_member_data', $cust_fields));


		/** -------------------------------------
		 * /**  Create a record in the member homepage table
		 * /** -------------------------------------*/
		// This is only necessary if the user gains CP access, but we'll add the record anyway.

		$this->EE->db->query($this->EE->db->insert_string('exp_member_homepage', array('member_id' => $member_id)));

		/** -------------------------------------
		 * /**  Mailinglist Subscribe
		 * /** -------------------------------------*/

		$mailinglist_subscribe = FALSE;

		if (isset($_POST['mailinglist_subscribe']) && is_numeric($_POST['mailinglist_subscribe'])) {
			// Kill duplicate emails from authorizatin queue.
			$this->EE->db->query("DELETE FROM exp_mailing_list_queue WHERE email = '" . $this->EE->db->escape_str($_POST['email']) . "'");

			// Validate Mailing List ID
			$query = $this->EE->db->query("SELECT COUNT(*) AS count
								 FROM exp_mailing_lists
								 WHERE list_id = '" . $this->EE->db->escape_str($_POST['mailinglist_subscribe']) . "'");

			// Email Not Already in Mailing List
			$results = $this->EE->db->query("SELECT count(*) AS count
									FROM exp_mailing_list
									WHERE email = '" . $this->EE->db->escape_str($_POST['email']) . "'
									AND list_id = '" . $this->EE->db->escape_str($_POST['mailinglist_subscribe']) . "'");

			/** -------------------------------------
			 * /**  INSERT Email
			 * /** -------------------------------------*/

			if ($query->row('count') > 0 && $results->row('count') == 0) {
				$mailinglist_subscribe = TRUE;

				$code = $this->EE->functions->random('alnum', 10);

				if ($this->EE->config->item('req_mbr_activation') == 'email') {
					// Activated When Membership Activated
					$this->EE->db->query("INSERT INTO exp_mailing_list_queue (email, list_id, authcode, date)
								VALUES ('" . $this->EE->db->escape_str($_POST['email']) . "', '" . $this->EE->db->escape_str($_POST['mailinglist_subscribe']) . "', '" . $code . "', '" . time() . "')");
				} elseif ($this->EE->config->item('req_mbr_activation') == 'manual') {
					// Mailing List Subscribe Email
					$this->EE->db->query("INSERT INTO exp_mailing_list_queue (email, list_id, authcode, date)
								VALUES ('" . $this->EE->db->escape_str($_POST['email']) . "', '" . $this->EE->db->escape_str($_POST['mailinglist_subscribe']) . "', '" . $code . "', '" . time() . "')");

					$this->EE->lang->loadfile('mailinglist');
					$action_id = $this->EE->functions->fetch_action_id('Mailinglist', 'authorize_email');

					$swap = array(
						'activation_url' => $this->EE->functions->fetch_site_index(0, 0) . QUERY_MARKER . 'ACT=' . $action_id . '&id=' . $code,
						'site_name'      => stripslashes($this->EE->config->item('site_name')),
						'site_url'       => $this->EE->config->item('site_url')
					);

					$template  = $this->EE->functions->fetch_email_template('mailinglist_activation_instructions');
					$email_tit = $this->EE->functions->var_swap($template['title'], $swap);
					$email_msg = $this->EE->functions->var_swap($template['data'], $swap);

					/** ----------------------------
					 * /**  Send email
					 * /** ----------------------------*/

					$this->EE->load->library('email');
					$this->EE->email->wordwrap = true;
					$this->EE->email->mailtype = 'plain';
					$this->EE->email->priority = '3';

					$this->EE->email->from($this->EE->config->item('webmaster_email'), $this->EE->config->item('webmaster_name'));
					$this->EE->email->to($_POST['email']);
					$this->EE->email->subject($email_tit);
					$this->EE->email->message($email_msg);
					$this->EE->email->send();
				} else {
					// Automatically Accepted
					$this->EE->db->query("INSERT INTO exp_mailing_list (list_id, authcode, email, ip_address)
										  VALUES ('" . $this->EE->db->escape_str($_POST['mailinglist_subscribe']) . "', '" . $code . "', '" . $this->EE->db->escape_str($_POST['email']) . "', '" . $this->EE->db->escape_str($this->EE->input->ip_address()) . "')");
				}
			}
		}

		/** -------------------------------------
		 * /**  Update
		 * /** -------------------------------------*/

		if ($this->EE->config->item('req_mbr_activation') == 'none') {
			$this->EE->stats->update_member_stats();
		}


		/** -------------------------------------
		 * /**  Send admin notifications
		 * /** -------------------------------------*/
		if ($this->EE->config->item('new_member_notification') == 'y' AND $this->EE->config->item('mbr_notification_emails') != '') {
			$name = ($data['screen_name'] != '') ? $data['screen_name'] : $data['username'];

			$swap = array(
				'name'              => $name,
				'site_name'         => stripslashes($this->EE->config->item('site_name')),
				'control_panel_url' => $this->EE->config->item('cp_url'),
				'username'          => $data['username'],
				'email'             => $data['email']
			);

			$template  = $this->EE->functions->fetch_email_template('admin_notify_reg');
			$email_tit = $this->_var_swap($template['title'], $swap);
			$email_msg = $this->_var_swap($template['data'], $swap);

			$this->EE->load->helper('string');
			// Remove multiple commas
			$notify_address = reduce_multiples($this->EE->config->item('mbr_notification_emails'), ',', TRUE);

			/** ----------------------------
			 * /**  Send email
			 * /** ----------------------------*/

			// Load the text helper
			$this->EE->load->helper('text');

			$this->EE->load->library('email');
			$this->EE->email->wordwrap = true;
			$this->EE->email->from($this->EE->config->item('webmaster_email'), $this->EE->config->item('webmaster_name'));
			$this->EE->email->to($notify_address);
			$this->EE->email->subject($email_tit);
			$this->EE->email->message(entities_to_ascii($email_msg));
			$this->EE->email->Send();
		}

		// -------------------------------------------
		// 'member_member_register' hook.
		//  - Additional processing when a member is created through the User Side
		//  - $member_id added in 2.0.1
		//
		$edata = $this->EE->extensions->call('member_member_register', $data, $member_id);
		if ($this->EE->extensions->end_script === TRUE) return;
		//
		// -------------------------------------------

		/** -------------------------------------
		 * /**  Zoo Visitor assignment
		 * /** -------------------------------------*/

		$member_data              = $data;
		$member_data["member_id"] = $member_id;

		/** -------------------------------------
		 * /**  Send user notifications
		 * /** -------------------------------------*/
		if ($this->EE->config->item('req_mbr_activation') == 'email') {
			$action_id = $this->EE->functions->fetch_action_id('Member', 'activate_member');

			$name = ($data['screen_name'] != '') ? $data['screen_name'] : $data['username'];

			$board_id = ($this->EE->input->get_post('board_id') !== FALSE && is_numeric($this->EE->input->get_post('board_id'))) ? $this->EE->input->get_post('board_id') : 1;

			$forum_id = ($this->EE->input->get_post('FROM') == 'forum') ? '&r=f&board_id=' . $board_id : '';

			$add = ($mailinglist_subscribe !== TRUE) ? '' : '&mailinglist=' . $_POST['mailinglist_subscribe'];

			$swap = array(
				'name'           => $name,
				'activation_url' => $this->EE->functions->fetch_site_index(0, 0) . QUERY_MARKER . 'ACT=' . $action_id . '&id=' . $data['authcode'] . $forum_id . $add,
				'site_name'      => stripslashes($this->EE->config->item('site_name')),
				'site_url'       => $this->EE->config->item('site_url'),
				'username'       => $data['username'],
				'email'          => $data['email']
			);

			$template  = $this->EE->functions->fetch_email_template('mbr_activation_instructions');
			$email_tit = $this->_var_swap($template['title'], $swap);
			$email_msg = $this->_var_swap($template['data'], $swap);

			/** ----------------------------
			 * /**  Send email
			 * /** ----------------------------*/

			// Load the text helper
			$this->EE->load->helper('text');

			$this->EE->load->library('email');
			$this->EE->email->wordwrap = true;
			$this->EE->email->from($this->EE->config->item('webmaster_email'), $this->EE->config->item('webmaster_name'));
			$this->EE->email->to($data['email']);
			$this->EE->email->subject($email_tit);
			$this->EE->email->message(entities_to_ascii($email_msg));
			$this->EE->email->Send();

			$message = $this->EE->lang->line('mbr_membership_instructions_email');
		} elseif ($this->EE->config->item('req_mbr_activation') == 'manual') {
			$message = $this->EE->lang->line('mbr_admin_will_activate');
		} else {
			/** ----------------------------------------
			 * /**  Log user is handled at the end of the extension
			 * /** ----------------------------------------*/

		}


		/** ----------------------------------------
		 * /**  Build the message
		 * /** ----------------------------------------*/

		if ($this->EE->input->get_post('FROM') == 'forum') {
			if ($this->EE->input->get_post('board_id') !== FALSE && is_numeric($this->EE->input->get_post('board_id'))) {
				$query = $this->EE->db->query("SELECT board_forum_url, board_id, board_label FROM exp_forum_boards WHERE board_id = '" . $this->EE->db->escape_str($this->EE->input->get_post('board_id')) . "'");
			} else {
				$query = $this->EE->db->query("SELECT board_forum_url, board_id, board_label FROM exp_forum_boards WHERE board_id = '1'");
			}

			$site_name = $query->row('board_label');
			$return    = $query->row('board_forum_url');
		} else {
			$site_name = ($this->EE->config->item('site_name') == '') ? $this->EE->lang->line('back') : stripslashes($this->EE->config->item('site_name'));
			$return    = $this->EE->config->item('site_url');
		}

		$data = array('title'       => $this->EE->lang->line('mbr_registration_complete'),
		              'heading'     => $this->EE->lang->line('thank_you'),
		              'content'     => $this->EE->lang->line('mbr_registration_completed'),
		              'redirect'    => '',
		              'link'        => array($return, $site_name),
		              'result'      => 'registration_complete',
		              'member_data' => $member_data
		);

		//$this->EE->output->show_message($data);
		return $data;
	}

	// ======================
	// = Get Memeber Groups =
	// ======================
	function get_member_groups()
	{

		// Member groups assignment

		if ($this->EE->session->userdata['group_id'] != 1) {
			$query = $this->EE->member_model->get_member_groups('', array('is_locked' => 'n'));
		} else {
			$query = $this->EE->member_model->get_member_groups();
		}

		$vars = array();

		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				// If the current user is not a Super Admin
				// we'll limit the member groups in the list

				if ($this->EE->session->userdata['group_id'] != 1) {
					if ($row->group_id == 1) {
						continue;
					}
				}

				$vars[$row->group_id] = $row->group_title;
			}
		}

		return $vars;

	}

	// ====================================
	// = Get member id based on entry -id =
	// ====================================
	function get_member_id($entry_id)
	{

		$entry_query = $this->EE->db->where('entry_id', $entry_id)->order_by('entry_id', 'desc')->limit(1)->get('channel_titles');
		$entry       = $entry_query->row();

		if ($entry_id == 0) {
			return FALSE;
		}
		//entry found
		if ($entry_query->num_rows() > 0) {

			$member_query = $this->EE->db->where('member_id', $entry->author_id)->get('members');

			if ($member_query->num_rows() > 0) {
				return $member_query->row();
			} else {
				return FALSE;
			}
		} else {
			return FALSE;
		}
	}

	function update_entry_title($entry_id)
	{

		//get author_id to get EE member details
		// $member_query = $this->EE->db->where('member_id', $entry->author_id)->get('members');

		$member = $this->get_member_id($entry_id);

		if ($member != FALSE) {
			//refresh the settings
			$this->zoo_settings = get_zoo_settings($this->EE, TRUE);

			if ($this->zoo_settings['title_override'] != '') {
				$title = '';

				$this->EE->db->where('entry_id', $entry_id);
				//$this->EE->db->where('site_id',$this->EE->config->item('site_id'));

				$query = $this->EE->db->get('channel_data');
				if ($query->num_rows() > 0) {

					$title  = $this->zoo_settings['title_override'];
					$fields = array_reverse($query->row_array());
					foreach ($fields as $key => $val) {
						$title = str_replace($key, $val, $title);
					}
				}

				$this->EE->db->where('member_id', $member->member_id);
				$query_mem = $this->EE->db->get('members');

				if ($query_mem->num_rows() > 0) {

					$fields = $query_mem->row_array();
					foreach ($fields as $key => $val) {
						$title = str_replace($key, $val, $title);
					}
				}

				// ========================================================
				// = if custom fields are empty, fall back to screenname  =
				// ========================================================
				$title = (str_replace(' ', '', $title) == "") ? $member->screen_name : $title;

			} else {
				// $title = $member->email;
				//
				// if($this->zoo_settings['email_is_username'] != 'yes')
				// {
				// 	$title .= $member->username;
				// }
				// if($this->zoo_settings['use_screen_name'] != "no")
				// {
				$title = $member->screen_name;
				//}

			}

			$titlecheck = str_replace(' ', '', $title);


			if ($titlecheck != '') {

				$url_title = url_title($title, 'dash', TRUE);
				$url_title = $this->validate_url_title($url_title, $title, TRUE, $entry_id, $this->zoo_settings['member_channel_id']);

				// =================================================================================================
				// = there is a problem with converting the title to a volid url title (numbers, foreign chars...) =
				// =================================================================================================
				if (!$url_title) {
					$url_title = $member->screen_name;
					$url_title = url_title($url_title, 'dash', TRUE);
					$url_title = $this->validate_url_title($url_title, $url_title, TRUE, $entry_id, $this->zoo_settings['member_channel_id']);

					if (!$url_title) {
						$url_title = $member->username;
						$url_title = url_title($url_title, 'dash', TRUE);
						$url_title = $this->validate_url_title($url_title, $url_title, TRUE, $entry_id, $this->zoo_settings['member_channel_id']);

						if (!$url_title) {
							$url_title = $member->email;
							$url_title = url_title($url_title, 'dash', TRUE);
							$url_title = $this->validate_url_title($url_title, $url_title, TRUE, $entry_id, $this->zoo_settings['member_channel_id']);
						}
					}
				}
				//$url_title = $this->unique_url_title($url_title, $entry_id, $this->zoo_settings['member_channel_id']);


				// //set channel entry title and url title
				if ($url_title != FALSE) {
					$this->EE->db->update('channel_titles', array('title'     => $title,
					                                              'url_title' => $url_title), 'entry_id = ' . $entry_id);
				}
			}
		}

	}


	// =====================
	// = replace variables =
	// =====================

	function _var_swap($str, $data)
	{
		if (!is_array($data)) {
			return FALSE;
		}

		foreach ($data as $key => $val) {
			$str = str_replace('{' . $key . '}', $val, $str);
		}

		return $str;
	}

	// ============================
	// = replace single variables =
	// ============================
	function _var_swap_single($search, $replace, $source)
	{
		return str_replace(LD . $search . RD, $replace, $source);
	}

	function unique_url_title($url_title, $self_id, $type_id = '', $type = 'channel')
	{

		if ($type_id == '') {
			return FALSE;
		}

		switch ($type) {
			case 'category'    :
				$table           = 'categories';
				$url_title_field = 'cat_url_title';
				$type_field      = 'group_id';
				$self_field      = 'category_id';
				break;
			default            :
				$table           = 'channel_titles';
				$url_title_field = 'url_title';
				$type_field      = 'channel_id';
				$self_field      = 'entry_id';
				break;
		}

		// Field is limited to 75 characters, so trim url_title before querying
		$url_title = substr($url_title, 0, 75);

		if ($self_id != '') {
			$this->EE->db->where(array($self_field . ' !=' => $self_id));
		}

		$this->EE->db->where(array($url_title_field => $url_title,
		                           $type_field      => $type_id));
		$count = $this->EE->db->count_all_results($table);

		if ($count > 0) {
			// We may need some room to add our numbers- trim url_title to 70 characters
			$url_title = substr($url_title, 0, 70);

			// Check again
			if ($self_id != '') {
				$this->EE->db->where(array($self_field . ' !=' => $self_id));
			}

			$this->EE->db->where(array($url_title_field => $url_title,
			                           $type_field      => $type_id));
			$count = $this->EE->db->count_all_results($table);

			if ($count > 0) {
				if ($self_id != '') {
					$this->EE->db->where(array($self_field . ' !=' => $self_id));
				}

				$this->EE->db->select("{$url_title_field}, MID({$url_title_field}, " . (strlen($url_title) + 1) . ") + 1 AS next_suffix", FALSE);
				$this->EE->db->where("{$url_title_field} REGEXP('" . preg_quote($this->EE->db->escape_str($url_title)) . "[0-9]*$')");
				$this->EE->db->where(array($type_field => $type_id));
				$this->EE->db->order_by('next_suffix', 'DESC');
				$this->EE->db->limit(1);
				$query = $this->EE->db->get($table);

				// Did something go tragically wrong?  Is the appended number going to kick us over the 75 character limit?
				if ($query->num_rows() == 0 OR ($query->row('next_suffix') > 99999)) {
					return FALSE;
				}

				$url_title = $url_title . $query->row('next_suffix');

				// little double check for safety

				if ($self_id != '') {
					$this->EE->db->where(array($self_field . ' !=' => $self_id));
				}

				$this->EE->db->where(array($url_title_field => $url_title,
				                           $type_field      => $type_id));
				$count = $this->EE->db->count_all_results($table);

				if ($count > 0) {
					return FALSE;
				}
			}
		}

		return $url_title;
	}

	function validate_url_title($url_title = '', $title = '', $update = FALSE, $entry_id, $channel_id)
	{
		$word_separator = $this->EE->config->item('word_separator');

		$this->EE->load->helper('url');

		if (!trim($url_title)) {
			$url_title = url_title($title, $word_separator, TRUE);
		}

		// Remove extraneous characters

		if ($update) {
			$this->EE->db->select('url_title');
			$url_query = $this->EE->db->get_where('channel_titles', array('entry_id' => $entry_id));

			if ($url_query->row('url_title') != $url_title) {
				$url_title = url_title($url_title, $word_separator);
			}
		} else {
			$url_title = url_title($url_title, $word_separator);
		}

		// URL title cannot be a number

		if (is_numeric($url_title)) {
			return FALSE;
			//$this->_set_error('url_title_is_numeric', 'url_title');
		}

		// It also cannot be empty

		if (!trim($url_title)) {
			return FALSE;
			//$this->_set_error('unable_to_create_url_title', 'url_title');
		}

		// And now we need to make sure it's unique

		if ($update) {
			$url_title = $this->unique_url_title($url_title, $entry_id, $channel_id);
		} else {
			$url_title = $this->unique_url_title($url_title, '', $channel_id);
		}

		// One more safety

		if (!$url_title) {
			return FALSE;
			//$this->_set_error('unable_to_create_url_title', 'url_title');
		}

		// And lastly, we prevent this potentially problematic case

		if ($url_title == 'index') {
			return FALSE;
			//$this->_set_error('url_title_is_index', 'url_title');
		}

		return $url_title;
	}


	function sync_member_data()
	{
		$this->EE->load->library('zoo_visitor_cp');

		//Loop though members and build array based on the post fields
		$sql   = 'SELECT mem.member_id, mem.join_date, ct.author_id, ct.entry_id FROM exp_members mem LEFT JOIN exp_channel_titles ct ON (ct.author_id = mem.member_id AND ct.channel_id = "' . $this->zoo_settings['member_channel_id'] . '") WHERE ct.entry_id IS NULL AND mem.member_id != "' . $this->zoo_settings['anonymous_member_id'] . '"';
		$query = $this->EE->db->query($sql);
		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				//create entry, channel_title -> author_id  = member_id
				$insert_id = $this->create_member_entry($row);
				//run through posted fields, build data insert + field formatting => channel data

				if ($insert_id) {
					//run title update
					$this->update_entry_title($insert_id);

					//set membergroup status
					$this->EE->zoo_visitor_cp->sync_member_status($row->member_id);

					//sync the screen_name based on the provided override fields
					if ($this->zoo_settings['use_screen_name'] == "no" && $this->zoo_settings['screen_name_override'] != '') {
						$this->update_screen_name($row->member_id);
					}
				}

			}
		}

	}

	function create_member_entry($mem_row)
	{
		$sql = 'SELECT ct.entry_id FROM exp_channel_titles ct WHERE ct.channel_id = "' . $this->zoo_settings['member_channel_id'] . '" AND ct.author_id = "' . $mem_row->member_id . '"';

		$query = $this->EE->db->query($sql);

		if ($query->num_rows() == 0) {
			$data               = array();
			$data['site_id']    = $this->EE->config->item('site_id');
			$data['channel_id'] = $this->zoo_settings['member_channel_id'];
			$data['author_id']  = $mem_row->member_id; // @todo double check if this is validated
			$data['entry_date'] = $mem_row->join_date;
			$data['title']      = "temp-sync";
			$data['url_title']  = "temp-sync";

			$this->EE->db->insert('exp_channel_titles', $data);
			$insert_id = $this->EE->db->insert_id();

			$data               = array();
			$data['site_id']    = $this->EE->config->item('site_id');
			$data['entry_id']   = $insert_id;
			$data['channel_id'] = $this->zoo_settings['member_channel_id'];
			// ==================
			// = GET FIELD DATA =
			// ==================

			$this->zoo_settings = get_zoo_settings($this->EE, TRUE);

			// =======================================
			// = loop through standard member fields =
			// =======================================

			if ($this->zoo_settings['sync_standard_member_fields'] != '') {
				$standard_member_fields = explode('|', $this->zoo_settings['sync_standard_member_fields']);

				$standard_member_fields_filter = array();

				foreach ($standard_member_fields as $standard_field) {
					$parts            = explode(':', $standard_field);
					$channel_field_id = $parts[1];

					if ($this->EE->db->field_exists('field_id_' . $channel_field_id, 'exp_channel_data')) {
						$standard_member_fields_filter[] = $standard_field;
					}
				}

				$standard_member_fields = $standard_member_fields_filter;

				$sql_standard = 'SELECT * FROM exp_members WHERE member_id = "' . $mem_row->member_id . '"';

				$query_standard = $this->EE->db->query($sql_standard);

				if ($query_standard->num_rows() > 0) {
					$row_standard = $query_standard->row_array();
					foreach ($standard_member_fields as $standard_field) {
						$parts             = explode(':', $standard_field);
						$member_field_name = $parts[0];
						$channel_field_id  = $parts[1];

						if (isset($row_standard[$member_field_name])) {
							if ($member_field_name == 'avatar_filename') {
								$data['field_id_' . $channel_field_id] = $row_standard[$member_field_name];
							} else {
								$data['field_id_' . $channel_field_id] = $row_standard[$member_field_name];
							}
						}
					}
				}
			}
			// =====================================
			// = loop through custom member fields =
			// =====================================

			if ($this->zoo_settings['sync_custom_member_fields'] != '') {
				$custom_member_fields = explode('|', $this->zoo_settings['sync_custom_member_fields']);

				$custom_member_fields_filter = array();

				foreach ($custom_member_fields as $custom_field) {
					$parts            = explode(':', $custom_field);
					$channel_field_id = $parts[1];

					if ($this->EE->db->field_exists('field_id_' . $channel_field_id, 'exp_channel_data')) {
						$custom_member_fields_filter[] = $custom_field;
					}
				}

				$custom_member_fields = $custom_member_fields_filter;

				$sql_custom = 'SELECT * FROM exp_member_data WHERE member_id = "' . $mem_row->member_id . '"';

				$query_custom = $this->EE->db->query($sql_custom);

				if ($query_custom->num_rows() > 0) {
					$row_custom = $query_custom->row_array();
					foreach ($custom_member_fields as $custom_field) {
						$parts            = explode(':', $custom_field);
						$member_field_id  = $parts[0];
						$channel_field_id = $parts[1];

						if (isset($row_custom['m_field_id_' . $member_field_id])) {
							$data['field_id_' . $channel_field_id] = $row_custom['m_field_id_' . $member_field_id];
							$data['field_ft_' . $channel_field_id] = 'none';
						}
					}
				}
			}


			$this->EE->db->insert('exp_channel_data', $data);

			return $insert_id;
		} else {
			return FALSE;
		}
	}

	function _validate_current_password($current_password, $member_id)
	{
		$this->EE->lang->loadfile('myaccount');

		if ($this->EE->session->userdata('group_id') == 1) {
			//return;
		}

		if ($current_password == '') {
			return $this->EE->lang->line('missing_current_password');
		}

		$this->EE->load->library('auth');

		// Get the users current password
		$pq = $this->EE->db->select('password, salt')
			->get_where('members', array(
					'member_id' => (int)$member_id)
			);


		if (!$pq->num_rows()) {
			return $this->EE->lang->line('invalid_password');
		}

		$passwd = $this->EE->auth->hash_password($current_password, $pq->row('salt'));

		if (!isset($passwd['salt']) OR ($passwd['password'] != $pq->row('password'))) {
			return $this->EE->lang->line('invalid_password');
		}

		return 'valid';
	}
}

?>