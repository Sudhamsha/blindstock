<?php

/**
* Low Alphabet config file
*
* @package         low_alphabet
* @author          Lodewijk Schutte ~ Low <hi@gotolow.com>
* @copyright       Copyright (c) 2011-2014, Lodewijk Schutte
* @link            http://gotolow.com/addons/low-alphabet
*/

if ( ! defined('LOW_ALPHABET_NAME'))
{
	define('LOW_ALPHABET_NAME',          'Low Alphabet');
	define('LOW_ALPHABET_PACKAGE',       'low_alphabet');
	define('LOW_ALPHABET_VERSION',       '1.2.2');
	define('LOW_ALPHABET_DOCS',          'http://gotolow.com/addons/low-alphabet');
	define('LOW_ALPHABET_DEFAULT_FIELD', 'title');
	define('LOW_ALPHABET_NUMBER_URL',    '0-9');
}

/**
 * < EE 2.6.0 backward compat
 */
if ( ! function_exists('ee'))
{
	function ee()
	{
		static $EE;
		if ( ! $EE) $EE = get_instance();
		return $EE;
	}
}

/**
 * NSM Addon Updater
 */
$config['name']    = LOW_ALPHABET_NAME;
$config['version'] = LOW_ALPHABET_VERSION;
$config['nsm_addon_updater']['versions_xml'] = LOW_ALPHABET_DOCS.'/feed';
