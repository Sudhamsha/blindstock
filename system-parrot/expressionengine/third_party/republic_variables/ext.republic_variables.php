<?php
if (! defined('APP_VER')) {
    exit('No direct script access allowed');
}
/*

                                                                        __/---\__
                                         ,___     ___  /___o--\  \
                                            \_ o---/ _/          )--)
                                                \-----/           ______
                                                                                    |    |
                                                                                    |    |
                                        ---_    ---_    ---_  |    |
                                        |   \__ |   \__ |   \__    |
                                        |      \__     \__     \__ o
                                        |         `       `      \__
                                        |                          |
                                        |                          |
                                        |__________________________|

                                        | ) |_´ | ) | | |_) |  | / '
                                        | \ |_, |´  \_/ |_) |_,| \_,
                                                        F A C T O R Y

Republic Variables made by Republic Factory AB <http://www.republic.se> and is
licensed under a Creative Commons Attribution-NoDerivs 3.0 Unported License
<http://creativecommons.org/licenses/by-nd/3.0/>.

You can use it for free, both in personal and commercial projects as long as
this attribution in left intact. But, by downloading this add-on you also take
full responsibility for anything that happens while using it. The add-on is
made with love and passion, and is used by us on daily basis, but we cannot
guarantee that it works equally well for you.

See Republic Labs site <http://republiclabs.com> for more information.

*/


require_once PATH_THIRD.'republic_variables/config.php';

/**
 * Republic Variables Extension Class
 *
 * @package   Republic Variables
 * @author    Ragnar Frosti Frostason <ragnar@republic.se> - Republic Factory
 * @link      http://www.republic.se
 */
class Republic_variables_ext
{

    public $name           = 'Republic Variables';
    public $version        = REPUBLIC_VARIABLES_VERSION;
    public $description    = '';
    public $settings_exist = 'n';
    public $docs_url       = REPUBLIC_VARIABLES_DOCS;
    public $settings       = array();
    public $required_by    = array('Module');


    public function Republic_variables_ext($settings = '')
    {
        $this->__construct($settings);
    }

    /**
     * Extension Constructor
     */
    public function __construct($settings = '')
    {
        $this->settings = $settings;

        if (! isset(ee()->session->cache['republic_variables'])) {
            ee()->session->cache['republic_variables'] = array();
        }
        $this->cache =& ee()->session->cache['republic_variables'];

        ee()->load->model('republic_variables_model');
    }

    // --------------------------------------------------------------------

    /**
     * Activate Extension
     */
    public function activate_extension()
    {
        $hooks = array('sessions_start', 'template_post_parse');

        foreach ($hooks as $hook) {
            ee()->db->insert(
                'extensions',
                array(
                    'class'    => __CLASS__,
                    'hook'     => $hook,
                    'method'   => $hook,
                    'settings' => '',
                    'priority' => 10,
                    'version'  => $this->version,
                    'enabled'  => 'y'
                )
            );
        }

    }

    /**
     * Update Extension
     */
    public function update_extension($current = '')
    {
        if ($current === '' or $current === $this->version) {
            return false;
        }

        if (version_compare($current, '1.6.5', '<')) {
            ee()->db->insert(
                'extensions',
                array(
                    'class'    => __CLASS__,
                    'hook'     => 'template_post_parse',
                    'method'   => 'template_post_parse',
                    'settings' => '',
                    'priority' => 10,
                    'version'  => $this->version,
                    'enabled'  => 'y'
                )
            );
        }

        ee()->db->update('extensions', array('version' => $this->version), array('class' => __CLASS__));
    }

    /**
     * Disable Extension
     */
    public function disable_extension()
    {
        ee()->db->delete('extensions', array('class' => __CLASS__));
    }

    public function sessions_start($str)
    {
        if (ee()->input->get('D') === 'cp') {
            return;
        }

        $this->settings = ee()->republic_variables_model->get_configurations();

        $this->pre_parse_variables();
        $this->replace_empty_variables();
    }

    public function pre_parse_variables()
    {
        $variables = ee()->republic_variables_model->get_all_variables_to_pre_parse();

        if (empty($variables)) {
            return;
        }

        foreach ($variables as $variable) {
            $variable = ee()->republic_variables_model->check_for_template($variable);

            // Get all global variables
            $global_variables = array();
            foreach (ee()->config->_global_vars as $key => $global_variable) {
                $global_variables[LD . $key . RD] = $global_variable;
            }

            ee()->config->_global_vars[$variable['variable_name']] = str_replace(array_keys($global_variables), array_values($global_variables), $variable['variable_data']);
        }
    }

    // Alt template_fetch_template
    public function template_post_parse($final_template, $sub, $site_id)
    {

        if (isset(ee()->extensions->last_call) && ee()->extensions->last_call) {
            $final_template = ee()->extensions->last_call;
        }

        $variables = ee()->republic_variables_model->get_all_variables_files_post();

        if (! empty($variables)) {
            foreach ($variables as $variable) {
                $variable = ee()->republic_variables_model->check_for_template($variable);
                $final_template = str_replace(LD . $variable['variable_name'] . RD, $variable['variable_data'], $final_template);
            }
        }

        return $final_template;
    }

    public function replace_empty_variables()
    {
        // Return if there is no default language or if the default language should not be used
        if (empty($this->settings['default_language']) || (isset($this->settings['use_default_language_on_empty']) && $this->settings['use_default_language_on_empty'] !== "y")) {
            return;
        }

        // Get all empty Variables
        $empty_vars = ee()->republic_variables_model->get_all_empty_variables();

        if (empty($empty_vars)) {
            return;
        }

        $default_lang        = ee()->republic_variables_model->get_default_lang($this->settings['default_language']);
        $default_lang_values = ee()->republic_variables_model->get_default_lang_values($default_lang);

        foreach ($empty_vars as $variable) {
            if ($variable['variable_language_parent'] !== 0) {
                ee()->config->_global_vars[$variable['variable_name']] = isset($default_lang_values[$variable['variable_language_parent']]) ? $default_lang_values[$variable['variable_language_parent']] : "";
            }
        }
    }
}
// END CLASS

/* End of file ext.republic_variables.php */
