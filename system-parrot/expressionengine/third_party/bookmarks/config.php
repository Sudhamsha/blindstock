<?php

if ( ! defined('BOOKMARKS_ADDON_NAME'))
{
	define('BOOKMARKS_ADDON_NAME',         'Bookmarks');
	define('BOOKMARKS_ADDON_VERSION',      '0.2.3');
}

$config['name'] = BOOKMARKS_ADDON_NAME;
$config['version']= BOOKMARKS_ADDON_VERSION;

$config['nsm_addon_updater']['versions_xml']='http://www.intoeetive.com/index.php/update.rss/99';