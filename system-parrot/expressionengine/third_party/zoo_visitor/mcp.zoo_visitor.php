<?php

if (!defined('BASEPATH')) exit('Invalid file request');
require_once PATH_THIRD . 'zoo_visitor/config.php';

/**
 * Zoo Visitor Control Panel Class
 *
 * @package   Zoo Visitor
 * @author    ExpressionEngine Zoo <info@eezoo.com>
 * @copyright Copyright (c) 2011 ExpressionEngine Zoo (http://eezoo.com)
 */
class Zoo_visitor_mcp
{
	var $module_name = ZOO_VISITOR_NAME;
	var $class_name = ZOO_VISITOR_CLASS;
	var $settings = null;

	/**
	 * Control Panel Constructor
	 */
	function Zoo_visitor_mcp()
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();

		// Variables
		$this->base      = BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=' . $this->class_name;
		$this->form_base = 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=' . $this->class_name;

		//nav
		$this->EE->cp->set_right_nav(array(
			'Overview'                 => BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor',
			'Installation'             => BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor' . AMP . 'method=installation',
			'Troubleshooting'          => BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor' . AMP . 'method=troubleshooting',
			'Settings'                 => BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor' . AMP . 'method=settings_form',
			'Transfer member data'     => BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor' . AMP . 'method=sync'
			//,'Sync' 				=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=zoo_visitor'.AMP.'method=sync'
		));

		// Load settings
		//$this->EE->load->add_package_path(PATH_THIRD . 'zoo_visitor/');
		$this->EE->load->helper('zoo_visitor');
		$this->EE->load->library('zoo_visitor_lib');
		$this->EE->load->library('zoo_visitor_cp');

		$this->settings = get_zoo_settings($this->EE);

