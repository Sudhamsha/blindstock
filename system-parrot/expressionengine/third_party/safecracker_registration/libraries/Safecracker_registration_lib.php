<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Safecracker Registration Library
 * 
 * @package		Safecracker Registration
 * @subpackage	Libraries
 * @author		Justin Kimbrell
 * @copyright	Copyright (c) 2012, Objective HTML
 * @link 		http://www.objectivehtml.com/safecracker-registration
 * @version		1.2.0
 * @build		20120103
 */

class Safecracker_registration_lib {

	public $required_fields	= array('email', 'password', 'password_confirm');
	public $optional_fields = array('screen_name', 'location', 'url');
	
	public function __construct()
	{
		$this->EE =& get_instance();
		
		$this->EE->load->driver('channel_data');
				
		if ( ! class_exists('EE_Validate'))
		{
			require APPPATH.'libraries/Validate.php';
		}
		
		$this->EE->load->config('safecracker_registration_config');
		$this->EE->load->language('member');
		$this->EE->load->model('member_model');
		$this->EE->load->library('auth');
		$this->EE->load->library('form_validation');
		$this->EE->load->library('encrypt');
		
		$this->key = config_item('encryption_key') ? config_item('encryption_key') : config_item('safecracker_registration_default_key');
	}
	
	public function secure_password($length = 9, $add_dashes = false, $available_sets = 'luds')
	{
		$sets = array();
		if(strpos($available_sets, 'l') !== false)
			$sets[] = 'abcdefghjkmnpqrstuvwxyz';
		if(strpos($available_sets, 'u') !== false)
			$sets[] = 'ABCDEFGHJKMNPQRSTUVWXYZ';
		if(strpos($available_sets, 'd') !== false)
			$sets[] = '23456789';
		if(strpos($available_sets, 's') !== false)
			$sets[] = '!@#$%&*?';
	
		$all = '';
		$password = '';
		foreach($sets as $set)
		{
			$password .= $set[array_rand(str_split($set))];
			$all .= $set;
		}
	
		$all = str_split($all);
		for($i = 0; $i < $length - count($sets); $i++)
			$password .= $all[array_rand($all)];
	
		$password = str_shuffle($password);
	
		if(!$add_dashes)
			return $password;
	
		$dash_len = floor(sqrt($length));
		$dash_str = '';
		while(strlen($password) > $dash_len)
		{
			$dash_str .= substr($password, 0, $dash_len) . '-';
			$password = substr($password, $dash_len);
		}
		$dash_str .= $password;
		return $dash_str;
	}

	public function entries($params = array())
	{
		require_once APPPATH.'modules/channel/mod.channel.php';
		
		$channel = new Channel();
		
		foreach($params as $index => $value)
		{
			if(!isset($this->EE->TMPL->tagparams[$index]))
			{
				$this->EE->TMPL->tagparams[$index] = $value;
			}
		}
		
		return $channel->entries(TRUE);
	}
		
	public function set_permissions(&$obj, $member_id = 1)
	{
		if(!config_item('safecracker_registration_respect_permissions'))
		{
			$this->EE->session->set_cache(__CLASS__, 'member', array(
				'logged_out_member_id' => $obj->logged_out_member_id,
				'group_id'  => $this->EE->session->userdata['group_id'],
				'member_id' => $this->EE->session->userdata['member_id'],
				'can_edit_other_entries' => $this->EE->session->userdata['can_edit_other_entries'],
				'can_assign_post_authors' => $this->EE->session->userdata['can_assign_post_authors']
			));
			
			$obj->logged_out_member_id = TRUE;
			
			$this->EE->session->userdata['group_id']  = 1;
			$this->EE->session->userdata['member_id'] = $member_id;
			$this->EE->session->userdata['can_edit_other_entries'] = 'y';
			$this->EE->session->userdata['can_assign_post_authors'] = 'y';
		}
	}
	
	public function get_permissions(&$obj)
	{		
		if(!config_item('safecracker_registration_respect_permissions'))
		{
			$member_data = $this->EE->session->cache[__CLASS__]['member'];
		
			$obj->group_id             = $member_data['group_id'];
			$obj->logged_out_member_id = $member_data['logged_out_member_id'];
			
			$this->EE->session->userdata['group_id']  = $member_data['group_id'];
			$this->EE->session->userdata['member_id'] = $member_data['member_id'];
			$this->EE->session->userdata['can_edit_other_entries']  = $member_data['can_edit_other_entries'];
			$this->EE->session->userdata['can_assign_post_authors'] = $member_data['can_assign_post_authors'];
		}
	}
	
	public function encode($str)
	{
		return $this->EE->encrypt->encode($str, $this->key);
	}
	
