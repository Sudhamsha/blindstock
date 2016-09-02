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
* Republic Variables MCP
*
* @package   Republic Variables
* @author    Ragnar Frosti Frostason <ragnar@republic.se> - Republic Factory
* @link      http://www.republic.se
*/

class Republic_variables_mcp
{

        // --------------------------------------------------------------------
        /**
        * PHP4 Constructor
        *
        * @see  __construct()
        */
    public function Republic_variables_mcp()
    {
        $this->__construct();
    }

    // --------------------------------------------------------------------

    /**
    * PHP 5 Constructor
    *
    * @return void
    */
    public function __construct()
    {
        // Republic variable theme folder
        $this->theme_url = ee()->config->item('theme_folder_url') . 'third_party/';
        if (defined('URL_THIRD_THEMES')) {
            $this->theme_url = URL_THIRD_THEMES;
        }

        // Add css+javascript for the module
        ee()->cp->add_to_head('<link rel="stylesheet" href="'.$this->theme_url.'republic_variables/css/republic_variables.css" type="text/css" media="screen" />');
        ee()->cp->add_to_head('<!--[if lt IE 8]><style>.expandingArea {position: static !important;}</style><![endif]-->');


        // module url
        $this->module_url = $this->data['mod_url'] = 'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=republic_variables';

        $this->add_global_javascript();

        ee()->load->model('republic_variables_model');
    }

    // --------------------------------------------------------------------

    /**
    * Home page for module, lists all variables
    *
    * @return View
    */
    public function index()
    {
        // View variables
        $this->get_settings();
        $this->get_languages();

        if ($this->settings['auto_sync_global_vars'] === 'y') {
            ee()->republic_variables_model->sync_global_vars();
        }

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_variables');

        ee()->cp->set_breadcrumb(BASE . AMP . $this->module_url, ee()->lang->line('republic_variables_module_name'));

        ee()->load->library('javascript');
        ee()->cp->load_package_js('index');


        if ($this->has_access()) {
            ee()->cp->load_package_js('index_access');
        }

        $vars['groups_and_variables']     = ee()->republic_variables_model->get_groups_and_variables();
        $vars['variables']                = ee()->republic_variables_model->get_groupless_variables();
        $vars['groups']                   = ee()->republic_variables_model->get_empty_groups($vars['groups_and_variables']);
        $vars['module_url']               = $this->module_url;
        $vars['languages']                = $this->languages;
        $vars['settings']                 = $this->settings;
        $vars['ok_icon']                  = $this->theme_url.'republic_variables/images/ok.png';
        $vars['not_ok_icon']              = $this->theme_url.'republic_variables/images/cancel.png';
        $vars['module_access']            = $this->has_access();
        $vars['variable_edit_action_url'] = BASE . AMP . $this->module_url . AMP . 'method=update_variable' . AMP . 'variable_id=';

        return $this->_render('index', $vars);
    }

