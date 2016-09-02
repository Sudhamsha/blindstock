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

class Safecracker_registration {
	
	public function __construct()
	{
		$this->EE =& get_instance();
		
		$this->EE->load->driver('Channel_data');
		$this->EE->load->library('Safecracker_registration_lib');
		$this->EE->load->library('Base_form');		
	}
	
	public function generate_password()
	{
		$this->EE->load->helper('string');
		
		$length  = $this->param('length', 8);
		$type    = $this->param('type', 'sha1');
		$tagdata = $this->EE->TMPL->tagdata;
		
		if($type != 'secure')
		{
			$string  = random_string($type, $length);
		}
		else
		{
			$string = $this->EE->safecracker_registration_lib->secure_password($length);
		}
		
		if(!$tagdata)
		{
			return $string;
		}
		else
		{
			$vars = array(
				'password' => $string
			);
			
			if($prefix = $this->param('prefix', FALSE))
			{
				$vars = $this->EE->channel_data->utility->add_prefix($prefix, $vars);
			}
			
			return $this->parse(array($vars));
		}
	}
	
	public function author_id()
	{
		$params = array(
			'username',
			'screen_name',
			'email'
		);
		
		$where = array();
		
		foreach($params as $param)
		{
			if($value = $this->param($param))
			{
				$where[$param] = $value;
			}
		}
		
		if(count($where) == 0)
		{
			return NULL;
		}
		
		$member = $this->EE->channel_data->get_members(array(
			'where' => $where
		))->row_array();
		
		return isset($member['member_id']) ? $member['member_id'] : NULL;
	}
	
	/*
	public function profile()
	{
		$author_id     = 'CURRENT_USER';
		$where         = array();
		$member_fields = array(
			'username'    => 'username', 
			'screen_name' => 'screen_name', 
			'member_id'   => 'members.member_id', 
			'author_id'   => 'members.member_id'
		);
		
		foreach($member_fields as $field => $db_field)
		{
			if($value = $this->param($field))
			{
				$where[$db_field] = $value;
			}
		}
		
		if(count($where) > 0)
		{
			$member = $this->EE->channel_data->get_members(array(
				'where' => $where
			));
			
			$author_id = $member->row('member_id') ? $member->row('member_id') : $author_id;
		}
		
		$params = array(
			'author_id'     => $author_id,
			'channel'       => $this->param('channel', 'members'),
			'limit'         => $this->param('limit', 1),
			'member_prefix' => $this->param('member_prefix', 'member'),
			'dynamic'       => $this->param('dynamic', 'no')
		);
		
		// var_dump($params);exit();
		return trim($this->EE->safecracker_registration_lib->entries($params));
	}	
	
	public function profiles()
	{
		$params = array(
			'channel'       => $this->param('channel', 'members'),
			'member_prefix' => $this->param('member_prefix', 'member')
		);
		
		return trim($this->EE->safecracker_registration_lib->entries($params));
	}
	public function change_password()
	{
		$session_member_id = $this->EE->session->userdata['member_id'];
		
		$hidden_fields = array(
			'member_id' => $this->param('member_id', $session_member_id)
		);
		
		return $this->EE->base_form->open($hidden_fields);
	}
		
	*/
	
	private function parse($vars, $tagdata = FALSE)
	{
		if($tagdata === FALSE)
		{
			$tagdata = $this->EE->TMPL->tagdata;
		}
			
		return $this->EE->TMPL->parse_variables($tagdata, $vars);
	}
	
	private function param($param, $default = FALSE, $boolean = FALSE, $required = FALSE)
	{
		$name 	= $param;
		$param 	= $this->EE->TMPL->fetch_param($param);
		
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

/* End of file mod.safecracker_registration.php */
/* Location: ./system/expressionengine/third_party/modules/safecracker_registration/mod.safecracker_registration.php */