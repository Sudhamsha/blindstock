<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Safecracker Registration
 * 
 * @package		Safecracker Registration
 * @author		Justin Kimbrell
 * @copyright	Copyright (c) 2012, Objective HTML
 * @link 		http://www.objectivehtml.com/safecracker-registration
 * @version		1.2.0
 * @build		20120727
 */

require_once 'config/safecracker_registration_config.php';

class Safecracker_registration_ext {

    public $name       		= 'Safecracker Registration';
    public $version        	= SAFECRACKER_REGISTRATION_VERSION;
    public $description    	= '';
    public $settings_exist 	= 'n';
  	public $docs_url       	= 'http://www.objectivehtml.com/safecracker-registration';
	public $settings 		= array();
	public $required_by 	= array('module');
	public $required_fields	= array('email', 'username', 'password', 'password_confirm');
	public $optional_fields = array('screen_name', 'location', 'url');
	
	public function __construct()
	{
        $this->settings = array();
        
		$this->EE =& get_instance();
		
		$this->EE->load->driver('channel_data');			
		$this->EE->config->load('safecracker_registration_config');		
	}
	
	public function channel_entries_row($obj, $row)
	{
		if($prefix = $obj->EE->TMPL->fetch_param('member_prefix'))
		{
			$row = array_merge($row, $this->EE->channel_data->utility->add_prefix($prefix, $row));
		}
		
		return $row;
	}
	
	public function channel_entries_tagdata_end($tagdata, $row, $obj)
	{
		if($prefix = $obj->EE->TMPL->fetch_param('member_prefix'))
		{
			$tagdata = $this->EE->safecracker_registration_lib->parse_fields($row, $tagdata, TRUE, $prefix.':');
		}
		
		return $tagdata;
	}
	
	
	public function safecracker_submit_entry_start($obj)
	{
		$obj =& $obj;
		
		$this->EE->load->library('safecracker_registration_lib');
		
		if( (int) $this->EE->input->post('safecracker_registration_register_member') ||
			(int) $this->EE->input->post('safecracker_registration_edit_member'))
		{		
			// -------------------------------------------
			// 'safecracker_register_submit_entry_start' hook.
			//  - Additional processing when a member attempts to register
			//  - added in v1.2
			//
			
				$edata = $this->EE->extensions->call('safecracker_register_submit_entry_start', $obj);
				if ($this->EE->extensions->end_script === TRUE) return;
			//
			// -------------------------------------------
			
			if( (int) $this->EE->input->post('safecracker_registration_edit_member') == 1)
			{
				$this->EE->safecracker_registration_lib->edit_member($obj);
			}
			
			if( (int) $this->EE->input->post('safecracker_registration_register_member') == 1)
			{
				$this->EE->safecracker_registration_lib->register_member($obj);
			}
			
			$this->EE->safecracker_registration_lib->set_permissions($obj);
		}	
		
	}
	
	public function safecracker_submit_entry_end($obj)
	{
		$obj =& $obj;
		
		if( (int) $this->EE->input->post('safecracker_registration_register_member') ||
			(int) $this->EE->input->post('safecracker_registration_edit_member'))
		{
			$this->EE->safecracker_registration_lib->get_permissions($obj);		
			
			if(count($obj->field_errors) == 0 && count($obj->errors) == 0)
			{
				// -------------------------------------------
				// 'safecracker_register_submit_entry_end' hook.
				//  - Additional processing after a member successfully registers
				//  - added in v1.2
				//
				
					$edata = $this->EE->extensions->call('safecracker_register_submit_entry_end', $obj);
					if ($this->EE->extensions->end_script === TRUE) return;
				//
				// -------------------------------------------
								
				$_POST['return'] = str_replace('MEMBER_ID', $obj->entry['author_id'], $_POST['return']);
			}
		}
	}

