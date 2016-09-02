<?php

if (!defined('ZOO_VISITOR_NAME'))
{
	define('ZOO_VISITOR_NAME', 'Zoo Visitor');
	define('ZOO_VISITOR_CLASS', 'Zoo_visitor');
	define('ZOO_VISITOR_VER', '1.3.32');
	define('ZOO_VISITOR_DESC', 'Zoo Visitor sets your members free, use any fieldtype in member profiles and allows you to use member templates anywhere you want');
	define('ZOO_VISITOR_DOCS', 'http://ee-zoo.com/add-ons/visitor/');
	define('ZOO_VISITOR_UPD', 'http://ee-zoo.com/add-ons/visitor/releasenotes.rss');
	define('ZOO_VISITOR_AUTHOR', 'Nico De Gols | EE-Zoo.com');
	
}

// NSM Addon Updater
$config['name'] = ZOO_VISITOR_NAME;
$config['version'] = ZOO_VISITOR_VER;
$config['nsm_addon_updater']['versions_xml'] = ZOO_VISITOR_UPD;