<?php

/*
=====================================================
 Bookmarks
-----------------------------------------------------
 http://www.intoeetive.com/
-----------------------------------------------------
 Copyright (c) 2012 Yuri Salimovskiy
=====================================================
 This software is intended for usage with
 ExpressionEngine CMS, version 2.0 or higher
=====================================================
 File: upd.bookmarks.php
-----------------------------------------------------
 Purpose: Lets people bookmark entries (and other data) for quick access
=====================================================
*/

if ( ! defined('BASEPATH'))
{
    exit('Invalid file request');
}

require_once PATH_THIRD.'bookmarks/config.php';

class Bookmarks_upd {

    var $version = BOOKMARKS_ADDON_VERSION;
    
    function __construct() { 
        // Make a local reference to the ExpressionEngine super object 
        $this->EE =& get_instance(); 
    } 
    
    function install() { 
        
        $this->EE->load->dbforge(); 
        
        //----------------------------------------
		// EXP_MODULES
		// The settings column, Ellislab should have put this one in long ago.
		// No need for a seperate preferences table for each module.
		//----------------------------------------
		if ($this->EE->db->field_exists('settings', 'modules') == FALSE)
		{
			$this->EE->dbforge->add_column('modules', array('settings' => array('type' => 'TEXT') ) );
		}
        
        $settings = array();
        
        $data = array( 'module_name' => 'Bookmarks' , 'module_version' => $this->version, 'has_cp_backend' => 'n', 'settings'=> serialize($settings) ); 
        $this->EE->db->insert('modules', $data); 
        
        $data = array( 'class' => 'Bookmarks' , 'method' => 'add' ); 
        $this->EE->db->insert('actions', $data); 
        
        $data = array( 'class' => 'Bookmarks' , 'method' => 'remove' ); 
        $this->EE->db->insert('actions', $data); 
        
        //exp_bookmarks
        $fields = array(
			'bookmark_id'		=> array('type' => 'INT',		'unsigned' => TRUE, 'auto_increment' => TRUE),
			'member_id'			=> array('type' => 'INT',		'unsigned' => TRUE, 'default' => 0),
			'type'				=> array('type' => 'VARCHAR',	'constraint'=> 250,'default' => ''),
			'site_id'			=> array('type' => 'INT',		'unsigned' => TRUE, 'default' => 0),
			'data_group_id'		=> array('type' => 'INT',		'unsigned' => TRUE, 'default' => 0),
			'data_id'			=> array('type' => 'INT',		'unsigned' => TRUE, 'default' => 0),
			'bookmark_date'	    => array('type' => 'INT',		'unsigned' => TRUE, 'default' => 0)
		);

		$this->EE->dbforge->add_field($fields);
		$this->EE->dbforge->add_key('bookmark_id', TRUE);
		$this->EE->dbforge->add_key('member_id');
		$this->EE->dbforge->add_key('data_id');
		$this->EE->dbforge->add_key('site_id');
		$this->EE->dbforge->add_key('data_group_id');
		$this->EE->dbforge->create_table('bookmarks', TRUE);
        
        return TRUE; 
        
    } 
    
    function uninstall() { 

        $this->EE->load->dbforge(); 
		
		$this->EE->db->select('module_id'); 
        $query = $this->EE->db->get_where('modules', array('module_name' => 'Bookmarks')); 
        
        $this->EE->db->where('module_id', $query->row('module_id')); 
        $this->EE->db->delete('module_member_groups'); 
        
        $this->EE->db->where('module_name', 'Bookmarks'); 
        $this->EE->db->delete('modules'); 
        
        $this->EE->db->where('class', 'Bookmarks'); 
        $this->EE->db->delete('actions'); 
        
        $this->EE->dbforge->drop_table('bookmarks');
        
        return TRUE; 
    } 
    
    function update($current='') 
	{ 
        if ($current < 2.0) 
		{ 
            // Do your 2.0 version update queries 
        } 
        return TRUE; 
    } 
	

}
/* END */
?>