	public function safecracker_entry_form_tagdata_start($tagdata, $obj)
	{	
		$obj =& $obj;
		
		$register_member = $obj->EE->TMPL->fetch_param('register_member');
		$register_member = $this->param($register_member, FALSE, TRUE);
				
		$edit_member = $obj->EE->TMPL->fetch_param('edit_member');
		$edit_member = $this->param($edit_member, FALSE, TRUE);
		
		if($register_member === TRUE || $edit_member === TRUE)
		{		
			$this->EE->load->library('safecracker_registration_lib');
			
			// -------------------------------------------
			// 'safecracker_register_entry_form_tagdata_start' hook.
			//  - Additional processing before the tagdata is manipulated
			//  - added in v1.2
			//
			
				$edata = $this->EE->extensions->call('safecracker_register_entry_form_tagdata_start', $tagdata, $obj);
				if ($this->EE->extensions->end_script === TRUE) return;
			//
			// -------------------------------------------
						
			// Do we allow new member registrations?
			if ($this->EE->config->item('allow_member_registration') == 'n')
			{
				$this->EE->output->show_user_error('general', 'Member registrations are not allowed at this time');
			}
	
			// Is user banned?
			if ($this->EE->session->userdata('is_banned') === TRUE)
			{
				$this->EE->output->show_user_error('general', 'Member registrations are not allowed at this time');
			}
	
			// Blacklist/Whitelist Check
			if ($this->EE->blacklist->blacklisted == 'y' && 
				$this->EE->blacklist->whitelisted == 'n')
			{
				$this->EE->output->show_user_error('general', 'Member registrations are not allowed at this time');
			}
			
			$group_id = $obj->EE->TMPL->fetch_param('group_id');
			$group_id = $this->param($group_id, FALSE);
			
			if($group_id)
			{
				$member_groups = $this->EE->channel_data->get_member_groups();
				
				$valid_group = FALSE;
				
				foreach($member_groups->result_array() as $group)
				{
					if( (int) $group_id == (int) $group['group_id'])
					{
						$valid_group = TRUE;
					}
				}
				
				if( ! $valid_group)
				{
					$this->EE->output->show_user_error('general', 'Group \''.$group_id.'\' is not a valid member group.');			
				}
				
				$obj->form_hidden(array(
					'safecracker_registration_group_id' => $this->EE->safecracker_registration_lib->encode($group_id)
				));
			}
						
			$valid_groups = $obj->EE->TMPL->fetch_param('valid_groups');
			$valid_groups = $this->param($valid_groups, FALSE);
			
			if(!$valid_groups)
			{
				$valid_groups = $group_id;
			}

			$obj->form_hidden(array(
				'safecracker_registration_valid_groups' => $this->EE->safecracker_registration_lib->encode($valid_groups)
			));

			if($register_member)
			{
				$obj->form_hidden(array(
					'safecracker_registration_register_member' => TRUE
				));
			}
			
			$dynamic_screen_name = $obj->EE->TMPL->fetch_param('dynamic_screen_name');
			$dynamic_screen_name = $this->param($dynamic_screen_name, FALSE);
			
			if($dynamic_screen_name)
			{
				$obj->form_hidden(array(
					'safecracker_registration_dynamic_screen_name' => $dynamic_screen_name
				));
			}
			
			$login_member	 = $obj->EE->TMPL->fetch_param('login_member');
			$login_member	 = $login_member ? $login_member: $obj->EE->TMPL->fetch_param('loggin_member');
						
			$login_member	 = $this->param($login_member, TRUE, TRUE);
			
			$obj->form_hidden(array(
				'safecracker_registration_login_member' => $login_member ? 'y' : 'n'
			));
		
			$member_id	 = $obj->EE->TMPL->fetch_param('member_id', 'CURRENT_USER');
			$member_id	 = str_replace('CURRENT_USER', $this->EE->session->userdata('member_id'), $this->param($member_id, 0));			
			
			if($edit_member)
			{
				$obj->form_hidden(array(
					'safecracker_registration_edit_member' => TRUE,
					'safecracker_registration_member_id'   => $member_id,
					'author_id' => $member_id
				));
								
				$member = $this->EE->channel_data->get_member($member_id);
				
				foreach($member->result() as $member)
				{
					foreach($member as $field => $value)
					{
						if($field != "password")
						{
							$_POST[$field] = $value;
						}
					}
				}
				
				$channel_id = $obj->channel['channel_id'];
								
				$entries	= $this->EE->channel_data->get_channel_entries($channel_id, array(
					'where' => array(
						'author_id' => $member_id
					),
					'order_by' => 'channel_titles.entry_id',
					'sort'     => 'asc'
				))->result_array();
				
				
				if(isset($entries[0]))
				{
					$categories    = array();
					$category_data = $this->EE->channel_data->get_category_posts(array(
						'select' => 'cat_id',
						'where' => array(
							'entry_id' => $entries[0]['entry_id']
						)
					));
					
					foreach($category_data->result() as $row)
					{
						$categories[] = $row->cat_id;
					}
					
					$obj->entry = $entries[0];
					$obj->entry['categories'] = $categories;
				}
			}
			
			$vars = array();
				
			foreach(array_merge($this->required_fields, $this->optional_fields) as $field)
			{
				$vars[0][$field] = $this->EE->input->post($field) ? $this->EE->input->post($field) : NULL;
			}
			
			$tagdata = $obj->EE->TMPL->parse_variables($tagdata, $vars);
			
			$this->EE->safecracker_registration_lib->set_permissions($obj, $member_id);
				
			// -------------------------------------------
			// 'safecracker_register_entry_form_tagdata_end' hook.
			//  - Additional processing after the tagdata is manipulated
			//  - added in v1.2
			//
			
				$edata = $this->EE->extensions->call('safecracker_register_entry_form_tagdata_end', $tagdata, $obj);
				if ($this->EE->extensions->end_script === TRUE) return;
			//
			// -------------------------------------------	
		}
		
		return $tagdata;
	}
	
