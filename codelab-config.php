<?php

/**
 * 
 * @version 1.1
 * @author Abban Dunne abban@webtogether.ie
 * @author  Paul Redmond paul.c.redmond@gmail.com
 * @license  MIT
 * 
 */

/**
 * Custom Environments
 * 
 * Checks the $_SERVER array and creates different environments
 * 
 */

if(!class_exists('Custom_Environments')){
    class Custom_Environments{

        protected $environment;
        protected $environments;
        public $server_name;
        public $site_url;
        public $basepath;
        public $system_folder;

        
        function __construct(){
            $this->server_name = $_SERVER['SERVER_NAME'];
            if (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off'
                || $_SERVER['SERVER_PORT'] == 443) {
                
                $this->site_url = 'https://' .$this->server_name."/blinds/";

            } else {
                $this->site_url = 'http://' .$this->server_name."/blinds/";
            }
            $this->basepath = dirname(__FILE__);
            $this->system_folder = 'system';

            // Add your environments here, defaults to production
            // If you change this don't forget to add the environment
            // to the config and database classes
            
            $this->environments = array(
                'local'       => 'localhost',
                'development' => 'localhost.',
                'staging'     => 'staging.',
                'preview'     => 'preview.',
                'mobile'      => 'm.',
            );

            $this->environment = 'local';

            foreach($this->environments AS $key => $env){
                if(is_array($env)){
                    foreach ($env as $option){
                        if(strstr($this->server_name, $option)){
                            $this->environment = $key;
                            break 2;
                        }
                    }
                }else{
                    if(strstr($this->server_name, $env)){
                        $this->environment = $key;
                        break;
                    }
                }
            }
        }

        /**
         * Get Environment
         * 
         * Returns the current environment
         * 
         * @return string
         */
        function get_environment(){
            return $this->environment;
        }
    }
}

/**
 * Custom Config
 * 
 * Sets the configuration details depending on the environment 
 * 
 */