	public function decode($str)
	{
		if(!preg_match('/^(\d)*$/u', $str, $matches))
		{
			$str = $this->EE->encrypt->decode($str, $this->key);
		}
		
		return $str;		
	}
	
	public function update_group_id($member_id)
	{
		$group_id = $this->decode($this->EE->input->post('safecracker_registration_group_id', TRUE));
	
		if($group_id !== FALSE && $group_id != NULL)
		{
			$valid_groups = $this->EE->input->post('safecracker_registration_valid_groups', TRUE);
			
			if($valid_groups)
			{
				$valid_groups = explode('|', $this->decode($valid_groups));
			}
			
			if(is_array($valid_groups) && in_array($group_id, $valid_groups))
			{
				// Force the group to pending, or the activation will fail.
				if ($this->EE->config->item('req_mbr_activation') == 'email')
				{
					//$group_id = 4;	
				}
				
				$this->EE->db->where('member_id', $member_id);
				$this->EE->db->update('members', array('group_id' => $group_id));
			}
		}
	}
	
	public function is_active($type, $value)
	{
		//if(config_item('req_mbr_activation') != 'none')
		//{
			$always_disallowed = array(4);

			$member = $this->EE->db->get_where('members', array($type => $value));
			
			if (in_array($member->row('group_id'), $always_disallowed))
			{
				return FALSE;
				//return $this->EE->output->show_user_error('general', lang('authenticate_account_not_active'));
			}				
		//}
		
		return TRUE;
	}
	
	public function activate_member($data)
	{
		$this->EE->load->language('member');
				
		$mailinglist_subscribe = FALSE;
		
		$is_pending = FALSE;
		
		if ($this->EE->config->item('req_mbr_activation') == 'email')
		{
			$action_id  = $this->EE->functions->fetch_action_id('Member', 'activate_member');

			$name = ($data['screen_name'] != '') ? $data['screen_name'] : $data['username'];

			$board_id = ($this->EE->input->get_post('board_id') !== FALSE && is_numeric($this->EE->input->get_post('board_id'))) ? $this->EE->input->get_post('board_id') : 1;

			$forum_id = ($this->EE->input->get_post('FROM') == 'forum') ? '&r=f&board_id='.$board_id : '';

			$add = ($mailinglist_subscribe !== TRUE) ? '' : '&mailinglist='.$_POST['mailinglist_subscribe'];

			$swap = array(
				'name'				=> $name,
				'activation_url'	=> $this->EE->functions->fetch_site_index(0, 0).QUERY_MARKER.'ACT='.$action_id.'&id='.$data['authcode'].$forum_id.$add,
				'site_name'			=> stripslashes($this->EE->config->item('site_name')),
				'site_url'			=> $this->EE->config->item('site_url'),
				'username'			=> $data['username'],
				'email'				=> $data['email']
			 );

			$template = $this->EE->functions->fetch_email_template('mbr_activation_instructions');
			$email_tit = $this->var_swap($template['title'], $swap);
			$email_msg = $this->var_swap($template['data'], $swap);

			// Send email
			$this->EE->load->helper('text');

			$this->EE->load->library('email');
			$this->EE->email->wordwrap = true;
			$this->EE->email->from($this->EE->config->item('webmaster_email'), $this->EE->config->item('webmaster_name'));
			$this->EE->email->to($data['email']);
			$this->EE->email->subject($email_tit);
			$this->EE->email->message(entities_to_ascii($email_msg));
			$this->EE->email->Send();
			
			$is_pending = TRUE;
		}
		
		return $is_pending;
	}
	
	public function edit_member(&$obj)
	{
		$email			  = $this->EE->input->post('email');
		$username		  = $this->EE->input->post('username');
		
		if(isset($_POST['username']))
		{
			$this->EE->form_validation->set_rules('username', 'Username', 'required');
		}
		else
		{
			$username = $email;
		}
		
		$screen_name	  = $this->EE->input->post('screen_name') ? $this->EE->input->post('screen_name') : $username;
		$password 		  = $this->EE->input->post('password');
		$password_confirm = $this->EE->input->post('password_confirm');
		
		$this->EE->form_validation->set_rules('email', 'E-mail', 'required|valid_email');
		
		$member_id = $this->EE->input->post('safecracker_registration_member_id');
		$member	   = $this->EE->channel_data->get_member($member_id)->result_array();
		
		$this->update_group_id($member_id);
		
		if(isset($member[0]))
		{
			$VAL = new EE_Validate(array(
				'member_id'			=> '',
				'val_type'			=> 'update', // new or update
				'fetch_lang' 		=> TRUE,
				'require_cpw' 		=> FALSE,
			 	'enable_log'		=> FALSE,
				'username'			=> $username,
				'cur_username'		=> '',
				'screen_name'		=> $screen_name,
				'cur_screen_name'	=> '',
				'password'			=> $password,
			 	'password_confirm'	=> $password_confirm,
			 	'cur_password'		=> '',
			 	'email'				=> $email,
			 	'cur_email'			=> ''
			 ));
	
			$member_data = array(
				'username' 	  => $username,
				'screen_name' => $screen_name,
				'email'		  => $email
			);
			
			if(isset($_POST['screen_name']))
			{
				$VAL->validate_screen_name();
			}
			
			if(!empty($password) && !empty($password_confirm))
			{					
				$VAL->validate_password();
			}
							
			$VAL->validate_email();
			
			if(count($VAL->errors) == 0)
			{
				if(!empty($password) && !empty($password_confirm))
				{	
					$this->EE->auth->update_password($member_id, $password);
				}
				
				$this->EE->member_model->update_member($member_id, $member_data, array(
					'member_id' => $member_id	
				));
			
			}
			else
			{
				$obj->errors = array_merge($obj->errors, $VAL->errors);
			}				
		}
		
	}
	
