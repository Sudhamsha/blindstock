<?php

if (!defined('BASEPATH')) exit('Invalid file request');
require_once PATH_THIRD . 'zoo_visitor/config.php';

/**
 * Zoo Visitor Class
 *
 * @package   Zoo Visitor
 * @author    ExpressionEngine Zoo <hello@ee-zoo.com>
 * @copyright Copyright (c) 2011 ExpressionEngine Zoo (http://ee-zoo.com)
 */
class Zoo_visitor
{

	var $version = ZOO_VISITOR_VER;
	var $module_name = ZOO_VISITOR_CLASS;
	var $class_name = ZOO_VISITOR_CLASS;

	var $return_data;
	var $in_forum = FALSE;

	/**
	 * Module Constructor
	 */
	function Zoo_visitor()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();

		//$this->EE->load->add_package_path(PATH_THIRD . 'zoo_visitor/');
		$this->EE->load->library('zoo_visitor_lib');
		$this->EE->load->helper('zoo_visitor');
		$this->settings = get_zoo_settings($this->EE);


		$this->parse_variables                           = array();
		$this->parse_variables['error:username']         = '';
		$this->parse_variables['error:screen_name']      = '';
		$this->parse_variables['error:email']            = '';
		$this->parse_variables['error:email_confirm']    = '';
		$this->parse_variables['error:password']         = '';
		$this->parse_variables['error:current_password'] = '';
		$this->parse_variables['error:captcha']          = '';
		$this->parse_variables['error:accept_terms']     = '';
	}

	// =====================================================================
	// = Gets entry ids of the current logged in member OR specific member 
	// = OR piped ids of all members of specific member group =
	// =====================================================================
	function id()
	{
		$member_id    = ($this->EE->TMPL->fetch_param('member_id') != '') ? $this->EE->TMPL->fetch_param('member_id') : 'current';
		$member_group = ($this->EE->TMPL->fetch_param('member_group') != '') ? $this->EE->TMPL->fetch_param('member_group') : '';

		if ($member_group != '') {

			$ids       = implode("','", explode('|', trim($member_group)));
			$query_str = "SELECT tit.entry_id FROM exp_members mem, exp_channel_titles tit WHERE tit.author_id = mem.member_id AND tit.channel_id = '" . $this->settings['member_channel_id'] . "' AND mem.group_id IN ('" . $ids . "') GROUP BY mem.member_id";
			$query     = $this->EE->db->query($query_str);

			if ($query->num_rows() > 0) {
				$entry_ids = '0|';
				foreach ($query->result() as $row) {
					$entry_ids .= $row->entry_id . '|';
				}

				return $entry_ids;
			} else {
				return "0|";
			}

		} else {
			return $this->EE->zoo_visitor_lib->get_visitor_id($member_id);
		}
	}

	function entries_nested()
	{

		$tagdata = $this->EE->TMPL->tagdata;
		$tagdata = str_replace("nested:", "", $tagdata);
		$tagdata = str_replace("/nested:", "/", $tagdata);

		$entries_tag = '{exp:channel:entries ';

		foreach ($this->EE->TMPL->tagparams as $key => $value) {
			$entries_tag .= $key . '="' . $value . '" ';
		}

		$entries_tag .= '}' . $tagdata . '{/exp:channel:entries}';

		return $entries_tag;

	}

	function registration_form()
	{

		if (isset($this->settings['member_channel_id'])) {
			if (isset($this->settings['member_channel_name']) && $this->settings['member_channel_name'] != '') {
				//check if anonymous member has been set
				if (isset($this->settings['anonymous_member_id']) && $this->settings['anonymous_member_id'] != '' && $this->settings['anonymous_member_id'] != '0') {
					//check if member really exists
					$member_query = $this->EE->db->where('member_id', $this->settings['anonymous_member_id'])->get('members');
					if ($member_query->num_rows() == 0) {
						return lang('zoo_visitor_error_non_existing_anonymous_member');
					} else {

						$reg_form = $this->EE->TMPL->tagdata;

						//parse the captcha
						$reg_form = $this->parse_captcha($reg_form);


						// =========================
						// = Native members fields =
						// =========================
						$query = $this->EE->db->query("SELECT bday_y, bday_m, bday_d, url, location, occupation, interests, aol_im, icq, yahoo_im, msn_im, bio FROM exp_members WHERE member_id = '" . $this->EE->session->userdata('member_id') . "'");

						$reg_form = $this->_var_swap($reg_form, array('native:birthday_year'       => $this->_birthday_year($query->row('bday_y')),
						                                              'native:birthday_month'      => $this->_birthday_month($query->row('bday_m')),
						                                              'native:birthday_day'        => $this->_birthday_day($query->row('bday_d'))
							)
						);
						//include group_id as tag variable for error handling after posting incomplete forms
						if ($this->EE->input->post('group_id')) {
							$reg_form = $this->_var_swap($reg_form, array('group_id'    => $this->EE->input->post('group_id')));
						}

						if (version_compare(APP_VER, 2.7, '<')) {
							//wrap in safecracker tags
							$form = '{exp:safecracker channel="' . $this->settings['member_channel_name'] . '" use_live_url="no"  logged_out_member_id="' . $this->settings['anonymous_member_id'] . '" ' . $this->get_params() . ' }';
						}else{

							//XID needs to be restored, otherwise security check fails when using inline error reporting
							$this->EE->security->restore_xid();

							//wrap in channel form tags
							$form = '{exp:channel:form channel="' . $this->settings['member_channel_name'] . '" use_live_url="no"  logged_out_member_id="' . $this->settings['anonymous_member_id'] . '" ' . $this->get_params() . ' }';
						}

						//insert registration trigger 
						$form .= '<input type="hidden" name="zoo_visitor_error_delimiters" value="' . htmlentities($this->EE->TMPL->fetch_param('error_delimiters', '')) . '">';
						//set a hidden field if dynamic title parameter is being used, this parameter is not reachable anymore in extension hooks as it has been moved to a protected variable in Channel Form
						if($this->EE->TMPL->fetch_param('dynamic_title', FALSE)){
							$form .= '<input type="hidden" name="use_dynamic_title" value="yes" />';
						}
						$form .= '<input type="hidden" name="AG" value="' . encrypt_input($this->EE, $this->EE->TMPL->fetch_param('allowed_groups', '')) . '">';
						$form .= '<input type="hidden" name="autologin" value="' . $this->EE->TMPL->fetch_param('autologin', '') . '">';
						$form .= '<input type="hidden" name="zoo_visitor_action" id="zoo_visitor_action" value="register">' . $reg_form;

						if (version_compare(APP_VER, 2.7, '<')) {
							$form .= '{/exp:safecracker}';
						}else{
							//wrap in channel form tags
							$form .= '{/exp:channel:form}';
						}

						//if the form hasn't been submitted, remove error: fields (parse empty)
						return (count($_POST) == 0) ? $this->EE->TMPL->parse_variables($form, array($this->parse_variables)) : $form;

					}
				} else {
					return lang('zoo_visitor_error_non_existing_anonymous_member');
				}
			}
			else {
				return lang('zoo_visitor_error_non_existing_member_channel');
			}
		} else {
			return lang('zoo_visitor_error_no_member_channel');
		}

	}

	function update_form()
	{

		if (isset($this->settings['member_channel_id'])) {

			if (isset($this->settings['member_channel_name']) && $this->settings['member_channel_name'] != '') {

				$this->EE->db->where('channel_id', $this->settings['member_channel_id']);
				$this->EE->db->where('group_id', $this->EE->session->userdata['group_id']);
				$query_cmg = $this->EE->db->get('channel_member_groups');
				if ($query_cmg->num_rows() == 0) {
					//allow membergroup to update channel entry
					$cmg = array('channel_id' => $this->settings['member_channel_id'],
					             'group_id'   => $this->EE->session->userdata['group_id']);
					$this->EE->db->insert('channel_member_groups', $cmg);
				}

				$reg_form = $this->EE->TMPL->tagdata;

				//parse the captcha
				$reg_form = $this->parse_captcha($reg_form);

				$require_password = $this->EE->TMPL->fetch_param('require_password', '');
				$member_id        = $this->EE->TMPL->fetch_param('member_id', 'current');
				$member_entry_id  = $this->EE->TMPL->fetch_param('member_entry_id', '');
				$username         = $this->EE->TMPL->fetch_param('username', '');

				if ($member_entry_id == '') {
					if ($username != '') {
						$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id_by_username($username);
					}
					else {
						$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id($member_id);
					}
				}
				else {
					$entry_id = $member_entry_id;
				}

				// =========================
				// = Native members fields =
				// =========================
				$query = $this->EE->db->query("SELECT group_id, username, screen_name, email, bday_y, bday_m, bday_d, url, location, occupation, interests, aol_im, icq, yahoo_im, msn_im, bio FROM exp_members, exp_channel_titles ct WHERE member_id = ct.author_id AND ct.entry_id ='" . $entry_id . "'");


				$reg_form = $this->_var_swap($reg_form, array('native:birthday_year'         => $this->_birthday_year($query->row('bday_y')),
				                                              'native:birthday_month'        => $this->_birthday_month($query->row('bday_m')),
				                                              'native:birthday_day'          => $this->_birthday_day($query->row('bday_d')),
				                                              'native:url'                   => ($query->row('url') == '') ? 'http://' : $query->row('url'),
				                                              'native:location'              => $query->row('location'),
				                                              'native:occupation'            => $query->row('occupation'),
				                                              'native:interests'             => $query->row('interests'),
				                                              'native:aol_im'                => $query->row('aol_im'),
				                                              'native:icq'                   => $query->row('icq'),
				                                              'native:icq_im'                => $query->row('icq'),
				                                              'native:yahoo_im'              => $query->row('yahoo_im'),
				                                              'native:msn_im'                => $query->row('msn_im'),
				                                              'native:bio'                   => $query->row('bio'),
				                                              'username'                     => $query->row('username'),
				                                              'screen_name'                  => $query->row('screen_name'),
				                                              'email'                        => $query->row('email'),
				                                              'member_group_id'              => $query->row('group_id')
					)
				);

				if (version_compare(APP_VER, 2.7, '<')) {
					//wrap in safecracker tags
					$form = '{exp:safecracker channel="' . $this->settings['member_channel_name'] . '" entry_id="' . $entry_id . '"  use_live_url="no" ' . $this->get_params() . '}';
				}else{

					//XID needs to be restored, otherwise security check fails when using inline error reporting
					$this->EE->security->restore_xid();

					//wrap in channel form tags
					$form = '{exp:channel:form channel="' . $this->settings['member_channel_name'] . '" entry_id="' . $entry_id . '"  use_live_url="no" ' . $this->get_params() . '}';
				}


				//insert registration trigger 
				$form .= '<input type="hidden" name="zoo_visitor_error_delimiters" value="' . htmlentities($this->EE->TMPL->fetch_param('error_delimiters', '')) . '">';
				$form .= '<input type="hidden" name="AG" value="' . encrypt_input($this->EE, $this->EE->TMPL->fetch_param('allowed_groups', '')) . '">';
				$form .= '<input type="hidden" name="zoo_visitor_action" id="zoo_visitor_action" value="update"><input type="hidden" name="EE_title" id="EE_title" value="' . $this->EE->zoo_visitor_lib->get_visitor_title() . '"><input type="hidden" name="zoo_visitor_require_password" id="zoo_visitor_require_password" value="' . $require_password . '">' . $reg_form;

				if (version_compare(APP_VER, 2.7, '<')) {
					$form .= '{/exp:safecracker}';
				}else{
					//wrap in channel form tags
					$form .= '{/exp:channel:form}';
				}

				//if the form hasn't been submitted, remove error: fields (parse empty)

				return (count($_POST) == 0) ? $this->EE->TMPL->parse_variables($form, array($this->parse_variables)) : $form;

			} else {
				return "The member channel specified in your Zoo Visitor settings does not exist.";
			}
		} else {
			return "No member channel has been specified, check your Zoo Visitor settings";
		}


	}

	function parse_captcha($reg_form)
	{
		//parse the captcha
		if (preg_match("/{if captcha}(.+?){\/if}/s", $reg_form, $match)) {
			if ($this->EE->config->item('use_membership_captcha') == 'y') {
				$reg_form = preg_replace("/{if captcha}.+?{\/if}/s", $match['1'], $reg_form);

				// Bug fix.  Deprecate this later..
				$reg_form = str_replace('{captcha_word}', '', $reg_form);

				if (!class_exists('Template')) {
					$reg_form = preg_replace("/{captcha}/", $this->EE->functions->create_captcha(), $reg_form);
				}
			}
			else {
				$reg_form = preg_replace("/{if captcha}.+?{\/if}/s", "", $reg_form);
			}
		}

		return $reg_form;
	}

	function get_params()
	{

		//param name / default value / include even if not provided

		$params   = array();
		$params[] = array('include_jquery', 'yes', true);
		$params[] = array('safecracker_head', 'yes', true);
		$params[] = array('preserve_checkboxes', 'yes', true);
		$params[] = array('json', 'yes', false);
		$params[] = array('datepicker', 'no', false);
		$params[] = array('secure_action', 'yes', false);
		$params[] = array('secure_return', 'yes', false);
		$params[] = array('error_handling', 'inline', false);
		$params[] = array('return', 'site', false);
		$params[] = array('return_X', 'site/thanks', false);
		$params[] = array('class', 'zoo_visitor_form', true);
		$params[] = array('id', 'zoo_visitor_form', true);
		$params[] = array('site', 'default_site', false);
		$params[] = array('dynamic_title', '', false);
		$params[] = array('rte_toolset_id', '', false);
		$params[] = array('rte_selector', '', false);

		// Save all used params
		$included_params = array();

		$param_str = '';
		foreach ($params as $param) {

			$include_if_not_provided = $param[2];
			$param_name              = $param[0];
			$param_value             = $param[1];

			$included_params[] = $param_name;

			$fetched_param = $this->EE->TMPL->fetch_param($param_name);

			//param is not set, see if we need to include it by FORCE!
			if (!$fetched_param && $include_if_not_provided) {
				$param_str .= $param_name . '="' . $param_value . '" ';
			}

			//param is set -> include it
			if ($fetched_param != FALSE) {
				$param_str .= $param_name . '="' . $fetched_param . '" ';
			}
		}

		foreach ($this->EE->TMPL->tagparams as $key => $value) {
			// If the param was included in the tag make sure it is used
			if (!in_array($key, $included_params)) {
				$param_str .= $key . '="' . $value . '"';
			}

			if (preg_match('/^rules:(.+)/', $key, $match)) {
				$param_str .= "rules:" . $match[1] . '="' . $value . '"';
			}
		}

		return $param_str;
	}

	function login_form()
	{
		return $this->EE->zoo_visitor_lib->login_form();
	}

	function logout()
	{
		return $this->EE->zoo_visitor_lib->logout();
	}

	function forgot_password()
	{
		//location of the "choose new password" form
		$reset_url = ($this->EE->TMPL->fetch_param('reset_url') != '') ? ee()->functions->fetch_site_index(0, 0).$this->EE->TMPL->fetch_param('reset_url') : $this->EE->functions->fetch_current_uri();

		$return          = ($this->EE->TMPL->fetch_param('return') != '') ? $this->EE->TMPL->fetch_param('return') : '';
		$error_handling  = $this->EE->TMPL->fetch_param('error_handling', '');
		$is_ajax_request = $this->EE->TMPL->fetch_param('json', 'no');
		return $this->EE->zoo_visitor_lib->forgot_password($this->EE->TMPL->tagdata, $return, $error_handling, $is_ajax_request, $reset_url);
	}

	function reset_password()
	{
		$return          = ($this->EE->TMPL->fetch_param('return') != '') ? $this->EE->TMPL->fetch_param('return') : '';
		$error_handling  = $this->EE->TMPL->fetch_param('error_handling', '');
		$is_ajax_request = $this->EE->TMPL->fetch_param('json', 'no');
		return $this->EE->zoo_visitor_lib->reset_password($this->EE->TMPL->tagdata, $return, $error_handling, $is_ajax_request);
	}

	function delete_form()
	{
		$return         = ($this->EE->TMPL->fetch_param('return') != '') ? $this->EE->TMPL->fetch_param('return') : $_SERVER['PHP_SELF'];
		$error_handling = $this->EE->TMPL->fetch_param('error_handling', '');
		return $this->EE->zoo_visitor_lib->delete_account($this->EE->TMPL->tagdata, $return, $error_handling);
	}

	function members()
	{

		$tagdata = $this->EE->TMPL->tagdata;

		if (!$tagdata) return;

		// =======================
		// = GET ONLY ONE MEMBER =
		// =======================
		$member_id       = $this->EE->TMPL->fetch_param('member_id', ''); //=> current for current logged in user
		$member_entry_id = $this->EE->TMPL->fetch_param('member_entry_id', '');
		$username        = $this->EE->TMPL->fetch_param('username', '');

		if ($member_entry_id != '') {
			unset($this->EE->TMPL->tagparams['member_entry_id']);
			$entry_id = $member_entry_id;
		}
		elseif ($username != '') {
			$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id_by_username($username);
		}
		elseif ($member_id != '') {
			$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id($member_id);
		}

		if ($member_id == 'current' || $member_entry_id == 'current') {
			$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id();
		}

		//JUST GET SELECTED MEMBERS
		if (isset($entry_id)) {
			$this->EE->TMPL->tagparams['entry_id'] = $entry_id;
		}

		$this->EE->TMPL->tagparams['channel']       = $this->settings['member_channel_name'];
		$this->EE->TMPL->tagparams['dynamic']       = 'no';
		$this->EE->TMPL->tagparams['status']        = $this->EE->TMPL->fetch_param('status', 'not closed');
		$this->EE->TMPL->tagparams['show_expired']  = 'yes';
		$this->EE->TMPL->tagparams['require_entry'] = 'no'; //(isset($entry_id)) ? 'yes' : 'no';
		$this->EE->TMPL->tagparams['orderby']       = $this->EE->TMPL->fetch_param('orderby', 'date');
		$this->EE->TMPL->tagparams['sort']          = $this->EE->TMPL->fetch_param('sort', 'desc');
		$this->EE->TMPL->tagparams['limit']         = $this->EE->TMPL->fetch_param('limit', '1000');
		$this->EE->TMPL->tagparams['disable']       = $this->EE->TMPL->fetch_param('disable', '');

		$this->EE->TMPL->tagparams['group_id'] = $this->EE->TMPL->fetch_param('member_group', '');

		$tagdata = str_replace("visitor:", "", $tagdata);
		$tagdata = str_replace("/visitor:", "/", $tagdata);

		if (version_compare(APP_VER, '2.1.3', '<')) {
			preg_match("/\{if no_results\}(.*?)\{\/if\}/s", $tagdata, $m);
			if (count($m) > 0) {
				$this->EE->TMPL->no_results_block = $m[0];
				$this->EE->TMPL->no_results       = $m[1];
			}
		}


		$this->EE->TMPL->tagdata = $tagdata;

		$vars                       = $this->EE->functions->assign_variables($tagdata);
		$this->EE->TMPL->var_single = $vars['var_single'];
		$this->EE->TMPL->var_pair   = $vars['var_pair'];

		if (!class_exists('Channel')) {
			require PATH_MOD . 'channel/mod.channel.php';
		}

		// create a new Channel object and run entries()
		$Channel = new Channel();
		return $Channel->entries();

	}


	function memberlist()
	{

		return $this->members();

	}

	function details()
	{

		$TMPL_cache = $this->EE->TMPL;
		$tagdata    = $this->EE->TMPL->tagdata;

		if (!$tagdata) return;

		$member_id       = $this->EE->TMPL->fetch_param('member_id', 'current');
		$member_entry_id = $this->EE->TMPL->fetch_param('member_entry_id', '');
		$username        = $this->EE->TMPL->fetch_param('username', '');
		$url_title       = $this->EE->TMPL->fetch_param('url_title', '');

		if (!$member_id && !$member_entry_id) return;

		if ($member_entry_id == '') {
			if ($username != '') {
				$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id_by_username($username);
			}
			else {
				$entry_id = $this->EE->zoo_visitor_lib->get_visitor_id($member_id);
			}
		}
		else {
			$entry_id = $member_entry_id;
		}

		$entry_id = (!$entry_id) ? "-1" : $entry_id;

		$tagdata = str_replace("{visitor:", "{", $tagdata);
		$tagdata = str_replace("{/visitor:", "{/", $tagdata);
		$tagdata = str_replace("{if visitor:", "{if ", $tagdata);

		$tagdata = str_replace("member:", "", $tagdata);
		$tagdata = str_replace("/member:", "/", $tagdata);

		$this->EE->TMPL->tagdata = $tagdata;

		if (version_compare(APP_VER, '2.1.3', '<')) {
			preg_match("/\{if no_results\}(.*?)\{\/if\}/s", $tagdata, $m);
			if (count($m) > 0) {
				$this->EE->TMPL->no_results_block = $m[0];
				$this->EE->TMPL->no_results       = $m[1];
			}
			else {
				$this->EE->TMPL->no_results_block = '';
				$this->EE->TMPL->no_results       = '';
			}
		}


		if ($url_title == '') $this->EE->TMPL->tagparams['entry_id'] = $entry_id;
		if ($url_title != '') $this->EE->TMPL->tagparams['url_title'] = $url_title;

		$this->EE->TMPL->tagparams['channel']       = $this->settings['member_channel_name'];
		$this->EE->TMPL->tagparams['dynamic']       = 'no';
		$this->EE->TMPL->tagparams['status']        = 'not closed';
		$this->EE->TMPL->tagparams['show_expired']  = 'yes';
		$this->EE->TMPL->tagparams['require_entry'] = ($entry_id == '' || $entry_id == FALSE) ? 'yes' : 'no';

		if (!isset($this->EE->TMPL->tagparams['disable'])) {
			$this->EE->TMPL->tagparams['disable'] = ''; //categories|category_fields|member_data|pagination';
		}

		$vars                       = $this->EE->functions->assign_variables($tagdata);
		$this->EE->TMPL->var_single = $vars['var_single'];
		$this->EE->TMPL->var_pair   = $vars['var_pair'];

		if (!class_exists('Channel')) {
			require PATH_MOD . 'channel/mod.channel.php';
		}

		// create a new Channel object and run entries()
		$Channel = new Channel();

		return $Channel->entries();

	}

	public function sync()
	{

		$this->EE->zoo_visitor_lib->sync_member_data();

	}

	public function _var_swap($str, $data)
	{
		if (!is_array($data)) {
			return false;
		}

		foreach ($data as $key => $val) {
			if (!is_array($val)) {
				$str = str_replace('{' . $key . '}', $val, $str);
			}
		}

		return $str;
	}

	/**
	 * Create the "year" pull-down menu
	 */
	function _birthday_year($year = '')
	{
		$r = "<select name='bday_y' class='select'>\n";

		$selected = ($year == '') ? " selected='selected'" : '';

		$r .= "<option value=''{$selected}>" . $this->EE->lang->line('year') . "</option>\n";

		for ($i = date('Y', $this->EE->localize->now); $i > 1904; $i--) {
			$selected = ($year == $i) ? " selected='selected'" : '';

			$r .= "<option value='{$i}'{$selected}>" . $i . "</option>\n";
		}

		$r .= "</select>\n";

		return $r;
	}

	// --------------------------------------------------------------------

	/**
	 * Create the "month" pull-down menu
	 */
	function _birthday_month($month = '')
	{
		$months = array('01' => 'January',
		                '02' => 'February',
		                '03' => 'March',
		                '04' => 'April',
		                '05' => 'May',
		                '06' => 'June',
		                '07' => 'July',
		                '08' => 'August',
		                '09' => 'September',
		                '10' => 'October',
		                '11' => 'November',
		                '12' => 'December');

		$r = "<select name='bday_m' class='select'>\n";

		$selected = ($month == '') ? " selected='selected'" : '';

		$r .= "<option value=''{$selected}>" . $this->EE->lang->line('month') . "</option>\n";

		for ($i = 1; $i < 13; $i++) {
			if (strlen($i) == 1)
				$i = '0' . $i;

			$selected = ($month == $i) ? " selected='selected'" : '';

			$r .= "<option value='{$i}'{$selected}>" . $this->EE->lang->line($months[$i]) . "</option>\n";
		}

		$r .= "</select>\n";

		return $r;
	}

	/**
	 * Create the "day" pull-down menu
	 */
	function _birthday_day($day = '')
	{
		$r = "<select name='bday_d' class='select'>\n";

		$selected = ($day == '') ? " selected='selected'" : '';

		$r .= "<option value=''{$selected}>" . $this->EE->lang->line('day') . "</option>\n";

		for ($i = 1; $i <= 31; $i++) {
			$selected = ($day == $i) ? " selected='selected'" : '';

			$r .= "<option value='{$i}'{$selected}>" . $i . "</option>\n";
		}

		$r .= "</select>\n";

		return $r;
	}


}