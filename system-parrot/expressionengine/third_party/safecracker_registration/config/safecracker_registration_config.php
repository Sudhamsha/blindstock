<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*------------------------------------------
 *	Version
/* -------------------------------------- */

$config['safecracker_registration_version'] = '1.2.1';

if(!defined('SAFECRACKER_REGISTRATION_VERSION'))
{	
	define('SAFECRACKER_REGISTRATION_VERSION', $config['safecracker_registration_version']);
}


/*------------------------------------------
 *	Respect Safecracker Permissions
/* -------------------------------------- */

$config['safecracker_registration_respect_permissions'] = FALSE;


/*------------------------------------------
 *	Default encryption key if doesn't exist
/* -------------------------------------- */

$config['safecracker_registration_default_key'] = 'x8[tTWz%Zc\'1.+fXS^&r%[=gU7inv&?k!RTK5KS!bMmVfvtuUQ/7KDAyl2W|2:$';