	public function register_member(&$obj)
	{
		$email			  = $this->EE->input->post('email');
		$username		  = $this->EE->input->post('username');
		
		if(isset($_POST['username']))
		{
			$this->EE->form_validation->set_rules('username', 'Username', 'required');
		}
		else
		{
			$_POST['username'] = $email;
			$username = $email;
		}
		
		$this->EE->form_validation->set_rules('password', 'Password', 'required|matches[password_confirm]');
		$this->EE->form_validation->set_rules('password_confirm', 'Password Confirmation', 'required');
		$this->EE->form_validation->set_rules('email', 'E-mail', 'required|valid_email');

		$screen_name	  	 = $this->EE->input->post('screen_name') ? $this->EE->input->post('screen_name') : $username;
		
		$dynamic_screen_name = $this->EE->input->post('safecracker_registration_dynamic_screen_name');
		
		if($dynamic_screen_name)
		{
			foreach($_POST as $field => $value)
			{
				$dynamic_screen_name = str_replace('['.$field.']', $value, $dynamic_screen_name);
			}
			
			$screen_name = $dynamic_screen_name;
		}		
		
		$_POST['screen_name'] = $screen_name;		
		$password 		  	  = $this->EE->input->post('password');
		$password_confirm 	  = $this->EE->input->post('password_confirm');
		
		if(!$this->EE->form_validation->run())
		{
			foreach($this->required_fields as $field)
			{
				$error = $this->EE->form_validation->error($field);
				
				$obj->field_errors[$field] = $error;
			}
		}
		else
		{
			$VAL = new EE_Validate(array(
				'member_id'			=> '',
				'val_type'			=> 'new', // new or update
				'fetch_lang' 		=> TRUE,
				'require_cpw' 		=> FALSE,
			 	'enable_log'		=> FALSE,
				'username'			=> $username,
				'cur_username'		=> '',
				'screen_name'		=> $screen_name,
				'cur_screen_name'	=> '',
				'password'			=> $password,
			 	'password_confirm'	=> $password_confirm,
			 	'cur_password'		=> '',
			 	'email'				=> $email,
			 	'cur_email'			=> ''
			 ));
	
			$VAL->validate_username();
			
			if(isset($_POST['screen_name']))
			{
				$VAL->validate_screen_name();
			}
			
			$VAL->validate_password();				
			$VAL->validate_email();
	
			// Do we allow new member registrations?
			if ($this->EE->config->item('allow_member_registration') == 'n')
			{
				$obj->errors[] = 'Member registrations are not accepted at this time.';
			}
			
			// Is user banned?
			if ($this->EE->session->userdata('is_banned') === TRUE)
			{
				$obj->errors[] = lang('not_authorized');
			}
	
			// Blacklist/Whitelist Check
			if ($this->EE->blacklist->blacklisted == 'y' && 
				$this->EE->blacklist->whitelisted == 'n')
			{
				$obj->errors[] = lang('not_authorized');
			}
			
			if (isset($_POST['email_confirm']) && $_POST['email'] != $_POST['email_confirm'])
			{
				$obj->field_errors['email_confirm'] = lang('mbr_emails_not_match');
			}
	
			if ($this->EE->config->item('use_membership_captcha') == 'y')
			{
				if ( ! isset($_POST['captcha']) OR $_POST['captcha'] == '')
				{
					$obj->field_errors['captcha'] = lang('captcha_required');
				}
			}				
	
			if ($this->EE->config->item('require_terms_of_service') == 'y')
			{
				if ( ! isset($_POST['accept_terms']))
				{
					$obj->field_errors['accept_terms'] = lang('mbr_terms_of_service_required');
					
				}
			}
						
			$obj->field_errors = array_merge($obj->field_errors, $VAL->errors);
			
			if(count($obj->field_errors) == 0)
			{
				$this->set_validation_rules($obj);	
				
				if($this->EE->form_validation->run())
				{
					include_once(APPPATH.'modules/member/mod.member.php');				
					include_once(APPPATH.'modules/member/mod.member_register.php');
					
					// Secure Mode Forms?
					if ($this->EE->config->item('secure_forms') == 'y')
					{
						if(!$this->EE->security->check_xid($this->EE->input->post('XID')))
						{
							return $this->EE->output->show_user_error('general', array(lang('not_authorized')));
						}
					}
					
					$member_register = new Member_register();
					$member_register->register_member();
				
					// Secure Mode Forms?
					if ($this->EE->config->item('secure_forms') == 'y')
					{	
						$post = array(
							'hash' 		   => $this->EE->db->escape_str($_POST['XID']),
							'date' 		   => $this->EE->localize->now
						);
												
						if(version_compare(APP_VER, '2.5.5', '<'))
						{
							$post['ip_address'] = $this->EE->input->ip_address();
						}
						else
						{
							$post['session_id'] = $this->EE->session->userdata('session_id');
						}
											
						$this->EE->db->insert('security_hashes', $post);
					}
					
					$this->EE->extensions->end_script = FALSE;
				}
			}		
		}				
	}
	
