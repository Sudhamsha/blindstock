<?php 

if (!defined('BASEPATH')) exit('Invalid file request');
if (!defined('PATH_THIRD')) define('PATH_THIRD', EE_APPPATH.'third_party/');
	require_once PATH_THIRD.'zoo_visitor/config.php';

/**
 * Zoo visitor Update Class
 *
 * @package   Zoo visitor
 * @author    ExpressionEngine Zoo <info@eezoo.com>
 * @copyright Copyright (c) 2011 ExpressionEngine Zoo (http://eezoo.com)
 */
class Zoo_visitor_upd
{
	var $version = ZOO_VISITOR_VER; 
	var $module_name = ZOO_VISITOR_CLASS;
	
	function Zoo_visitor_upd() 
	{
		// Make a local reference to the ExpressionEngine super object
		$this->EE =& get_instance();
	} 
	
	function install() 
	{
		// Insert module data
		$data = array(
			'module_name' => $this->module_name,
			'module_version' => $this->version,
			'has_cp_backend' => 'y',
			'has_publish_fields' => 'n'
		);
		
		$this->EE->db->insert('modules', $data);
		
		// zoo visitor settings 
		$fields = array(
			'id'			=>	array('type' => 'int', 'constraint' => '10', 'unsigned' => TRUE, 'null' => FALSE, 'auto_increment' => TRUE),
			'site_id'		=>	array('type' => 'int', 'constraint' => '8', 'unsigned' => TRUE, 'null' => FALSE, 'default' => '1'),
			'var'			=>	array('type' => 'varchar', 'constraint' => '60', 'null' => FALSE),
			'var_value'		=>	array('type' => 'text', 'null' => FALSE),
			'var_fieldtype'	=>	array('type' => 'varchar', 'constraint' => '100', 'null' => FALSE)
		);

		$this->EE->load->dbforge();
		$this->EE->dbforge->add_field($fields);
		$this->EE->dbforge->add_key('id', TRUE);
		$this->EE->dbforge->create_table('zoo_visitor_settings', TRUE);			

		// zoo visitor membergroup activation
		$fields = array(
			'member_id'			=>	array('type' => 'int', 'constraint' => '10', 'unsigned' => TRUE, 'null' => FALSE),
			'group_id'			=>	array('type' => 'int', 'constraint' => '10', 'unsigned' => TRUE, 'null' => FALSE),
		);
		
		$this->EE->dbforge->add_field($fields);
		$this->EE->dbforge->create_table('zoo_visitor_activation_membergroup', TRUE);
		
		$setting = array();
	    
		$setting[] = array('member_channel_id'			,'select'	, '');
		$setting[] = array('anonymous_member_id'		,'select'	, '');
		$setting[] = array('redirect_after_activation'	,'select'	, 'no');
		$setting[] = array('redirect_location'			,'textinput', '');
		$setting[] = array('email_is_username'			,'select'	, 'yes');
		$setting[] = array('email_confirmation'			,'select'	, 'no');
		$setting[] = array('password_confirmation'		,'select'	, 'yes');
		$setting[] = array('use_screen_name'			,'select'	, 'no');
		$setting[] = array('new_entry_status'			,'textinput', 'incomplete_profile');
		$setting[] = array('incomplete_status'			,'textinput', 'incomplete_profile');
		$setting[] = array('screen_name_override'		,'textinput', '');
		$setting[] = array('title_override'				,'textinput', '');
		$setting[] = array('sync_standard_member_fields', 'textinput', '');
		$setting[] = array('sync_custom_member_fields', 'textinput', '');
		$setting[] = array('hide_link_to_existing_member', 'textinput', 'no');

		$setting[] = array('redirect_view_all_members'	,'select'	, 'no');
		$setting[] = array('membergroup_as_status'	,'select'	, 'yes');
		$setting[] = array('delete_member_when_deleting_entry'	,'select'	, 'no');
		$setting[] = array('redirect_member_edit_profile_to_edit_channel_entry'	,'select'	, 'no');

		$this->safe_insert($setting);	
		
		return TRUE;
	}
	
