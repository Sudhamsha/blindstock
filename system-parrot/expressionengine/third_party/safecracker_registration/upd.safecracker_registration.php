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

class Safecracker_registration_upd {

    public $version = SAFECRACKER_REGISTRATION_VERSION;
	public $mod_name;
	public $ext_name;
	public $mcp_name;
	
	private $tables = array();
	
	private $actions = array(
		'safecracker_registration_mcp' => 'upload_action',
		'safecracker_registration' 	   => 'change_password_action',
	);
	
	private $hooks = array(
		array('safecracker_entry_form_tagdata_start', 'safecracker_entry_form_tagdata_start'),
		array('safecracker_entry_form_tagdata_end', 'safecracker_entry_form_tagdata_end'),
		array('safecracker_submit_entry_start', 'safecracker_submit_entry_start'),
		array('safecracker_submit_entry_end', 'safecracker_submit_entry_end'),
		array('member_member_register', 'member_member_register'),
		array('channel_entries_row', 'channel_entries_row')
	);
	
    public function __construct()
    {
        // Make a local reference to the ExpressionEngine super object
        $this->EE =& get_instance();
        
        $this->mod_name 	= str_replace('_upd', '', __CLASS__);
        $this->ext_name		= $this->mod_name . '_ext';
        $this->mcp_name		= $this->mod_name . '_mcp';
    }
	
	public function install()
	{	
		$this->EE->load->library('data_forge');
		
		$this->EE->data_forge->update_tables($this->tables);
		
		$data = array(
	        'module_name' 		 => $this->mod_name,
	        'module_version' 	 => $this->version,
	        'has_cp_backend' 	 => 'y',
	        'has_publish_fields' => 'n'
	    );
	    	
	    $this->EE->db->insert('modules', $data);
	    	    	    
		foreach ($this->hooks as $row)
		{
			$this->EE->db->insert(
				'extensions',
				array(
					'class' 	=> $this->ext_name,
					'method' 	=> $row[0],
					'hook' 		=> ( ! isset($row[1])) ? $row[0] : $row[1],
					'settings' 	=> ( ! isset($row[2])) ? '' : $row[2],
					'priority' 	=> ( ! isset($row[3])) ? 10 : $row[3],
					'version' 	=> $this->version,
					'enabled' 	=> 'y'
				)
			);
		}
		
		foreach($this->actions as $class => $method)
		{
			$this->EE->db->insert('actions', array(
				'class'  => $class,
				'method' => $method
			));
		}
				
		$this->_set_defaults();
				
		return TRUE;
	}
	
	public function update($current = '')
	{		
		require_once 'libraries/Data_forge.php';
		
		$this->EE->data_forge = new Data_forge();
		$this->EE->data_forge->update_tables($this->tables);

		foreach($this->actions as $class => $method)
		{
			$this->EE->db->where(array(
				'class'  => $class,
				'method' => $method
			));
			
			$existing = $this->EE->db->get('actions');

			if($existing->num_rows() == 0)
			{
				$this->EE->db->insert('actions', array(
					'class'  => $class,
					'method' => $method
				));
			}
		}
		
		foreach($this->hooks as $row)
		{
			$this->EE->db->where(array(
				'class'  => $this->ext_name,
				'method'  => $row[0],
				'hook' => $row[1]
			));
			
			$existing = $this->EE->db->get('extensions');

			if($existing->num_rows() == 0)
			{
				$this->EE->db->insert(
					'extensions',
					array(
						'class' 	=> $this->ext_name,
						'method' 	=> $row[0],
						'hook' 		=> ( ! isset($row[1])) ? $row[0] : $row[1],
						'settings' 	=> ( ! isset($row[2])) ? '' : $row[2],
						'priority' 	=> ( ! isset($row[3])) ? 10 : $row[3],
						'version' 	=> $this->version,
						'enabled' 	=> 'y',
					)
				);
			}
		}
		
	    return TRUE;
	}
	
	public function uninstall()
	{
		$this->EE->load->dbforge();
		
		$this->EE->db->delete('modules', array('module_name' => $this->mod_name));
		$this->EE->db->delete('extensions', array('class' => $this->ext_name));		
		$this->EE->db->delete('actions', array('class' => $this->mod_name));
		
		$this->EE->db->delete('actions', array('class' => $this->mod_name));
		$this->EE->db->delete('actions', array('class' => $this->mcp_name));
		
		foreach(array_keys($this->tables) as $table)
		{
			$this->EE->dbforge->drop_table($table);
		}
			
		return TRUE;
	}
	
	private function _set_defaults()
	{
	}
}
// END CLASS

/* End of file upd.safecracker_registration.php */
/* Location: ./system/expressionengine/third_party/modules/safecracker_registration/upd.safecracker_registration.php */