	public function set_validation_rules(&$obj)
	{
		foreach ($obj->custom_fields as $i => $field)
		{			
			$isset = (isset($_POST['field_id_'.$field['field_id']]) || isset($_POST[$field['field_name']]) || (((isset($_FILES['field_id_'.$field['field_id']]) && $_FILES['field_id_'.$field['field_id']]['error'] != 4) || (isset($_FILES[$field['field_name']]) && $_FILES[$field['field_name']]['error'] != 4)) && in_array($field['field_type'], $this->file_fields)));

			if ( ! $obj->edit || $isset)
			{
				$field_rules = array();
				
				if ( ! empty($rules[$field['field_name']]))
				{
					$field_rules = explode('|', $this->decrypt_input($rules[$field['field_name']]));
				}
				
				if ( ! in_array('call_field_validation['.$field['field_id'].']', $field_rules))
				{
					array_unshift($field_rules, 'call_field_validation['.$field['field_id'].']');
				}
				
				if ($field['field_required'] == 'y' && ! in_array('required', $field_rules))
				{
					array_unshift($field_rules, 'required');
				}
				
				$this->EE->form_validation->set_rules($field['field_name'], $field['field_label'], implode('|', $field_rules));
			}
		}
	}
	
	public function parse_fields($vars, $tagdata = FALSE, $parse_tags = FALSE, $prefix = '')
	{
	
		if($tagdata === FALSE)
		{
			$tagdata = $this->EE->TMPL->tagdata;
		}
		
		$return = NULL;
		
		if($parse_tags)
		{
			$channels = $this->EE->channel_data->get_channels()->result_array();
			$channels = $this->EE->channel_data->utility->reindex($channels, 'channel_id');
			
			$fields = $this->EE->channel_data->get_fields()->result_array();
			$fields = $this->EE->channel_data->utility->reindex($fields, 'field_name');
			
			$count = 0;
			
			if(!isset($vars[0]))
			{
				$vars = array($vars);
			}
			
			$global_vars = $vars[0];
			unset($global_vars['results']);
			
			$TMPL = $this->EE->channel_data->tmpl->init();
			
			if(!isset($vars[0]['results']))
			{
				$vars[0]['results'] = $vars;	
			}
			
			foreach($vars[0]['results'] as $index => $var)
			{		
				$count++;
				
				$var = array_merge($global_vars, $var);
				$var['result_index'] = $index;
				$var['result_count'] = $index + 1;
				
				$row_tagdata = $this->EE->TMPL->parse_variables_row($tagdata, array('results' => $vars[0]['results']));
			
				$row_tagdata = $this->EE->channel_data->tmpl->parse_fieldtypes($var, $channels, $fields, $row_tagdata, $prefix, $count);
				
				$return .= $row_tagdata;
			}
		}
		else
		{
			$return = $this->EE->TMPL->parse_variables($tagdata, $vars);
		}
		
		return $return;
	}
	
	/**
	 * Replace variables
	 */
	private function var_swap($str, $data)
	{
		if ( ! is_array($data))
		{
			return FALSE;
		}

		foreach ($data as $key => $val)
		{
			$str = str_replace('{'.$key.'}', $val, $str);
		}

		return $str;
	}
	
}