	function uninstall() 
	{
		// Delete module and his actions
		$this->EE->db->select('module_id');
		$query = $this->EE->db->get_where('modules', array('module_name' => $this->module_name));
		
		$this->EE->db->where('module_id', $query->row('module_id'));
		$this->EE->db->delete('module_member_groups');
		
		$this->EE->db->where('module_name', $this->module_name);
		$this->EE->db->delete('modules');
		
		$this->EE->db->where('class', $this->module_name);
		$this->EE->db->delete('actions');
		
		$this->EE->db->where('class', $this->module_name.'_mcp');
		$this->EE->db->delete('actions');
		
		$this->EE->db->where('site_id', $this->EE->config->item('site_id'));
		$this->EE->db->delete('zoo_visitor_settings');
		
		return TRUE;
	}
	
	function update($current = '')
	{

		if ($current == '' OR $current == $this->version)
		{
			return FALSE;
		}

		if ($current < '1.0.3')
		{
			$setting = array();
			$setting[] = array('screen_name_override', 'textinput', '');
			$this->safe_insert($setting);
		}

		if ($current < '1.0.7')
		{
			$setting = array();
			$setting[] = array('title_override', 'textinput', '');
			$this->safe_insert($setting);
		}
		
		if ($current < '1.1.3')
		{
			$setting = array();
			$setting[] = array('sync_standard_member_fields', 'textinput', '');
			$setting[] = array('sync_custom_member_fields', 'textinput', '');
			$this->safe_insert($setting);
		}

		if ($current < '1.2.1')
		{
			// zoo visitor membergroup activation
			$fields = array(
				'member_id'			=>	array('type' => 'int', 'constraint' => '10', 'unsigned' => TRUE, 'null' => FALSE),
				'group_id'			=>	array('type' => 'int', 'constraint' => '10', 'unsigned' => TRUE, 'null' => FALSE),
			);
			$this->EE->load->dbforge();
			$this->EE->dbforge->add_field($fields);
			$this->EE->dbforge->create_table('zoo_visitor_activation_membergroup', TRUE);
		}
		
		if ($current < '1.2.2')
		{
			$setting = array();
			$setting[] = array('hide_link_to_existing_member', 'textinput', '');
			$this->safe_insert($setting);
		}

		if ($current < '1.3.20')
		{
			$setting = array();
			$setting[] = array('redirect_view_all_members'	,'select'	, 'no');
			$setting[] = array('membergroup_as_status'	,'select'	, 'yes');
			$setting[] = array('delete_member_when_deleting_entry'	,'select'	, 'no');
			$this->safe_insert($setting);
		}

		if ($current < '1.3.22')
		{
			$setting = array();
			$setting[] = array('redirect_member_edit_profile_to_edit_channel_entry'	,'select'	, 'no');
			$this->safe_insert($setting);
		}

		$this->EE->db->where('module_name', $this->module_name);
		$this->EE->db->update(
					'modules', 
					array('module_version' => $this->version)
		);
		
	}
	
	
	/**
     * Safe insert of settings, does not overwrite existing settings
     */
	function safe_insert($settings){
		
		foreach($settings as $vars){
		
			$var 			= $vars[0];
			$var_fieldtype 	= $vars[1];
			$var_value 		= $vars[2];
			
			$sql = "SELECT * FROM ".$this->EE->db->dbprefix('zoo_visitor_settings')." WHERE site_id = '".$this->EE->config->item('site_id')."' AND var = '".$var."'";
		
			$result = $this->EE->db->query($sql);
		
			if ($result->num_rows() > 0){
	
				//SETTINGS EXISTS, DO NOTHING to AVOID DATA LOSS
							
			}else{
			
				$data = array(
	               'var'	 		=> $var,
	               'var_value' 		=> $var_value,
	               'var_fieldtype' 	=> $var_fieldtype,
	               'site_id' 		=> $this->EE->config->item('site_id')
	            );
	
				$this->EE->db->insert('zoo_visitor_settings', $data);
				
			}
		}
	}
	
	
}