	public function safecracker_entry_form_tagdata_end($tagdata, $obj)
	{	
		$obj =& $obj;
		
		$register_member = $obj->EE->TMPL->fetch_param('register_member');
		$register_member = $this->param($register_member, FALSE, TRUE);
				
		$edit_member = $obj->EE->TMPL->fetch_param('edit_member');
		$edit_member = $this->param($edit_member, FALSE, TRUE);
		
		if($register_member === TRUE || $edit_member === TRUE)
		{				
			$return_var = $this->EE->TMPL->fetch_param('return_var');
			$return_var = $this->param($return_var, FALSE);
			
			if($return_var)
			{
				$return_var = $this->EE->input->get_post($return_var);
				
				if($return_var)
				{					
					$tagdata = preg_replace("/(\<input type=\"hidden\" name=\"return\" value=\")+(.*)+(\" \/\>)/u", "<input type=\"hidden\" name=\"return\" value=\"/".ltrim($return_var, '/')."\" />", $tagdata);
				}	
			}
			
			$return_segment = $obj->EE->TMPL->fetch_param('return_segment');
			$return_segment = $this->param($return_segment, FALSE);
			
			if($return_segment)
			{
				$segments     = $this->EE->uri->segment_array();
				$segments     = array_slice($segments, (int) $return_segment);
				
				if(count($segments) > 0)
				{
					$tagdata = preg_replace("/(\<input type=\"hidden\" name=\"return\" value=\")+(.*)+(\" \/\>)/u", "<input type=\"hidden\" name=\"return\" value=\"/".implode('/', $segments)."\" />", $tagdata);
				}
			}
			
			$this->EE->safecracker_registration_lib->get_permissions($obj);
		}
		
		return $tagdata;
	}
	