		$this->EE->cp->add_to_head('<link rel="stylesheet" href="' . _theme_url($this->EE).'css/zoo_visitor.css" type="text/css" media="screen" /> ');
	}

	// --------------------------------------------------------------------

	function index()
	{
		// Variables
		$vars             = array();
		$vars['settings'] = $this->settings;

		// Load view
		return $this->_content_wrapper('index', 'index_title', $vars);
	}

	function sync_member_data()
	{
		$this->EE->zoo_visitor_lib->sync_member_data();
	}

	function sync()
	{

		//Does Zoo Visitor channel exists 
		$this->EE->db->where('channel_id', $this->settings['member_channel_id']);
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('channels');
		if ($query->num_rows() > 0) {
			$vars['zoo_visitor_channel_exists'] = TRUE;
			$field_group_id                     = $query->row()->field_group;
			$channel_id                         = $query->row()->channel_id;
		} else {
			$vars['zoo_visitor_channel_exists'] = FALSE;
			$field_group_id                     = 0;
			$channel_id                         = 0;
		}

		// ============================
		// = Check Visitor fieldgroup =
		// ============================
		if ($field_group_id != 0) {
			$vars['zoo_visitor_field_group_exists'] = TRUE;
		} else {
			$vars['zoo_visitor_field_group_exists'] = FALSE;
		}


		// ============
		// = Run sync =
		// ============
		$vars['submitted'] = FALSE;
		if (isset($_POST) && !empty($_POST) && $channel_id != 0 && $field_group_id != 0) {

			$this->sync_member_fields($channel_id, $field_group_id);
			$this->EE->zoo_visitor_lib->sync_member_data();
			$vars['submitted'] = TRUE;
		}


		$this->settings = get_zoo_settings($this->EE, TRUE);


		// ==========================
		// = standard member fields =
		// ==========================
		$vars['standard_member_fields']         = array('url', 'location', 'occupation', 'interests', 'aol_im', 'yahoo_im', 'msn_im', 'icq', 'bio', 'bday_y', 'bday_m', 'bday_d', 'signature', 'timezone'); //, 'avatar_filename', 'photo_filename');
		$vars['standard_member_fields_checked'] = array();
		$standard_member_fields                 = explode('|', $this->settings['sync_standard_member_fields']);
		foreach ($standard_member_fields as $field) {
			$parts                                    = explode(':', $field);
			$vars['standard_member_fields_checked'][] = $parts[0];
		}
		// ========================
		// = custom member fields =
		// ========================

		$custom_member_fields = array();

		$this->EE->load->model("member_model");
		$fields = $this->EE->member_model->get_custom_member_fields();

		foreach ($fields->result() as $field) {
			$this->EE->db->where('m_field_id', $field->m_field_id);
			$field_query = $this->EE->db->get('member_fields');
			$mfield      = $field_query->row();

			$custom_member_fields[$mfield->m_field_id] = $mfield->m_field_label;

		}

		$vars['custom_member_fields']         = $custom_member_fields;
		$vars['custom_member_fields_checked'] = array();
		$custom_member_fields                 = explode('|', $this->settings['sync_custom_member_fields']);
		foreach ($custom_member_fields as $field) {
			$parts                                  = explode(':', $field);
			$vars['custom_member_fields_checked'][] = $parts[0];
		}

		// Load view
		return $this->_content_wrapper('sync', 'sync_title', $vars);
	}

	function troubleshooting()
	{

		// Variables
		$vars             = array();
		$vars['settings'] = $this->settings;

		//Is safecracker installed?
		$this->EE->db->where('module_name', 'Safecracker');
		$query = $this->EE->db->get('modules');
		if ($query->num_rows() == 0) {
			$vars['safecracker_installed'] = lang('safecracker_installed_no');
		} else {
			$vars['safecracker_installed'] = lang('safecracker_installed_yes');
		}

		//Is Zoo visitor fieldtype installed?
		$this->EE->db->where('name', 'zoo_visitor');
		$query = $this->EE->db->get('fieldtypes');
		if ($query->num_rows() == 0) {
			$vars['fieldtype_installed'] = lang('fieldtype_installed_no');
		} else {
			$vars['fieldtype_installed'] = lang('fieldtype_installed_yes');
		}

		//Does Zoo Visitor channel exists 
		$this->EE->db->where('channel_id', $this->settings['member_channel_id']);
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('channels');
		if ($query->num_rows() > 0) {
			$vars['zoo_visitor_channel_exists'] = lang('zoo_visitor_channel_exists_yes');
			$field_group_id                     = $query->row()->field_group;
			$channel_id                         = $query->row()->channel_id;
		} else {
			$vars['zoo_visitor_channel_exists'] = lang('zoo_visitor_channel_exists_no');
			$field_group_id                     = 0;
			$channel_id                         = 0;
		}

		//Does Zoo Visitor channel exists 
		$this->EE->db->where('field_type', 'zoo_visitor');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->where('group_id', $field_group_id);
		$query = $this->EE->db->get('channel_fields');

		if ($query->num_rows() > 0) {
			$vars['zoo_visitor_fieldtype_in_channel'] = lang('zoo_visitor_fieldtype_in_channel_yes');
		} else {
			$vars['zoo_visitor_fieldtype_in_channel'] = lang('zoo_visitor_fieldtype_in_channel_no');
		}

		//Are Members linked with Zoo Visitor channel?
		if (isset($this->settings['member_channel_id']) && $this->settings['member_channel_id'] != '' && $this->settings['member_channel_id'] != '0') {
			$vars['zoo_visitor_linked_with_members'] = lang('zoo_visitor_linked_with_members_yes');
		} else {
			$vars['zoo_visitor_linked_with_members'] = lang('zoo_visitor_linked_with_members_no');
		}

		//new member registrations allowed?

		if ($this->EE->config->item('allow_member_registration') == 'n') {
			$vars['allow_member_registration'] = lang('allow_member_registration_no');
		}
		else {
			$vars['allow_member_registration'] = lang('allow_member_registration_yes');
		}

		//Are guest members allowed to post in Zoo Visitor channel?
		$this->EE->db->where('channel_id', $channel_id);
		$this->EE->db->where('group_id', '3');
		$query = $this->EE->db->get('channel_member_groups');
		if ($query->num_rows() == 0) {
			$vars['guest_member_posts_allowed'] = lang('guest_member_posts_allowed_no');
		}
		else {
			$vars['guest_member_posts_allowed'] = lang('guest_member_posts_allowed_yes');
		}

		//Zoo visitor guest created?
		if (isset($this->settings['anonymous_member_id']) && $this->settings['anonymous_member_id'] != '' && $this->settings['anonymous_member_id'] != '0') {
			//check if the selected member exists
			$query = $this->EE->db->where('member_id', $this->settings['anonymous_member_id'])->get('members');
			if ($query->num_rows == 0) {
				//member does not exist
				$vars['guest_member_created'] = lang('guest_member_created_no');
			} else {
				$vars['guest_member_created'] = lang('guest_member_created_yes');
			}
		} else {
			$vars['guest_member_created'] = lang('guest_member_created_no');
		}

		//Are Zoo Visitor examples installed?
		$this->EE->db->where('group_name', 'zoo_visitor_example');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('template_groups');
		if ($query->num_rows() > 0) {
			$vars['example_templategroup_exists'] = lang('example_templategroup_exists_yes');
		} else {
			$vars['example_templategroup_exists'] = lang('example_templategroup_exists_no');
		}

		// Load view
		return $this->_content_wrapper('troubleshooting', 'troubleshooting_title', $vars);
	}

	function installation()
	{

		// Variables
		$vars             = array();
		$vars['settings'] = $this->settings;

		$vars['errors'] = $this->EE->session->flashdata('errors');

		if (isset($_GET['action']) && $_GET['action'] == 'start') {
			$result = $this->install_visitor();
			foreach ($result as $res) {

			}
			$vars['errors'] = '';
		}
		//Is safecracker installed?
		$this->EE->db->where('module_name', 'Safecracker');
		$query = $this->EE->db->get('modules');
		if ($query->num_rows() == 0) {
			$vars['safecracker_installed'] = FALSE;
		} else {
			$vars['safecracker_installed'] = TRUE;
		}

		//Is Zoo visitor fieldtype installed?
		$this->EE->db->where('name', 'zoo_visitor');
		$query = $this->EE->db->get('fieldtypes');
		if ($query->num_rows() == 0) {
			$vars['fieldtype_installed'] = FALSE;
		} else {
			$vars['fieldtype_installed'] = TRUE;
		}

		//Does Zoo Visitor channel exists 
		$this->EE->db->where('channel_name', 'zoo_visitor');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('channels');
		if ($query->num_rows() > 0) {
			$vars['zoo_visitor_channel_exists'] = TRUE;
			$field_group_id                     = $query->row()->field_group;
			$channel_id                         = $query->row()->channel_id;
		} else {
			$vars['zoo_visitor_channel_exists'] = FALSE;
			$field_group_id                     = 0;
			$channel_id                         = 0;
		}

		//Does Zoo Visitor channel exists 
		$this->EE->db->where('field_type', 'zoo_visitor');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->where('group_id', $field_group_id);
		$query = $this->EE->db->get('channel_fields');

		if ($query->num_rows() > 0) {
			$vars['zoo_visitor_fieldtype_in_channel'] = TRUE;
		} else {
			$vars['zoo_visitor_fieldtype_in_channel'] = FALSE;
		}

		//Are Members linked with Zoo Visitor channel?
		if (isset($this->settings['member_channel_id']) && $this->settings['member_channel_id'] != '' && $this->settings['member_channel_id'] != '0') {
			$vars['zoo_visitor_linked_with_members'] = TRUE;
		} else {
			$vars['zoo_visitor_linked_with_members'] = FALSE;
		}

		//Are guest members allowed to post in Zoo Visitor channel?
		$this->EE->db->where('channel_id', $channel_id);
		$this->EE->db->where('group_id', '3');
		$query = $this->EE->db->get('channel_member_groups');
		if ($query->num_rows() == 0) {
			$vars['guest_member_posts_allowed'] = FALSE;
		}
		else {
			$vars['guest_member_posts_allowed'] = TRUE;
		}

		//Zoo visitor guest created?
		if (isset($this->settings['anonymous_member_id']) && $this->settings['anonymous_member_id'] != '' && $this->settings['anonymous_member_id'] != '0') {
			$query = $this->EE->db->where('member_id', $this->settings['anonymous_member_id'])->get('members');
			if ($query->num_rows() == 0) {
				$vars['guest_member_create'] = FALSE;
			} else {
				$vars['guest_member_create'] = TRUE;
			}
		} else {
			$vars['guest_member_create'] = FALSE;

			//member exists but is not linked

		}

		//Are Zoo Visitor examples installed?
		$this->EE->db->where('group_name', 'zoo_visitor_example');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('template_groups');
		if ($query->num_rows() > 0) {
			$vars['example_templategroup_exists'] = TRUE;
		} else {
			$vars['example_templategroup_exists'] = FALSE;
		}

		if ($vars['guest_member_create'] && $vars['zoo_visitor_channel_exists'] && $vars['fieldtype_installed'] && $vars['zoo_visitor_fieldtype_in_channel'] && $vars['zoo_visitor_linked_with_members']) {
			$vars['zoo_visitor_installed'] = TRUE;
		} else {
			$vars['zoo_visitor_installed'] = FALSE;
		}
		// redirect to view
		return $this->_content_wrapper('installation', 'installation_title', $vars);
	}

	/**
	 * Zoo visitor Settings Form
	 */
	function settings_form()
	{

		//replace screen_name_override with field names
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->order_by('field_id', 'desc');

		$query = $this->EE->db->get('channel_fields');
		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				$this->settings['screen_name_override'] = str_replace('field_id_' . $row['field_id'], '{' . $row['field_name'] . '}', $this->settings['screen_name_override']);

				$this->settings['title_override'] = str_replace('field_id_' . $row['field_id'], '{' . $row['field_name'] . '}', $this->settings['title_override']);
			}
		}


		$vars['settings'] = $this->settings;
		$this->EE->load->model('channel_model');
		$channels_query = $this->EE->channel_model->get_channels();
		$channels       = array();
		$channels[0]    = '---';
		foreach ($channels_query->result_array() as $channel) {
			$channels[$channel['channel_id']] = $channel['channel_name'];
		}
		$vars['channels'] = $channels;

		//get guest members
		$this->EE->load->model('member_model');
		$member_query = $this->EE->member_model->get_members(3);
		$members      = array();
		$members[0]   = '---';
		if ($member_query) {
			if ($member_query->num_rows() > 0) {
				foreach ($member_query->result_array() as $member) {
					$members[$member['member_id']] = $member['email'];
				}
			}
		}
		$vars['members'] = $members;

		$vars['screen_name_field_errors'] = $this->EE->session->flashdata('settings_screen_name_field_errors');
		$vars['title_field_errors']       = $this->EE->session->flashdata('settings_title_field_errors');
		// Load view
		return $this->_content_wrapper('visitor_settings', $this->module_name . " Settings", $vars);


	}

	/**
	 * Save Invoice Module Settings
	 */

	function settings_save()
	{

		$settings = array();

		unset($_POST["submit"]);
		$errors = "";
		foreach ($_POST as $key => $val) {

			if ($key == "screen_name_override") {

				$pattern = "/{(.*?)}/";
				preg_match_all($pattern, $val, $matches);

				$override_fields      = (isset($matches[1])) ? $matches[1] : array();
				$screen_name_override = '';
				$field_errors         = '';
				if (count($override_fields) > 0 && $val != '') {
					foreach ($override_fields as $field) {
						$this->EE->db->where('field_name', $field);
						//$this->EE->db->where('site_id',$this->EE->config->item('site_id'));
						$query = $this->EE->db->get('channel_fields');
						if ($query->num_rows() == 0) {
							$field_errors .= "Field " . $field . " does not exist.<br/>";
						} else {

							$val = str_replace('{' . $field . '}', 'field_id_' . $query->row()->field_id, $val);

						}
					}

				}

				if ($field_errors != '') {

					$this->EE->session->set_flashdata('settings_screen_name_field_errors', 'Notice: ' . $field_errors);

				}
				$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => $val), "var = '" . $key . "' AND site_id = '" . $this->EE->config->item('site_id') . "'");

			}
			elseif ($key == "title_override") {

				$pattern = "/{(.*?)}/";
				preg_match_all($pattern, $val, $matches);

				$title_override_fields = (isset($matches[1])) ? $matches[1] : array();
				$title_override        = $val;
				$title_field_errors    = '';
				if (count($title_override_fields) > 0 && $title_override != '') {
					foreach ($title_override_fields as $field) {
						$this->EE->db->where('field_name', $field);
						//$this->EE->db->where('site_id',$this->EE->config->item('site_id'));
						$query = $this->EE->db->get('channel_fields');
						if ($query->num_rows() == 0) {
							$title_field_errors .= "Field " . $field . " does not exist.<br/>";
						} else {

							$title_override = str_replace('{' . $field . '}', 'field_id_' . $query->row()->field_id, $title_override);
						}

					}

				}

				// if($title_field_errors != ''){
				// 
				// 					$this->EE->session->set_flashdata('settings_title_field_errors', 'Notice: '.$title_field_errors);
				// 
				// 				}
				$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => $title_override), "var = '" . $key . "' AND site_id = '" . $this->EE->config->item('site_id') . "'");

				//check if it is not empty or hasn't changed
				if ($title_override != '' && $this->settings['title_override'] != $title_override) {

					$this->settings = get_zoo_settings($this->EE, TRUE);

					$this->EE->db->select('entry_id');
					$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
					$this->EE->db->where('channel_id', $this->settings['member_channel_id']);
					$this->EE->db->order_by('entry_id', 'asc');

					$query = $this->EE->db->get('channel_titles');

					if ($query->num_rows()) {
						foreach ($query->result() as $row) {
							$this->EE->zoo_visitor_lib->update_entry_title($row->entry_id);
						}
					}
				}

			}
			else {
				$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => $val), "var = '" . $key . "' AND site_id = '" . $this->EE->config->item('site_id') . "'");

			}

		}

		$this->EE->session->set_flashdata('settings_message', 'success');

		$this->EE->functions->redirect(BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=' . $this->class_name . AMP . 'method=settings_form');

	}


	function install_visitor()
	{
		$this->EE->load->dbforge();

		if (version_compare(APP_VER, '2.4.0', '<')) {
		}
		else {
			$this->EE->load->helper('security');
		}

		$errors  = array();
		$success = array();

		// =======================================
		// = Is Zoo Visitor fieldtype installed? =
		// =======================================
		$this->EE->db->where('name', 'zoo_visitor');
		$query = $this->EE->db->get('fieldtypes');
		if ($query->num_rows() > 0) {
			$zoo_visitor_fieldtype_id = $query->row()->fieldtype_id;
		} else {
			$errors[] = 'fieldtype_not_installed';

			$this->EE->session->set_flashdata('errors', 'fieldtype_not_installed');
			$this->EE->functions->redirect(BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor' . AMP . 'method=installation');
		}


		// ======================
		// =Create fieldgroup =
		// ======================
		$this->EE->db->where('group_name', 'Zoo Visitor Fields');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('field_groups');
		if ($query->num_rows() > 0) {
			//channel exists, get id
			$field_group_id = $query->row()->group_id;
			$errors[]       = 'field_group_exists';
		}
		else {
			//generate field group
			$field_group_data               = array();
			$field_group_data['site_id']    = $this->EE->config->item('site_id');
			$field_group_data['group_name'] = 'Zoo Visitor Fields';
			$this->EE->db->insert('field_groups', $field_group_data);
			$field_group_id = $this->EE->db->insert_id();
			$success[]      = 'field_group_generated';
		}

		/// ==================
		// = Create channel =
		// ==================
		$this->EE->db->where('channel_name', 'zoo_visitor');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('channels');
		if ($query->num_rows() > 0) {
			//channel exists, get id
			$channel_id = $query->row()->channel_id;
			$errors[]   = 'member_channel_exists';
		}
		else {
			//generate channel
			$data['site_id']       = $this->EE->config->item('site_id');
			$data['channel_name']  = 'zoo_visitor';
			$data['channel_title'] = 'Zoo Visitor Members';
			$data['channel_url']   = '';
			$data['channel_lang']  = $this->EE->config->item('xml_lang');
			$data['field_group']   = $field_group_id;
			$data['status_group']  = 1;
			$this->EE->db->insert('channels', $data);
			$channel_id = $this->EE->db->insert_id();
			$success[]  = 'channel_generated';
		}


		$this->EE->db->update('channels', array("field_group" => $field_group_id), "site_id = '" . $this->EE->config->item('site_id') . "' AND channel_id = '" . $channel_id . "'");

		$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => $channel_id), "var = 'member_channel_id'");

		// =============================================================
		// = Allow guests to post in this channel, member registration =
		// =============================================================
		$this->EE->db->where('channel_id', $channel_id);
		$this->EE->db->where('group_id', '3');
		$query = $this->EE->db->get('channel_member_groups');
		if ($query->num_rows() == 0) {
			$this->EE->db->insert('channel_member_groups', array('group_id'  => '3',
			                                                     'channel_id'=> $channel_id));
		}

		// ======================
		// = Create statusgroup =
		// ======================
		$this->EE->db->where('group_name', 'Zoo Visitor Membergroup');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('status_groups');
		if ($query->num_rows() > 0) {
			$status_group_id = $query->row()->group_id;
		} else {
			$status_group_data               = array();
			$status_group_data['site_id']    = $this->EE->config->item('site_id');
			$status_group_data['group_name'] = 'Zoo Visitor Membergroup';
			$this->EE->db->insert('status_groups', $status_group_data);
			$status_group_id = $this->EE->db->insert_id();

			$group_query = $this->EE->member_model->get_member_groups();

			foreach ($group_query->result() as $row) {
				$status_data                 = array();
				$status_data['status']       = format_status($row->group_title, $row->group_id);
				$status_data['site_id']      = $this->EE->config->item('site_id');
				$status_data['group_id']     = $status_group_id;
				$status_data['status_order'] = '';
				$status_data['highlight'] = '';

				$this->EE->db->insert('statuses', $status_data);
			}
		}

		$this->EE->db->update('channels', array("status_group" => $status_group_id), "site_id = '" . $this->EE->config->item('site_id') . "' AND channel_id = '" . $channel_id . "'");

		// ===============================
		// = Assign fields to fieldgroup =
		// ===============================
		$def_settings = 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=';
		$fields       = array();
		$fields[]     = array('Member account', 'member_account', 'zoo_visitor', '');
		$fields[]     = array('Firstname', 'member_firstname', 'text', '');
		$fields[]     = array('Lastname', 'member_lastname', 'text', '');
		$fields[]     = array('Gender', 'member_gender', 'radio', 'Male
		Female');
		$fields[]     = array('Birthday', 'member_birthday', 'date', '');

		$field_order = 1;
		foreach ($fields as $field) {
			$field_data                     = array();
			$field_data['site_id']          = $this->EE->config->item('site_id');
			$field_data['group_id']         = $field_group_id;
			$field_data['field_name']       = $field[1];
			$field_data['field_label']      = $field[0];
			$field_data['field_type']       = $field[2];
			$field_data['field_list_items'] = $field[3];
			if (version_compare(APP_VER, '2.6.0', '<')) {
				$field_data['field_related_to'] = 'channel';
				$field_data['field_related_id'] = $channel_id;
			}
			$field_data['field_show_fmt']     = 'n';
			$field_data['field_settings']     = $def_settings;
			$field_data['field_order']        = $field_order;
			$field_data['field_content_type'] = 'any';


			$this->EE->db->where('field_name', $field[1]);
			$this->EE->db->where('site_id', $this->EE->config->item('site_id'));

			$query = $this->EE->db->get('channel_fields');

			if ($query->num_rows() == 0) {

				$this->EE->db->insert('channel_fields', $field_data);
				$field_id = $this->EE->db->insert_id();

				if ($field[2] == 'date') {
					$this->EE->dbforge->add_column('channel_data', array('field_id_' . $field_id => array('type' => 'int(10)')));
				} else {
					$this->EE->dbforge->add_column('channel_data', array('field_id_' . $field_id => array('type' => 'text',
					                                                                                      'null' => FALSE)));
				}
				$this->EE->dbforge->add_column('channel_data', array('field_ft_' . $field_id => array('type' => 'tinytext')));
				if ($field[2] == 'date') {
					$this->EE->dbforge->add_column('channel_data', array('field_dt_' . $field_id => array('type' => 'varchar(8)')));
				}
				foreach (array('none', 'br', 'xhtml') as $field_fmt) {
					$this->EE->db->insert('field_formatting', array('field_id'  => $field_id,
					                                                'field_fmt' => $field_fmt));
				}

				$field_order++;
			}
		}

		$override_val = 'member_firstname member_lastname';

		$this->EE->db->where('field_name', 'member_firstname');
		$this->EE->db->or_where('field_name', 'member_lastname');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('channel_fields');
		if ($query->num_rows() > 0) {

			foreach ($query->result_array() as $row) {

				$override_val = str_replace($row['field_name'], 'field_id_' . $row['field_id'], $override_val);
			}

			$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => $override_val), "var = 'screen_name_override' AND site_id = '" . $this->EE->config->item('site_id') . "'");

		}


		// =======================
		// = Create template group  =
		// =======================
		$template_group_name = 'zoo_visitor_example';
		$this->EE->db->where('group_name', $template_group_name);
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$query = $this->EE->db->get('template_groups');
		if ($query->num_rows() > 0) {
			//template group exists, get id
			$template_group_id = $query->row()->group_id;
			$errors[]          = 'template_group_exists';
		} else {
			//generate channel
			$template_group_data               = array();
			$template_group_data['site_id']    = $this->EE->config->item('site_id');
			$template_group_data['group_name'] = $template_group_name;
			$template_group_data['group_order'] = 0;
			$template_group_data['is_site_default'] = 'n';
			$this->EE->db->insert('template_groups', $template_group_data);
			$template_group_id = $this->EE->db->insert_id();
			$success[]         = 'template_group_generated';
		}
		// =================================
		// = create anonymous guest member =
		// =================================

		$this->EE->db->where('username', 'zoo_visitor_guest');
		$query = $this->EE->db->get('members');
		if ($query->num_rows() == 0) {
			$data                = array();
			$data['group_id']    = 3; // Guests
			$data['username']    = 'zoo_visitor_guest';
			$data['password']    = (version_compare(APP_VER, '2.6.0', '<')) ? $this->EE->functions->hash('zoo_visitor_login') : md5('zoo_visitor_login');
			$data['ip_address']  = $this->EE->input->ip_address();
			$data['unique_id']   = $this->EE->functions->random('encrypt');
			$data['join_date']   = $this->EE->localize->now;
			$data['email']       = 'zoo_visitor@yourdomain.tld';
			$data['screen_name'] = 'zoo_visitor_guest';
			$data['language']    = ($this->EE->config->item('deft_lang')) ? $this->EE->config->item('deft_lang') : 'english';
			//$data['time_format'] = ($this->EE->config->item('time_format')) ? $this->EE->config->item('time_format') : 'us';
			//$data['timezone']	= ($this->EE->config->item('default_site_timezone') && $this->EE->config->item('default_site_timezone') != '') ? $this->EE->config->item('default_site_timezone') : $this->EE->config->item('server_timezone');

			//$data['daylight_savings'] = 'n';
			$this->EE->db->query($this->EE->db->insert_string('exp_members', $data));
			$anonymous_member_id = $this->EE->db->insert_id();
		} else {
			$anonymous_member_id = $query->row()->member_id;
		}

		$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => $anonymous_member_id), "var = 'anonymous_member_id'");

		// ====================
		// = Create templates =
		// ====================
		$templates                      = array('index', 'menu', 'register', 'profile', 'login', 'login_ajax', 'change_password', 'change_login', 'forgot_password', 'reset_password');
		$template_data['site_id']       = $this->EE->config->item('site_id');
		$template_data['group_id']      = $template_group_id;
		$template_data['template_type'] = 'webpage';
		$template_data['edit_date']     = $this->EE->localize->now;

		require_once PATH_THIRD . 'zoo_visitor/helpers/zoo_visitor_helper.php';
		$this->EE->load->helper('file');

		foreach ($templates as $template) {

			$this->EE->db->where('template_name', $template);
			$this->EE->db->where('group_id', $template_group_id);
			$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
			$query = $this->EE->db->get('templates');
			if ($query->num_rows() == 0) {
				$template_content               = read_file(PATH_THIRD . 'zoo_visitor/views/templates/' . $template . '.html');
				$template_data['template_name'] = $template;
				$template_data['template_data'] = $template_content;
				$this->EE->db->insert('templates', $template_data);
			}
		}

		$this->EE->session->set_flashdata('installation', 'ran');
		$this->EE->functions->redirect(BASE . AMP . 'C=addons_modules' . AMP . 'M=show_module_cp' . AMP . 'module=zoo_visitor' . AMP . 'method=installation');

		//return array($errors, $success);
	}

	function sync_member_fields($channel_id, $field_group_id)
	{

		// ========================
		// = Custom member fields =
		// ========================
		$custom_member_fields = (isset($_POST['custom_member_fields'])) ? $_POST['custom_member_fields'] : array();

		$sync_custom_member_fields = '';

		if (!empty($custom_member_fields)) {
			$this->EE->load->model("member_model");
			$fields = $this->EE->member_model->get_custom_member_fields();

			foreach ($custom_member_fields as $field_id) {
				$this->EE->db->where('m_field_id', $field_id);
				$field_query = $this->EE->db->get('member_fields');
				$mfield      = $field_query->row();

				$channel_field_id = $this->create_field($channel_id, $field_group_id, $mfield);
				$sync_custom_member_fields .= $field_id . ":" . $channel_field_id . '|';
			}
		}

		$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => rtrim($sync_custom_member_fields, '|')), "var = 'sync_custom_member_fields' AND site_id = '" . $this->EE->config->item('site_id') . "'");

		// ==========================
		// = Standard member fields =
		// ==========================

		$standard_member_fields = (isset($_POST['standard_member_fields'])) ? $_POST['standard_member_fields'] : array();

		$sync_standard_member_fields = '';

		if (!empty($standard_member_fields)) {
			$this->EE->lang->loadfile('myaccount');

			foreach ($standard_member_fields as $field_name) {

				$mfield->m_field_name        = $field_name;
				$mfield->m_field_label       = lang($field_name);
				$mfield->m_field_description = '';
				$mfield->m_field_ta_rows     = '6';
				$mfield->m_field_required    = 'n';
				$mfield->m_field_search      = 'n';
				$mfield->m_field_fmt         = 'none';

				if ($field_name == 'bday_y' || $field_name == 'bday_m' || $field_name == 'bday_d') {
					$list_items = '';

					$mfield->m_field_type = 'select';
					$mfield->m_field_maxl = '4';

					if ($field_name == 'bday_y') {
						for ($i = date('Y', $this->EE->localize->now); $i >= 1904; $i--) {
							$list_items .= $i;
							if ($i > 1904) {
								$list_items .= chr(10);
							}
						}
					}

					if ($field_name == 'bday_m') {

						for ($i = 1; $i <= 12; $i++) {
							$month = ($i < 10) ? "0" . $i : $i;
							$list_items .= $month;
							if ($i < 12) {
								$list_items .= chr(10);
							}
						}

					}

					if ($field_name == 'bday_d') {
						for ($i = 1; $i <= 31; $i++) {
							$list_items .= $i;
							if ($i < 31) {
								$list_items .= chr(10);
							}
						}
					}

					$mfield->m_field_list_items = $list_items;

				}
				elseif ($field_name == 'bio' || $field_name == 'signature') {
					$mfield->m_field_type       = 'text';
					$mfield->m_field_list_items = '';
				}
				elseif ($field_name == 'avatar_filename') {
					$mfield->m_field_type       = 'file';
					$mfield->m_field_list_items = '';
				}
				else {
					$mfield->m_field_type       = 'text';
					$mfield->m_field_list_items = '';
				}


				$channel_field_id = $this->create_field($channel_id, $field_group_id, $mfield);
				$this->sync_field_data_to_existing_members($channel_field_id, $field_name, "standard");
				$sync_standard_member_fields .= $field_name . ":" . $channel_field_id . '|';
			}
		}

		$this->EE->db->update(strtolower($this->class_name) . '_settings', array("var_value" => rtrim($sync_standard_member_fields, '|')), "var = 'sync_standard_member_fields' AND site_id = '" . $this->EE->config->item('site_id') . "'");


	}

	function sync_field_data_to_existing_members($channel_field_id, $member_field, $member_field_type)
	{
		if ($member_field_type == "standard") {

		}
	}

	function create_field($channel_id, $group_id, $mfield)
	{

		$this->EE->lang->loadfile('admin_content');
		$this->EE->load->library('api');
		$this->EE->api->instantiate('channel_fields');

		// If the $field_id variable has data we are editing an
		// existing group, otherwise we are creating a new one

		$edit = FALSE;

		// Check for required fields

		$error = array();
		$this->EE->load->model('field_model');

		// Is the field name taken?
		$this->EE->db->select('*');
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->where('field_name', 'mbr_' . $mfield->m_field_name);

		$query = $this->EE->db->get('channel_fields');

		if ($query->num_rows() > 0) {
			return $query->row('field_id');
		}

		$field_type = $mfield->m_field_type;

		// Are there errors to display?

		if (count($error) > 0) {
			$str = '';

			foreach ($error as $msg) {
				$str .= $msg . BR;
			}

			return array("errors" => $str);
		}

		$native = array(
			'field_id', 'site_id', 'group_id',
			'field_name', 'field_label', 'field_instructions',
			'field_type', 'field_list_items', 'field_pre_populate',
			'field_pre_channel_id', 'field_pre_field_id',
			'field_ta_rows', 'field_maxl', 'field_required',
			'field_text_direction', 'field_search', 'field_is_hidden', 'field_fmt', 'field_show_fmt',
			'field_order'
		);

		if (version_compare(APP_VER, '2.6.0', '<')) {
			$native = array_merge($native, array('field_related_id', 'field_related_orderby', 'field_related_sort', 'field_related_max'));
		}

		$_posted       = array();
		$_field_posted = preg_grep('/^' . $field_type . '_.*/', array_keys($_POST));
		$_keys         = array_merge($native, $_field_posted);

		foreach ($_keys as $key) {
			if (isset($_POST[$key])) {
				$_posted[$key] = $this->input->post($key);
			}
		}

		// Get the field type settings
		$this->EE->api_channel_fields->fetch_all_fieldtypes();
		$this->EE->api_channel_fields->setup_handler($field_type);
		$ft_settings = $this->EE->api_channel_fields->apply('save_settings', array($_posted));

		// Default display options
		foreach (array('smileys', 'glossary', 'spellcheck', 'formatting_btns', 'file_selector', 'writemode') as $key) {
			$ft_settings['field_show_' . $key] = 'n';
		}

		$native_settings['field_id']             = '';
		$native_settings['site_id']              = $this->EE->config->item('site_id');
		$native_settings['group_id']             = $group_id;
		$native_settings['field_name']           = "mbr_" . $mfield->m_field_name;
		$native_settings['field_label']          = $mfield->m_field_label;
		$native_settings['field_instructions']   = $mfield->m_field_description;
		$native_settings['field_type']           = $mfield->m_field_type;
		$native_settings['field_content_type']   = $mfield->m_field_type;
		$native_settings['field_list_items']     = $mfield->m_field_list_items;
		$native_settings['field_pre_populate']   = 'n';
		$native_settings['field_pre_channel_id'] = '';
		$native_settings['field_pre_field_id']   = '';
		if (version_compare(APP_VER, '2.6.0', '<')) {
			$native_settings['field_related_id']      = '';
			$native_settings['field_related_orderby'] = '';
			$native_settings['field_related_sort']    = '';
			$native_settings['field_related_max']     = '';
		}
		$native_settings['field_ta_rows'] = $mfield->m_field_ta_rows;
		if (isset($mfield->m_field_maxl)) {
			$native_settings['field_maxl'] = $mfield->m_field_maxl;
		}
		$native_settings['field_required']       = $mfield->m_field_required;
		$native_settings['field_text_direction'] = 'ltr';
		$native_settings['field_search']         = $mfield->m_field_search;
		$native_settings['field_is_hidden']      = 'n';
		$native_settings['field_fmt']            = $mfield->m_field_fmt;
		$native_settings['field_show_fmt']       = 'n';
		$native_settings['field_order']          = '';

		if ($native_settings['field_list_items'] != '') {
			// This results in double encoding later on
			$this->EE->load->helper('string');
			$native_settings['field_list_items'] = quotes_to_entities($native_settings['field_list_items']);
		}
		// 
		// if ($native_settings['field_pre_populate'] == 'y')
		// {
		// 	$x = explode('_', $this->_get_ft_post_data($field_type, 'field_pre_populate_id'));
		// 
		// 	$native_settings['field_pre_channel_id']	= $x['0'];
		// 	$native_settings['field_pre_field_id'] = $x['1'];
		// }

		// If they returned a native field value as part of their settings instead of changing the post array,
		// we'll merge those changes into our native settings

		foreach ($ft_settings as $key => $val) {
			if (in_array($key, $native)) {
				if ($val != '') {
					unset($ft_settings[$key]);
					$native_settings[$key] = $val;
				}
			}
		}

		$native_settings['field_settings'] = base64_encode(serialize($ft_settings));
		// 

		$cp_message = lang('custom_field_created');

		$query = $this->EE->db->select('COUNT(*) as COUNT')
			->where('group_id', (int)$group_id)
			->get('channel_fields');

		$native_settings['field_order'] = $query->row('COUNT') + 1;

		if (!$native_settings['field_ta_rows']) {
			$native_settings['field_ta_rows'] = 0;
		}

		// as its new, there will be no field id, unset it to prevent an empty string from attempting to pass
		unset($native_settings['field_id']);

		$this->EE->db->insert('channel_fields', $native_settings);

		$insert_id                   = $this->EE->db->insert_id();
		$native_settings['field_id'] = $insert_id;

		$this->EE->api_channel_fields->add_datatype(
			$insert_id,
			$native_settings
		);

		$this->EE->db->update('channel_data', array('field_ft_' . $insert_id => $native_settings['field_fmt']));

		foreach (array('none', 'br', 'xhtml') as $val) {
			$f_data = array('field_id'  => $insert_id,
			                'field_fmt' => $val);
			$this->EE->db->insert('field_formatting', $f_data);
		}

		$collapse = ($native_settings['field_is_hidden'] == 'y') ? TRUE : FALSE;
		$buttons  = ($ft_settings['field_show_formatting_btns'] == 'y') ? TRUE : FALSE;

		$field_info['publish'][$insert_id] = array(
			'visible'          => 'true',
			'collapse'         => $collapse,
			'htmlbuttons'      => $buttons,
			'width'            => '100%'
		);

		// Add to any custom layouts
		$query = $this->EE->field_model->get_assigned_channels($group_id);

		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				$channel_ids[] = $row->channel_id;
			}

			$this->EE->load->library('layout');
			$this->EE->layout->add_layout_fields($field_info, $channel_ids);
		}


		$_final_settings = array_merge($native_settings, $ft_settings);
		unset($_final_settings['field_settings']);

		$this->EE->api_channel_fields->set_settings($native_settings['field_id'], $_final_settings);
		$this->EE->api_channel_fields->setup_handler($native_settings['field_id']);
		$this->EE->api_channel_fields->apply('post_save_settings', array($_posted));

		$this->EE->functions->clear_caching('all', '', TRUE);

		return $insert_id;

		$strlen = strlen($native_settings['field_name']);

		if ($strlen > 32) {
			$this->EE->session->set_flashdata('message_failure', lang('field_name_too_lrg'));
		}
		else {
			$this->EE->session->set_flashdata('message_success', $cp_message);
		}

		//$this->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=field_management'.AMP.'group_id='.$group_id);

	}


	// --------------------------------------------------------------------

	private function _content_wrapper($content_view, $lang_key, $vars = array())
	{
		$vars['content_view'] = $content_view;
		$vars['base']         = $this->base;
		$vars['form_base']    = $this->form_base;

		if (version_compare(APP_VER, '2.6.0', '<')) {
			$this->EE->cp->set_variable('cp_page_title', lang($lang_key));
		}else{
			$this->EE->view->cp_page_title = lang($lang_key);
		}

		$this->EE->cp->set_breadcrumb($this->base, lang('zoo_visitor_module_name'));

		$this->EE->load->library('table');

		return $this->EE->load->view($vars['content_view'], $vars, TRUE);
	}
}