if(!class_exists('Custom_Config')){
    class Custom_Config extends Custom_Environments{

        private $default_config = array();
        private $env_config = array();
        private $upload_paths = array();
        private $global_vars = array();
        private $env_global_vars = array();

        function __construct(){
            parent::__construct();
            $this->set_default_config();
            $this->set_upload_paths();
            $this->set_env_config();
            $this->set_global_vars();
            $this->cookie_check();
        }

        /**
         * Set Default Config
         * 
         * This sets up the default configuration on the site that will be used
         * unless overridden in the env_config.
         * 
         */
        function set_default_config(){

            $this->default_config = array(
                'is_system_on'                => 'y',
                'license_number'              => '7830-0212-5549-6938',
                'site_index'                  => '',
                'admin_session_type'          => 'cs',
                'new_version_check'           => 'y',
                'doc_url'                     => 'http://expressionengine.com/user_guide/',
                'site_url'                    => $this->site_url,
                'cp_url'                      => $this->site_url.'/'.$this->system_folder.'/index.php',
                
                // Set this so we can use query strings
//                 'uri_protocol'                => 'PATH_INFO',
                
                // Datbase preferences
                'db_debug'                    => 'n',
                'pconnect'                    => 'n',
                'enable_db_caching'           => 'n',
                
                // Site preferences
                // Some of these preferences might actually need to be set in the index.php files.
                // Not sure which ones yet, I'll figure that out when I have my first MSM site.
                'is_site_on'                  => 'y',
                //'site_404'                    => '404-not-found',
                'webmaster_email'             => 'sudhamshareddy@gmail.com',
                'webmaster_name'              => 'Blinds',
                
                // Localization preferences
                'server_timezone'             => 'UTC',
                'server_offset'               => 0,
                'time_format'                 => 'eu',
                'daylight_savings'            => 'y',
                'honor_entry_dst'             => 'y',
                
                // Channel preferences
                'use_category_name'           => 'y',
                'word_separator'              => 'dash',
                'reserved_category_word'      => 'category',
                
                // Template preferences
                'strict_urls'                 => 'y',
                'save_tmpl_files'             => 'y',
                'save_tmpl_revisions'         => 'y',
                'tmpl_file_basepath'          => $this->basepath .'/templates/',
                
                // Theme preferences
                'theme_folder_path'           => $this->basepath .'/themes/',
                'theme_folder_url'            => $this->site_url .'/themes/',
                
                // Tracking preferences
                'enable_online_user_tracking' => 'n',
                'dynamic_tracking_disabling'  => '500',
                'enable_hit_tracking'         => 'n',
                'enable_entry_view_tracking'  => 'n',
                'log_referrers'               => 'n',
                
                // Member preferences
                'allow_registration'          => 'n',
                'profile_trigger'             => '--sdjhkj2lffgrerfvmdkndkfisolmfmsd' .time(),
                
                'prv_msg_upload_path'         => $this->basepath .'/uploads/member/pm_attachments',
                'enable_emoticons'            => 'n',
                
                'enable_avatars'              => 'n',
                'avatar_path'                 => $this->basepath .'/uploads/member/avatars/',
                'avatar_url'                  => $this->site_url .'/uploads/member/avatars/',
                'avatar_max_height'           => 100,
                'avatar_max_width'            => 100,
                'avatar_max_kb'               => 100,
                
                'enable_photos'               => 'n',
                'photo_path'                  => $this->basepath .'/uploads/member/photos/',
                'photo_url'                   => $this->site_url .'/uploads/member/photos/',
                'photo_max_height'            => 200,
                'photo_max_width'             => 200,
                'photo_max_kb'                => 200,
                
                'sig_allow_img_upload'        => 'n',
                'sig_img_path'                => $this->basepath .'/uploads/member/signature_attachments/',
                'sig_img_url'                 => $this->site_url . '/uploads/member/signature_attachments/',
                'sig_img_max_height'          => 80,
                'sig_img_max_width'           => 480,
                'sig_img_max_kb'              => 30,
                'sig_maxlength'               => 500,
                
                'captcha_font'                => 'y',
                'captcha_rand'                => 'y',
                'captcha_require_members'     => 'n',
                'captcha_path'                => $this->basepath . '/'.$this->system_folder.'/images/captchas/',
                'captcha_url'                 => $this->site_url.'/'.$this->system_folder.'/images/captchas/',
                
                // Encryption / Session key
                'encryption_key'              => 'blindsENC',
                
                // NSM htaccess Generator
                'nsm_htaccess_generator_path' => array($this->basepath . "/.htaccess"),
                
                // minimee preferences
                'minimee_cache_path'          => $this->basepath .'/assets/cache',
                'minimee_cache_url'           => '/assets/cache',
                
                // advanced preferences n or y
                'minimee_base_path'           => '',
                'minimee_base_url'            => '//www.it3sixty.com',
                'minimee_debug'               => 'n',
                'minimee_disable'             => 'y',
                'minimee_remote_mode'         => 'auto', // 'auto', 'curl' or 'fgc'
                'minimee_minify_html'         => 'n',

                //config for ed Image Resizer
                'ed_server_path'              => $this->basepath,
                'ed_cache_path'               => $this->basepath .'/images/cache/',

                'snippet_file_basepath'       => $this->basepath . '/snippets/',
            );
        }

        /**
         * Set Upload Paths
         * 
         * Sets up the default upload paths. Can be overridden in the env config.
         * 
         */
        function set_upload_paths(){
            $this->upload_paths['upload_preferences'] = array(
                1 => array(
                    'name'          => 'Blinds [' .$this->environment .']',
                    'server_path'   => $this->basepath .'/uploads/',
                    'url'           => $this->site_url .'/uploads/'
                ),
                2 => array(
                    'name'          => 'Blinds Blog [' .$this->environment .']',
                    'server_path'   => $this->basepath .'/uploads/blog/',
                    'url'           => $this->site_url .'/uploads/blog/'
                ),
                3 => array(
                    'name'          => 'Blinds Products [' .$this->environment .']',
                    'server_path'   => $this->basepath .'/uploads/products/',
                    'url'           => $this->site_url .'/uploads/products/'
                )  
            );
        }

        /**
         * Set Env Config
         * 
         * This sets up the custom options for the different environments
         * You can override the default config in here.
         * 
         * @param string $env
         */
        function set_env_config($env = ''){

            if(!$env) $env = $this->environment;

            switch ($env) {
                case 'production':
                    $this->env_config = array(
                        'minimee_disable'           => 'n',
                        'minimee_minify_html'       => 'y',
                    );
                    break;

                case 'local':
                    $this->env_config = array(
                        'webmaster_email'           => 'sudhamshareddy@gmail.com',
                        'webmaster_name'            => 'Sud',
                        'tmpl_file_basepath'        => $this->basepath .'/templates/',
                        'minimee_disable'           => 'n',
                        'minimee_minify_html'       => 'n',
                    );

                    $this->env_global_vars = array(
                        'global:assets_url'         => $this->site_url .'/assets',
                        'global:webmaster_name'     => 'Sud',
                    );
                    break;

                case 'development':
                case 'staging':
                case 'preview':
                case 'mobile':
                    break;
            }

        }

        /**
         * Set Global Vars
         * 
         * Sets up default global variables that can then be used in the theme
         * 
         */
        function set_global_vars(){
            $this->global_vars = array(
                'global:env'                         => $this->environment,
                'global:param_disable_default'       => 'disable="categories|pagination|member_data"',
                'global:param_disable_all'           => 'disable="categories|custom_fields|member_data|pagination"',
                'global:param_cache_param'           => 'cache="yes" refresh="10"',
                '-global:param_cache_param'          => '-cache="yes" refresh="10"', //-global with dash disables
                'global:date_time'                   => '%g:%i %a',
                'global:date_short'                  => '%F %d, %Y',
                'global:date_full'                   => '%F %d %Y, %g:%i %a',
                'global:theme_url'                   => $this->site_url .'/themes/site_themes/default',
                'global:assets_url'                  => $this->site_url .'/assets',
                'global:cm_subscriber_list_slug'     => false,
                'global:google_analytics_key'        => false,
                'global:nsm_gravatar_default_avatar' => $this->site_url .'/uploads/member/avatars/default.png',
                //'global:404_entry_id'                => '184',
                'global:webmaster_name'              => 'Webmaster',
                'global:remote_ip'                   => $_SERVER['REMOTE_ADDR'],
            );
            $this->assign_global_vars();
        }

        /**
         * Assign Global Vars
         * 
         * Assigns our global vars and adds any environment specific ones
         * 
         */
        function assign_global_vars(){
            global $assign_to_config;

            if(!isset($assign_to_config['global_vars'])) $assign_to_config['global_vars'] = array();

            $assign_to_config['global_vars'] = array_merge($assign_to_config['global_vars'], $this->global_vars, $this->env_global_vars);
            
        }

        /**
         * Set Environment Debug
         * 
         * Turns on PHP error reporting on local and development environments
         * 
         * @param int $env
         */
        function set_environment_debug($env = ''){

            if(!$env) $env = $this->environment;

            return ($env == 'local');

        }

        /**
         * Get Environment Config
         * 
         * Updates the config depending on the environment
         * 
         * @param  array $config Current config array
         * @return array New config array
         */
        function get_environment_config($config){

            return array_merge($config, $this->default_config, $this->upload_paths, $this->env_config);

        }

        /**
         * define_nsm_env_constant
         * 
         * This method is deprecated as the NSM_ENV constant is currently
         * being used in various places in the theme I recommend using the
         * {global:env} variable to handle it instead - Ab.
         * 
         * @return constant
         */
        function define_nsm_env_constant(){

            foreach($this->environments AS $key => $env){

                if(is_array($env)){

                    foreach ($env as $option){
                        
                        if(strstr($this->server_name, $option)  && !defined('NSM_ENV')){
                            define('NSM_ENV', $key);
                            break 2;
                        }

                    }

                }else{

                    if(strstr($this->server_name, $env) && !defined('NSM_ENV')) define('NSM_ENV', $key);

                }

            }

        }

        /**
         * Cookie Check
         * 
         * Checks for a preview cookie on dev sites to keep snoopers away
         * if ?preview is set then set the cookie
         * 
         */
        function cookie_check($env = ''){

            
        }
    }
}