	public function member_member_register($data, $member_id)
	{
		$this->EE->load->library('safecracker_registration_lib');
		
		// -------------------------------------------
		// 'safecracker_register_member_register' hook.
		//  - Additional processing after a member successfully registers
		//    but before they are logged in.
		//  - added in v1.2
		//
		
			$edata = $this->EE->extensions->call('safecracker_register_member_register', $data, $member_id);
			if ($this->EE->extensions->end_script === TRUE) return;
		//
		// -------------------------------------------
		
		$is_pending = $this->EE->safecracker_registration_lib->activate_member($data);
		
		// Log user in (the extra query is a little annoying)
		$this->EE->load->library('auth');
		
		$member = $this->EE->db->get_where('members', array('member_id' => $member_id))->row();
		
		$this->EE->db->where('group_id', $member->group_id);
		$member_group = $this->EE->db->get('member_groups')->row();
	
		$this->EE->safecracker_registration_lib->update_group_id($member_id);
		
		$login_member = $this->EE->input->post('safecracker_registration_login_member');
		$login_member = $login_member == 'y' ? TRUE : FALSE;
	
		if($login_member)
		{
			$incoming = new Auth_result($member);
			$incoming->remember_me(60*60*24*182);
			$incoming->start_session();
						
			// -------------------------------------------
			// 'safecracker_register_member_login' hook.
			//  - Additional processing after a member successfully logged in
			//  - added in v1.2
			//
			
				$edata = $this->EE->extensions->call('safecracker_register_member_login', $member);
				if ($this->EE->extensions->end_script === TRUE) return;
			//
			// -------------------------------------------
		}
	
		foreach($this->EE->session->userdata as $key => $value)
		{
			if(isset($member->$key))
			{
				$this->EE->session->userdata[$key] = $member->$key;
			}

			if(isset($member_group->$key))
			{
				$this->EE->session->userdata[$key] = $member_group->$key;
			}
		}

		$this->EE->session->userdata['member_id'] = $member_id;
		$this->EE->session->userdata['group_id'] = 1;
		
		$_POST['author_id'] = $member_id;
			
		$this->EE->extensions->end_script = TRUE;
		
		return $data;
	}
	
	/**
	 * Activate Extension
	 *
	 * This function enters the extension into the exp_extensions table
	 *
	 * @return void
	 */
	public function activate_extension()
	{	    
	    return TRUE;
	}
	
	/**
	 * Update Extension
	 *
	 * This function performs any necessary db updates when the extension
	 * page is visited
	 *
	 * @return  mixed   void on update / false if none
	 */
	public function update_extension($current = '')
	{
	    if ($current == '' OR $current == $this->version)
	    {
	        return FALSE;
	    }
	
	    if ($current < '1.0')
	    {
	        // Update to version 1.0
	    }
	
	    $this->EE->db->where('class', __CLASS__);
	    $this->EE->db->update('extensions', array('version' => $this->version));
	}
	
	/**
	 * Disable Extension
	 *
	 * This method removes information from the exp_extensions table
	 *
	 * @return void
	 */
	public function disable_extension()
	{
	    $this->EE->db->where('class', __CLASS__);
	    $this->EE->db->delete('extensions');
	}
	
	private function param($param, $default = FALSE, $boolean = FALSE, $required = FALSE)
	{
		$name = '';
			
		if($required && !$param) show_error('You must define a "'.$name.'" parameter in the '.__CLASS__.' tag.');
			
		if($param === FALSE && $default !== FALSE)
		{
			$param = $default;
		}
		else
		{				
			if($boolean)
			{
				$param = strtolower($param);
				$param = ($param == 'true' || $param == 'yes') ? TRUE : FALSE;
			}			
		}
		
		return $param;			
	}	 
	
}
// END CLASS

/* End of file ext.safecracker_registration.php */
/* Location: ./system/expressionengine/third_party/modules/safecracker_registration/ext.safecracker_registration.php */