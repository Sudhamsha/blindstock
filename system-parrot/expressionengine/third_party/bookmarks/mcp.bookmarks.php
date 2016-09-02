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
 File: mcp.bookmarks.php
-----------------------------------------------------
 Purpose: Lets people bookmark entries (and other data) for quick access
=====================================================
*/

if ( ! defined('BASEPATH'))
{
    exit('Invalid file request');
}

require_once PATH_THIRD.'bookmarks/config.php';

class Bookmarks_mcp {

    var $version = BOOKMARKS_ADDON_VERSION;
    
    var $settings = array();
    
    var $docs_url = "http://www.intoeetive.com/docs/bookmarks.html";
    
    function __construct() { 
        // Make a local reference to the ExpressionEngine super object 
        $this->EE =& get_instance(); 
    } 
    
    function index()
    {
  
    }


}
/* END */
?>