/**
 * Custom Database
 * 
 * Sets the database details depending on the environment 
 * 
 */
if(!class_exists('Custom_Database')){
    class Custom_Database extends Custom_Environments{
        private $db_config;

        function __construct(){
            parent::__construct();
            $this->set_db();
        }

        /**
         * Set DB
         * 
         * Sets the database details depending on the environment
         * 
         * @param string $env
         */
        function set_db($env = false){

            if(!$env) $env = $this->environment;


            switch ($env) {
                case 'production':
                     $this->db_config = array(
                        'hostname' => 'localhost',
                        'username' => 'root',
                        'password' => 'root',
                        'database' => 'blinds',
                    );
                    break;

                case 'local':
                    $this->db_config = array(
                        'hostname' => 'localhost',
                        'username' => 'root',
                        'password' => 'root',
                        'database' => 'blinds',
                    );
                    break;

                case 'development':
                    $this->db_config = array(
                        'hostname' => 'localhost',
                        'username' => 'root',
                        'password' => 'root',
                        'database' => 'blinds',
                    );
                    break;

                case 'staging':
                case 'preview':
                	$this->db_config = array(
                        'hostname' => 'localhost',
                        'username' => 'root',
                        'password' => 'root',
                        'database' => 'blinds',
                    );
                case 'mobile':
                    $this->db_config = array(
                        'hostname' => 'localhost',
                        'username' => 'root',
                        'password' => 'root',
                        'database' => 'blinds',
                    );
                    break;
            }
        }

        /**
         * Get Environment DB
         * 
         * Returns the current environment DB details
         * 
         * @param  array $db Current database details
         * @return array New database details
         */
        function get_environment_db($db){
            $default_db = array("cachedir" => APPPATH . "cache/db_cache/");
            return array_merge($db, $default_db, $this->db_config);
        }
    }
}

// Declare global variable to allow our objects to be used across the site
global $Custom_db, $Custom_config;

// Create the config and a DB objects
$Custom_config = new Custom_Config();
$Custom_db = new Custom_Database();

//Define the NSM_ENV constant for backwards compatibility
$Custom_config->define_nsm_env_constant();

//Turn on debugging for local and development environments
$debug = $Custom_config->set_environment_debug();