    /**
    * List all configurations for module
    *
    * @return void
    */
    public function configurations()
    {
        // Check for member group accessability
        if (ee()->session->userdata['group_id'] !== "1" && $this->settings['group_access'] === 'admin') {
            ee()->functions->redirect($this->module_url);
        }

        $this->get_settings();

        ee()->load->library('javascript');
        ee()->cp->load_package_js('configurations');

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_configurations');
        ee()->cp->set_breadcrumb(BASE . AMP . $this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url']             = $this->module_url . AMP . 'method=configurations';
        $vars['is_extension_installed'] = ee()->republic_variables_model->is_extension_installed();
        $vars['languages']              = $this->get_select_languages();
        $vars['member_groups']          = ee()->republic_variables_model->get_member_groups_select();
        $vars['settings']               = $this->settings;
        $vars['action_url']             = $this->module_url.AMP.'method=configurations';
        $vars['template_group_path']    = reduce_double_slashes(ee()->config->item('tmpl_file_basepath') . '/' . ee()->config->item('site_short_name') . '/' . ee()->config->item('hidden_template_indicator'));
        $vars['variables_sync_url']     = BASE.AMP.$this->module_url.AMP.'method=variable_sync_to_db';


        // Update configuration on submit
        if (ee()->input->post('submit')) {
            ee()->republic_variables_model->update_configurations();
            ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_language_added'));
            ee()->functions->redirect(BASE.AMP.$vars['action_url']);
        }

        return $this->_render('configurations', $vars, array('Import' => BASE.AMP.$this->module_url.AMP.'method=import_gvs'));
    }


    public function variable_sync_to_db()
    {
        $this->get_settings();

        if ($this->settings['allow_to_save_to_files'] !== 'y') {
            ee()->session->set_flashdata('message_failure', ee()->lang->line('republic_variables_save_to_files_not_allowed'));
            ee()->functions->redirect(BASE . AMP . $this->module_url . AMP . 'method=configurations');
        }

        $variable_folder_path = reduce_double_slashes(ee()->config->item('tmpl_file_basepath') . '/' . ee()->config->item('site_short_name') . '/' . ee()->config->item('hidden_template_indicator') . $this->settings['template_group_name'] . '.group');

        $counter = 0;
        $deleted = array();
        $success_message = '';

        if (is_dir($variable_folder_path)) {
            if ($handle = opendir($variable_folder_path)) {
                while (false !== ($file = readdir($handle))) {
                    if ($file !== ".DS_Store" && $file !== "." && $file !== ".." && $file !== 'index.html') {
                        $variable_data = file_get_contents($variable_folder_path . '/' . $file);

                        if ($variable_data !== false) {
                            $variable_name = str_replace('.html', '', $file);

                            $result = ee()->republic_variables_model->update_variable_value($variable_name, $variable_data);

                            // If the variable should not be saved to file, delete the file
                            if ($result === false) {
                                unlink($variable_folder_path . '/' . $file);
                                $deleted[] = $file;
                            } elseif ($result > 0) {
                                $counter++;
                            }
                        }
                    }
                }
            }
            closedir($handle);

            if ($counter > 0) {
                $success_message[] = $counter . ' ' . ee()->lang->line('republic_variables_files_synced');
            } else {
                $success_message[] = ee()->lang->line('republic_variables_no_files_synced');
            }

            if (! empty($deleted)) {
                $success_message[] = ee()->lang->line('republic_variables_deleted_filed') . '<br />' . implode(', ', $deleted);
            }

            ee()->session->set_flashdata('message_success', implode('<br />', $success_message));
        } else {
            $success_message[] = ee()->lang->line('republic_variables_folder_does_not_exist');
            ee()->session->set_flashdata('message_failure', implode('<br />', $success_message));
        }

        ee()->functions->redirect(BASE . AMP . $this->module_url . AMP . 'method=configurations');
    }

    /**
    * Import global variables from current site and/or republic variables from other MSM sites
    *
    * @return void
    */
    public function import_gvs()
    {
        ee()->cp->load_package_js('import');

        // Check for member group accessability
        $vars['global_variables']   = ee()->republic_variables_model->get_all_gvs();
        $vars['republic_variables'] = ee()->republic_variables_model->get_all_rvs();
        $vars['sites']              = ee()->republic_variables_model->get_all_sites();

        $this->get_settings();

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_import');

        ee()->cp->set_breadcrumb(BASE . AMP . $this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url'] = $this->module_url.AMP.'method=import_gvs';

        // Update configuration on submit
        if (ee()->input->post('submit')) {
            ee()->republic_variables_model->import_variables(ee()->input->post('variables'));
            //ee()->republic_variables_model->update_configurations();
            ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variable_variable_imported'));
            ee()->functions->redirect(BASE.AMP.$vars['action_url']);
        }

        return $this->_render('import_gvs', $vars);
    }

    /***************************
    * VARIABLES
    ****************************/

    /**
    * Update an existing variable
    *
    * @return void
    */
    public function variable_action()
    {

        $this->get_settings();
        $this->get_languages();

        // Variable id
        $variable_id = ee()->input->get('id');

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');
        ee()->load->library('javascript');
        ee()->cp->load_package_js('variables');

        $vars['message_error'] = ee()->session->flashdata('write_error');

        // Title tag + breadcrumb
        if (empty($variable_id)) {
            $this->_cp_title('republic_variables_variable_add');
        } else {
            $this->_cp_title('republic_variables_variable_edit');
        }

        ee()->cp->set_breadcrumb(BASE.AMP.$this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url']    = $this->module_url.AMP.'method=variable_action'.AMP.'id='.$variable_id;
        $vars['languages']     = $this->languages;
        $vars['groups']        = ee()->republic_variables_model->get_groups();
        $vars['settings']      = $this->settings;
        $vars['module_access'] = $this->has_access();

        // validate variable data on submit
        if (ee()->input->post('submit')) {
            // Load libraries
            ee()->load->library('form_validation');

            // Set validation rules
            ee()->form_validation->set_rules('variable_group_id', 'Variable group', 'trim');
            ee()->form_validation->set_rules('variable_name', lang('republic_variables_label_variable_name'), 'required|trim|callback_variable_name_check');
            ee()->form_validation->set_rules('variable_data', lang('republic_variables_label_variable_value'), 'trim');
            ee()->form_validation->set_rules('variable_description', lang('republic_variables_label_variable_description'), 'trim');
            ee()->form_validation->set_rules('variable_parse', lang('republic_variables_label_variable_description'), 'trim');

            if (sizeof($vars['languages']) > 0) {
                foreach ($vars['languages'] as $language) {
                    ee()->form_validation->set_rules('lang_'.$language['language_id'], $language['language_name'].' Value', 'trim');
                }
            }

            // Validate
            if (ee()->form_validation->run() === true) {

                $variable_data = ee()->input->post('variable_data');

                // Prepare variable data
                $new_data = array(
                    'variable_group_id'    => ee()->input->post('variable_group_id'),
                    'variable_name'        => ee()->input->post('variable_name'),
                    'variable_description' => ee()->input->post('variable_description'),
                    'variable_parse'       => ee()->input->post('variable_parse'),
                    'use_language'         => ee()->input->post('use_language'),
                    'save_to_file'         => ee()->input->post('save_to_file'),
                    'variable_data'        => $variable_data
                );

                $this->_add_to_file($new_data);

                // Prepare variable languages if exist
                if (sizeof($vars['languages']) > 0) {
                    $new_data['languages'] = array();
                    foreach ($vars['languages'] as $language) {
                        $variable_language = array(
                            'variable_group_id'  => ee()->input->post('variable_group_id'),
                            'variable_name'      => $language['language_prefix'].$new_data['variable_name'].$language['language_postfix'],
                            'variable_data'      => ee()->input->post('lang_'.$language['language_id']),
                            'variable_parse'     => ee()->input->post('variable_parse'),
                            'use_language'       => ee()->input->post('use_language'),
                            'save_to_file'       => ee()->input->post('save_to_file'),
                            'variable_language'  => $language['language_id']
                        );

                        $this->_add_to_file($variable_language);

                        $new_data['languages'][] = $variable_language;
                    }
                }

                if (empty($variable_id)) {
                    // Insert new variable
                    $variable_id = ee()->republic_variables_model->insert_variable($new_data);
                    ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variable_added'));
                } else {
                    // Update variable
                    ee()->republic_variables_model->update_variable($variable_id, $new_data);
                    ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variable_updated'));
                }

                ee()->functions->redirect(BASE.AMP.$this->module_url . AMP . 'method=variable_action' . AMP . 'id=' . $variable_id);
            } else {
                if (empty($variable_id)) {
                    $vars['message_error'] = ee()->lang->line('republic_variable_add_failed');
                } else {
                    $vars['message_error'] = ee()->lang->line('republic_variable_update_failed');
                }
            }
        }


        if (empty($variable_id)) {
            $vars['action_button'] = ee()->lang->line('republic_variables_add');
            // Prepare default variable data
            $variable_group_id = (ee()->input->get('group_id') !== "") ? ee()->input->get('group_id') : 0;
            $vars['variable'] = array(
                'variable_group_id'    => $variable_group_id,
                'variable_name'        => "",
                'variable_description' => "",
                'variable_parse'       => "",
                'use_language'         => "y",
                'save_to_file'         => "n",
                'variable_data'        => ""
            );

            foreach ($vars['languages'] as $language) {
                $vars['variable']['lang_'.$language['language_id']] = "";
            }
        } else {
            $vars['action_button'] = ee()->lang->line('republic_variables_update');
            $vars['variable']      = ee()->republic_variables_model->get_variable($variable_id);
        }

        return $this->_render('variable', $vars);
    }

    public function _add_to_file($variable)
    {
        if ($this->settings['allow_to_save_to_files'] === 'y' && $variable['save_to_file'] === 'y') {
            if (isset($variable['variable_language']) && $variable['use_language'] === 'n') {
                return;
            }

            if (! isset($variable['variable_language']) && $this->settings['show_default_variable_value'] === 'n' && $variable['use_language'] === 'y') {
                return;
            }

            $site_template_folder = ee()->config->item('tmpl_file_basepath') . '/' . ee()->config->item('site_short_name');
            $variable_folder_path = reduce_double_slashes($site_template_folder . '/' . ee()->config->item('hidden_template_indicator') . $this->settings['template_group_name'] . '.group');
            $variable_path = $variable_folder_path . '/' . $variable['variable_name'] . '.html';

            if (! is_dir($variable_folder_path)) {
                if (! mkdir($variable_folder_path)) {
                    ee()->session->set_flashdata('write_error', ee()->lang->line('republic_variables_could_not_create_folder') . ' ' . $variable_folder_path . '/');
                    return;
                }
            }

            if (! is_dir($variable_folder_path)) {
                if (! is_writable($site_template_folder . '/')) {
                    ee()->session->set_flashdata('write_error', ee()->lang->line('republic_variables_template_folder_not_writable') . ' ' . $site_template_folder . '/');
                    return;
                }

                if (! mkdir($variable_folder_path)) {
                    ee()->session->set_flashdata('write_error', ee()->lang->line('republic_variables_could_not_create_folder') . ' ' . $variable_folder_path . '/');
                    return;
                }
            }

            if (! is_writable($variable_folder_path . '/')) {
                ee()->session->set_flashdata('write_error', ee()->lang->line('republic_variables_template_folder_not_writable') . ' ' . $variable_folder_path . '/');
                return;
            }

            file_put_contents($variable_path, $variable['variable_data']);
        }
    }

    /**
    * Delete a variable
    *
    * @return void
    */
    public function variable_delete()
    {
        $id = ee()->input->get('id');
        ee()->republic_variables_model->delete_variable($id);
        ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variable_deleted'));
        ee()->functions->redirect(BASE.AMP.$this->module_url);
    }



    /***************************
    * LANGUAGES
    ****************************/

    /**
    * Lists all languages/Update language
    *
    * @return Page
    */
    public function languages()
    {

        $this->get_settings();
        $this->get_languages();

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');
        ee()->load->library('javascript');
        ee()->cp->load_package_js('table_reorder');

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_languages');

        ee()->cp->set_breadcrumb(BASE.AMP.$this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url'] = $this->module_url.AMP.'method=languages'.AMP.'action=update';
        $vars['languages']  = $this->languages;
        $vars['module_url'] = $this->module_url;
        $vars['settings']   = $this->settings;
        // Validate updated languages on submit
        if (ee()->input->post('submit')) {
            ee()->load->library('form_validation');

            // Set validation rules
            foreach ($vars['languages'] as $language) {
                ee()->form_validation->set_rules('language_prefix[' . $language['language_id'] . ']', ee()->lang->line('republic_variables_label_language_prefix'), 'trim|callback_variable_pre_check');
                ee()->form_validation->set_rules('language_postfix[' . $language['language_id'] . ']', ee()->lang->line('republic_variables_label_language_postfix'), 'trim|callback_variable_post_check');
            }


            // Check if postfix is set
            $prefix_postfix_exist = true;
            $prefixes = ee()->input->post('language_prefix');
            $postfixes = ee()->input->post('language_postfix');
            foreach ($prefixes as $key => $value) {
                if ($prefixes[$key] == "" && $postfixes[$key] == "") {
                    $prefix_postfix_exist = false;
                    $vars['message_error'][] = ee()->lang->line('republic_variables_language_prefix_postfix_required');
                }
            }

            // Check for uniqueness of prefix/postfix
            $duplicate_prefixes = false;
            $temp = ee()->input->post('language_prefix');

            foreach (ee()->input->post('language_prefix') as $key => $prefix) {
                unset($temp[$key]);
                if ($prefix !== "" && in_array($prefix, $temp)) {
                    $vars['message_error'][] = ee()->lang->line('republic_variables_language_prefix_duplicate');
                    $duplicate_prefixes = true;
                }
            }

            unset($prefix);

            // Check for uniqueness of prefix/postfix
            $duplicate_postfixes = false;
            $temp = ee()->input->post('language_postfix');

            foreach (ee()->input->post('language_postfix') as $key => $postfix) {
                unset($temp[$key]);
                if ($postfix !== "" && in_array($postfix, $temp)) {
                    $duplicate_prefixes = true;
                    $vars['message_error'][] = ee()->lang->line('republic_variables_language_postfix_duplicate');
                }
            }
            unset($postfix);

            // Validate
            if (ee()->form_validation->run() === true && $prefix_postfix_exist && ! $duplicate_prefixes && ! $duplicate_postfixes) {
                $prefixes  = ($this->settings['show_language_prefix'] === 'y') ? ee()->input->post('language_prefix') : null;
                $postfixes = ($this->settings['show_language_postfix'] === 'y') ? ee()->input->post('language_postfix') : null;

                // Update
                ee()->republic_variables_model->update_default_language(ee()->input->post('default_language'));
                ee()->republic_variables_model->update_languages(
                    ee()->input->post('language_id'),
                    $prefixes,
                    $postfixes,
                    ee()->input->post('old_prefix'),
                    ee()->input->post('old_postfix'),
                    ee()->input->post('language_direction')
                );

                ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_language_updated'));
                ee()->functions->redirect(BASE.AMP.$this->module_url.AMP.'method=languages');
            } else {
                $vars['message_error'][] = ee()->lang->line('republic_variables_language_update_failed');
            }
        }

        return $this->_render('languages', $vars);
    }

    /**
    * Add a new language to the variables
    *
    * @return Page
    */
    public function language_add()
    {

        $this->get_settings();
        $this->get_languages();

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_language_add');

        ee()->cp->set_breadcrumb(BASE.AMP.$this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url'] = $this->module_url.AMP.'method=language_add';
        $vars['settings'] = $this->settings;
        $vars['action'] = ee()->lang->line('republic_variables_add');

        // Add new language on submit
        if (ee()->input->post('submit')) {

            // Load libraries
            ee()->load->library('form_validation');

            // Set validation rules
            ee()->form_validation->set_rules('language_name', ee()->lang->line('republic_variables_label_language_name_text'), 'required|trim');
            ee()->form_validation->set_rules('language_prefix', ee()->lang->line('republic_variables_label_language_prefix'), 'trim|callback_variable_pre_check');
            ee()->form_validation->set_rules('language_postfix', ee()->lang->line('republic_variables_label_language_postfix'), 'trim|callback_variable_post_check');
            ee()->form_validation->set_rules('language_direction', ee()->lang->line('republic_variables_label_language_direction'), 'trim');

            // Check for postfix/prefix uniqueness
            $prefix_postfix_exist = true;
            if (! ee()->input->post('language_prefix') && ! ee()->input->post('language_postfix')) {
                $prefix_postfix_exist = false;
                $vars['message_error'][] = ee()->lang->line('republic_variables_language_prefix_postfix_required');
            }
            // Validate
            if (ee()->form_validation->run() === true && $prefix_postfix_exist) {
                $language_id = ee()->republic_variables_model->insert_language();
                if (empty($this->settings['default_language'])) {
                    ee()->republic_variables_model->update_default_language($language_id);
                }
                ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_language_added'));
                ee()->functions->redirect(BASE.AMP.$this->module_url.AMP.'method=languages');
            } else {
                $vars['message_error'][] = ee()->lang->line('republic_variables_language_add_failed');
            }
        }

        return $this->_render('language_add', $vars);
    }

    /**
    * Delete a language
    *
    * @return void
    */
    public function language_delete()
    {
        $language_id = ee()->input->get('id');
        ee()->republic_variables_model->delete_language($language_id);
        $this->get_settings();

        // If this is the default language we need to update the default language
        if ($this->settings['default_language'] == $language_id) {
            $this->get_languages();
            if (empty($this->languages)) {
                ee()->republic_variables_model->update_default_language("");
            } else {
                $first_language = reset($this->languages);
                ee()->republic_variables_model->update_default_language($first_language['language_id']);
            }
        }

        ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_language_deleted'));
        ee()->functions->redirect(BASE.AMP.$this->module_url.AMP.'method=languages');
    }



    /***************************
    * GROUPS
    ****************************/

    /**
    * Lists all groups/Update group
    *
    * @return Page
    */
    public function groups()
    {

        $this->get_settings();

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');
        ee()->load->library('javascript');
        ee()->cp->load_package_js('table_reorder');

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_groups');

        ee()->cp->set_breadcrumb(BASE.AMP.$this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url'] = $this->module_url.AMP.'method=groups'.AMP.'action=update';
        $vars['groups']  = ee()->republic_variables_model->get_groups();
        $vars['module_url'] = $this->module_url;
        $vars['settings']   = $this->settings;
        $vars['member_groups']          = ee()->republic_variables_model->get_member_groups_select();

        // Validate updated languages on submit
        if (ee()->input->post('submit')) {
            ee()->load->library('form_validation');

            // Set validation rules
            foreach ($vars['groups'] as $group) {
                ee()->form_validation->set_rules('group_name[' . $group['group_id'] . ']', ee()->lang->line('republic_variables_label_group_name'), 'trim|required');
                ee()->form_validation->set_rules('group_access[' . $group['group_id'] . '][]', ee()->lang->line('republic_variables_admin_only'), 'trim');
            }

            // Validate
            if (ee()->form_validation->run() === true) {
                // Update
                ee()->republic_variables_model->update_groups(ee()->input->post('group_id'), ee()->input->post('group_name'), ee()->input->post('group_access'));

                ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_group_updated'));
                ee()->functions->redirect(BASE.AMP.$this->module_url.AMP.'method=groups');
            } else {
                $vars['message_error'] = ee()->lang->line('republic_variables_group_update_failed');
            }
        }

        return $this->_render('groups', $vars);
    }

    /**
    * Add new variable group
    *
    * @return void
    */
    public function group_add()
    {

        // Load libraries
        ee()->load->library('table');
        ee()->load->helper('form');

        // Title tag + breadcrumb
        $this->_cp_title('republic_variables_group_add');

        ee()->cp->set_breadcrumb(BASE.AMP.$this->module_url, ee()->lang->line('republic_variables_module_name'));

        // View variables
        $vars['action_url'] = $this->module_url.AMP.'method=group_add';
        $vars['member_groups']          = ee()->republic_variables_model->get_member_groups_select();

        // Add new parent on submit
        if (ee()->input->post('submit')) {
            ee()->load->library('form_validation');

            // Set validation rules
            ee()->form_validation->set_rules('new_group_name', ee()->lang->line('republic_variables_label_group_name'), 'required|trim');
            ee()->form_validation->set_rules('group_access[]', ee()->lang->line('republic_variables_admin_only'), 'trim');

            // Validate
            if (ee()->form_validation->run() === true) {
                ee()->republic_variables_model->insert_group();
                ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_group_added'));
                ee()->functions->redirect(BASE.AMP.$this->module_url.AMP.'method=groups');
            } else {
                $vars['message_error'] = ee()->lang->line('republic_variables_group_add_failed');
            }
        }

        return $this->_render('group_add', $vars);
    }

    public function group_delete()
    {
        ee()->republic_variables_model->delete_group(ee()->input->get('id'));
        ee()->session->set_flashdata('message_success', ee()->lang->line('republic_variables_group_deleted'));
        ee()->functions->redirect(BASE.AMP.$this->module_url.AMP.'method=groups');
    }


    /***************************
    * GLOBAL FUNCTIONS
    ****************************/

    // Add delete confirm message
    public function add_global_javascript()
    {
        $confirm_text = lang('republic_variables_delete_confirm');
        $js_lang =<<<EOJS
            $("a.delete").click(function(){
                var confirmDelete = confirm('{$confirm_text}');
                if (confirmDelete) {
                    return true;
                } else {
                    return false;
                }
            });
EOJS;
             ee()->cp->add_to_foot('<script type="text/javascript">'.$js_lang.'</script>');
    }

    // Get the module settings
    public function get_settings()
    {

        if (! empty($this->settings)) {
            return;
        }

        $this->settings = ee()->republic_variables_model->get_configurations();
    }

    // Check if the member has access to more restricted functionality of the module
    public function has_access()
    {
        $this->get_settings();
        if (! is_array($this->settings['group_access'])) {
            $this->settings['group_access'] = array();
        }
        return (ee()->session->userdata['group_id'] == '1' or in_array(ee()->session->userdata['group_id'], $this->settings['group_access'])) ? true : false;
    }

    /**
    * Prepare the languages for lists, puts the default language as the first one in the list
    *
    * @return array of languages
    */
    public function get_languages($changed = true)
    {
        if (! empty($this->languages)) {
            return;
        }

        $this->languages = ee()->republic_variables_model->get_languages();
    }

    // Get languages for select field
    public function get_select_languages()
    {
        $languages = ee()->republic_variables_model->get_languages();
        $prep_languages = array();
        foreach ($languages as $language) {
            $prep_languages[$language['language_id']] = $language['language_name'];
        }

        return $prep_languages;
    }



    /***************************
    * VALDIATION FUNCTIONS
    ****************************/
    /**
    * Validate the variable name
    */
    public function variable_name_check($str)
    {
        // Load libraries
        ee()->load->library('api');

        // Is the name url_safe
        if (! preg_match("#^[a-zA-Z0-9_\-/]+$#i", $str)) {
            ee()->form_validation->set_message('variable_name_check', ee()->lang->line('republic_variables_variable_name_check'));
            return false;
        }

        // Check for duplicates
        if (ee()->republic_variables_model->does_variable_name_exist((string) $str, ee()->input->get('id'))) {
            ee()->form_validation->set_message('variable_name_check', ee()->lang->line('republic_variables_variable_name_check_exist'));
            return false;
        }

        // Check for reserverd words
        if (in_array($str, ee()->cp->invalid_custom_field_names())) {
            ee()->form_validation->set_message('variable_name_check', ee()->lang->line('republic_variables_reserved_word'));
            return false;
        }

        return true;
    }


    /**
    * Validate language prefix
    *
    * @return boolean
    */
    public function variable_pre_check($str)
    {
        // Load libraries
        ee()->load->library('api');

        // Check if prefix exist
        if (empty($str)) {
            return true;
        }

        if (! ee()->api->is_url_safe((string) $str)) {
            ee()->form_validation->set_message('variable_pre_check', ee()->lang->line('republic_variables_variable_name_check'));
            return false;
        }

        // Check for duplicates for new variable
        if (ee()->input->get('action') !== 'update') {
            if (ee()->republic_variables_model->does_language_prefix_exist((string) $str)) {
                ee()->form_validation->set_message('variable_pre_check', ee()->lang->line('republic_variables_variable_name_check_exist'));
                return false;
            }
        }

        return true;
    }

    /**
    * Validate language postfix
    *
    * @return boolean
    */
    public function variable_post_check($str)
    {
        // Load libraries
        ee()->load->library('api');

        // Check if postfix exist
        if (empty($str)) {
            return true;
        }

        if (! ee()->api->is_url_safe((string) $str)) {
            ee()->form_validation->set_message('variable_post_check', ee()->lang->line('republic_variables_variable_name_check'));
            return false;
        }

        if (ee()->input->get('action') !== 'update') {
            // Check for dublicates for new variable
            if (ee()->republic_variables_model->does_language_postfix_exist((string) $str)) {
                ee()->form_validation->set_message('variable_post_check', ee()->lang->line('republic_variables_variable_name_check_exist'));
                return false;
            }
        }

        return true;
    }


    /***************************
    * AJAX CALLS
    ****************************/

    // Update variable inline in the list view
    public function update_variable()
    {
        $variable_id   = ee()->input->get('variable_id');
        $variable_data = trim(ee()->input->post('variable_data'));

        ee()->republic_variables_model->update_variable_data($variable_id, $variable_data);

        $variable = ee()->republic_variables_model->get_variable_name($variable_id);
        if (! empty($variable)) {
            $this->get_settings();
            $variable['variable_data'] = $variable_data;
            $this->_add_to_file($variable);
        }

        die('Updated Variable');
    }

    // Update the order of the variable groups in the list view
    public function reorder_groups()
    {
        $ids = ee()->input->get_post('ids');
        ee()->republic_variables_model->reorder_groups($ids);
        ee()->output->send_ajax_response(array('XID' => ee()->functions->add_form_security_hash('{XID_HASH}'), 'status' => 'success'));
    }

    public function reorder_languages()
    {
        $ids = ee()->input->get_post('ids');

        ee()->republic_variables_model->reorder_languages($ids);
        ee()->output->send_ajax_response(array('XID' => ee()->functions->add_form_security_hash('{XID_HASH}'), 'status' => 'success'));
    }


    /***************************
    * RENDERING
    ****************************/

    private function _cp_title($title, $lang_value = true)
    {
        if (APP_VER < '2.6.0') {
            $title = ($lang_value) ? ee()->lang->line($title) : $title;
            ee()->cp->set_variable('cp_page_title', $title);
        } else {
            $title = ($lang_value) ? lang($title) : $title;
            ee()->view->cp_page_title = $title;
        }
    }

    /**
    * Render the view files, set the right navigation
    *
    * @return void
    */
    public function _render($view = "", $vars = array(), $nav_array = array())
    {

        // Navigation
        $navigation = array(
            ee()->lang->line('republic_variables_variables')     => BASE.AMP.$this->module_url
        );

        if ($this->has_access()) {
            $navigation = array_merge(
                $navigation,
                array(
                    ee()->lang->line('republic_variables_variable_add')   => BASE.AMP.$this->module_url.AMP.'method=variable_action',
                    ee()->lang->line('republic_variables_groups')         => BASE.AMP.$this->module_url.AMP.'method=groups',
                    ee()->lang->line('republic_variables_group_add')      => BASE.AMP.$this->module_url.AMP.'method=group_add',
                    ee()->lang->line('republic_variables_languages')      => BASE.AMP.$this->module_url.AMP.'method=languages',
                    ee()->lang->line('republic_variables_language_add')   => BASE.AMP.$this->module_url.AMP.'method=language_add',
                    ee()->lang->line('republic_variables_import')         => BASE.AMP.$this->module_url.AMP.'method=import_gvs',
                    ee()->lang->line('republic_variables_configurations') => BASE.AMP.$this->module_url.AMP.'method=configurations'
                )
            );
        }

        ee()->cp->set_right_nav(array_merge($navigation, $nav_array));

        return ee()->load->view($view, $vars, true);
    }
}
// END CLASS

/* End of file mcp.republic_variables.php */
