<?php
if (! defined('APP_VER')) {
        exit('No direct script access allowed');
}

/**
* Republic Variables Model
*
* @package   Republic Variables
* @author    Ragnar Frosti Frostason <ragnar@republic.se> - Republic Factory
* @link     http://www.republic.se
*/

class Republic_variables_model
{

    // --------------------------------------------------------------------
    /**
    * PHP4 Constructor
    *
    * @see  __construct()
    */
    public function Republic_variables_model()
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
        if (! isset(ee()->session->cache['republic_variables'])) {
            ee()->session->cache['republic_variables'] = array();
        }
        $this->cache =& ee()->session->cache['republic_variables'];
    }

    /**
    * Get all languages
    *
    * @return array
    */
    public function get_languages()
    {
        ee()->db->select('l.language_id, l.language_name, l.language_prefix, l.language_postfix, l.language_direction');
        ee()->db->from('republic_variables_languages l');
        ee()->db->where('l.site_id', ee()->config->item('site_id'));
        ee()->db->order_by('l.language_order, l.language_name', 'ASC');
        $result = ee()->db->get()->result_array();

        $languages = array();
        foreach ($result as $language) {
            $languages[$language['language_id']] = $language;
        }

        return $languages;
    }

    /**
    * Get module configurations
    *
    * @return array
    */

    public function get_configurations()
    {

        if (! isset($this->cache['settings'])) {
            ee()->db->select('*');
            ee()->db->where('site_id', ee()->config->item('site_id'));
            $result = ee()->db->get('republic_variables_settings');

            if ($result->num_rows() == 0) {
                $default_settings = $this->get_default_settings();

                ee()->db->insert(
                    'republic_variables_settings',
                    array(
                        'site_id'  => ee()->config->item('site_id'),
                        'settings' => base64_encode(serialize($default_settings))
                    )
                );

                ee()->db->select('settings');
                ee()->db->where('site_id', ee()->config->item('site_id'));
                $result = ee()->db->get('republic_variables_settings');
            }
            $row = $result->row_array();
            $this->cache['settings'] = unserialize(base64_decode($row['settings']));
        }

        return $this->cache['settings'];
    }

    public function get_default_settings()
    {
        return array(
            'group_access'                     => '',
            'overwrite_default_variable_value' => '',
            'show_default_variable_value'      => 'y',
            'groups_list_open'                 => 'y',
            'variables_list_open'              => 'y',
            'empty_groups_list_open'           => 'y',
            'show_variable_text'               => 'y',
            'default_language'                 => '',
            'use_default_language_on_empty'    => 'n',
            'show_language_prefix'             => 'y',
            'show_language_postfix'            => 'y',
            'auto_sync_global_vars'            => 'n',
            'default_language_direction'       => 'ltr',
            'save_on_page_click'               => 'y',
            'template_group_name'              => 'variables',
            'allow_to_save_to_files'           => 'n'
        );
    }

    /**
    * Update module configurations
    *
    * @return void
    */
    public function update_configurations()
    {
        $settings = $this->get_configurations();

        $settings['group_access']                     = ee()->input->post('group_access');
        $settings['overwrite_default_variable_value'] = ee()->input->post('overwrite_default_variable_value');
        $settings['show_default_variable_value']      = ee()->input->post('show_default_variable_value');
        $settings['groups_list_open']                 = ee()->input->post('groups_list_open');
        $settings['variables_list_open']              = ee()->input->post('variables_list_open');
        $settings['empty_groups_list_open']           = ee()->input->post('empty_groups_list_open');
        $settings['show_variable_text']               = ee()->input->post('show_variable_text');
        $settings['use_default_language_on_empty']    = ee()->input->post('use_default_language_on_empty');
        $settings['show_language_prefix']             = ee()->input->post('show_language_prefix');
        $settings['show_language_postfix']            = ee()->input->post('show_language_postfix');
        $settings['auto_sync_global_vars']            = ee()->input->post('auto_sync_global_vars');
        $settings['default_language_direction']       = ee()->input->post('default_language_direction');
        $settings['save_on_page_click']               = ee()->input->post('save_on_page_click');
        $settings['template_group_name']              = trim(ee()->input->post('template_group_name'), ee()->config->item('hidden_template_indicator'));
        $settings['allow_to_save_to_files']           = ee()->input->post('allow_to_save_to_files');

        $data = array('settings' => base64_encode(serialize($settings)));

        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->update('republic_variables_settings', $data);

        unset($this->cache['settings']);
    }


    /**
    * Check if the current configuration exist in the database
    *
    * @return boolean
    */
    public function configuration_exist($key)
    {
        ee()->db->select('*');
        ee()->db->from('republic_variables_settings');
        ee()->db->where('settings_key', $key);
        ee()->db->where('site_id', ee()->config->item('site_id'));
        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }

        return false;
    }

    public function update_default_language($language_id)
    {
        $settings = $this->get_configurations();
        $settings['default_language'] = $language_id;

        $data = array('settings' => base64_encode(serialize($settings)));

        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->update('republic_variables_settings', $data);
    }

    /**
    *  Get all empty global variables
    *
    * return array
    **/
    public function get_all_empty_variables()
    {
        ee()->db->select('g.variable_id, g.variable_name, rv.variable_description, g.variable_data, rv.variable_group_id, rv.variable_language_parent, l.language_prefix, l.language_postfix');
        ee()->db->from('global_variables g');
        ee()->db->join('republic_variables rv', 'g.variable_id = rv.variable_id', 'left');
        ee()->db->join('republic_variables_languages l', 'l.language_id = rv.variable_language', 'left');
        ee()->db->where('g.site_id', ee()->config->item('site_id'));
        ee()->db->where('g.variable_data', "");

        return ee()->db->get()->result_array();
    }

    public function get_default_lang_values($default_lang)
    {
        ee()->db->select('g.variable_name, g.variable_data, rv.variable_language_parent');
        ee()->db->from('global_variables g');
        ee()->db->join('republic_variables rv', 'g.variable_id = rv.variable_id', 'left');
        ee()->db->join('republic_variables_languages l', 'l.language_id = rv.variable_language');
        ee()->db->where('g.site_id', ee()->config->item('site_id'));
        ee()->db->where('l.language_prefix', $default_lang['language_prefix']);
        ee()->db->where('l.language_postfix', $default_lang['language_postfix']);
        $result = ee()->db->get()->result_array();

        $array = array();
        foreach ($result as $value) {
            $array[$value['variable_language_parent']] = $value['variable_data'];
        }

        return $array;
    }

    /**
    *  Get the default language
    *
    * return array
    **/
    public function get_default_lang($id)
    {
        ee()->db->select('*');
        ee()->db->from('republic_variables_languages');
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->where('language_id', $id);
        $query = ee()->db->get();

        return $query->row_array();
    }
    /**
    * Get variable for updating
    *
    * @return object
    */
    public function get_variable($id)
    {
        ee()->db->start_cache();
        ee()->db->select('gv.variable_id, variable_name, variable_description, variable_data, variable_group_id, variable_parse, use_language, save_to_file');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id', 'left');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        ee()->db->where('gv.variable_id', $id);
        ee()->db->stop_cache();
        $query = ee()->db->get();
        $row = $query->row_array();
        ee()->db->flush_cache();

        ee()->db->select('gv.variable_id, variable_name, variable_data, variable_group_id, variable_language, variable_parse, use_language, save_to_file');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id', 'left');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        ee()->db->where('variable_language_parent', $id);
        ee()->db->stop_cache();
        $query = ee()->db->get();

        $row = $this->check_for_template($row);

        foreach ($query->result_array() as $language) {
            $language = $this->check_for_template($language);
            $row['lang_'.$language['variable_language']] = $language['variable_data'];
        }

        return $row;
    }

    public function get_variable_name($variable_id)
    {
        ee()->db->select('global_variables.variable_name, republic_variables.use_language, republic_variables.save_to_file');
        ee()->db->from('global_variables');
        ee()->db->join('republic_variables', 'republic_variables.variable_id = global_variables.variable_id');
        ee()->db->where('global_variables.variable_id', $variable_id);
        return ee()->db->get()->row_array();
    }

    public function get_variable_languages($variables)
    {
        $languages = $this->get_languages();
        $variable_result = array();
        if (sizeof($languages) > 0) {
            $var_id = 0;
            $var_key = 0;
            foreach ($variables as $key => $variable) {
                if ($variable['variable_language_parent'] == 0) {
                    if (empty($variable_result[$variable['variable_id']])) {
                        $variable_result[$variable['variable_id']] = $variable;
                    } else {
                        $variable_result[$variable['variable_id']] = array_merge($variable, $variable_result[$variable['variable_id']]);
                    }
                } else {
                    $variable_result[$variable['variable_language_parent']]['lang_'.$variable['variable_language']] = array('data' => $variable['variable_data'], 'id' => $variable['variable_id']);
                }
            }
            return $variable_result;
        }

        return $variables;
    }

    public function validate_access_to_groups($variables)
    {
        $return_data = array();

        if (empty($variables)) {
            return array();
        }

        foreach ($variables as $key => $row) {
            $group_access = unserialize($row['group_access']);

            if (ee()->session->userdata['group_id'] === '1' or in_array(ee()->session->userdata['group_id'], $group_access)) {
                $return_data[$row['group_name']]['use_language'] = (isset($return_data[$row['group_name']]['use_language'])) ? $return_data[$row['group_name']]['use_language'] : 'y';
                $return_data[$row['group_name']]['use_language'] = ($row['use_language'] === 'n') ? 'n' : $return_data[$row['group_name']]['use_language'];
                $return_data[$row['group_name']]['value'][]      = $row;
                $return_data[$row['group_name']]['group_access'] = true;
            }
        }

        return $return_data;
    }

    /**
    *  Get all the Single variables, variables with parent and single parents
    *
    * @return array
    */
    public function get_groupless_variables()
    {
        // Get all variables that ARE NOT in any group
        ee()->db->select('gv.site_id, gv.variable_id, gv.variable_name, rv.variable_description, rv.variable_group_id, gv.variable_data, rv.variable_language, rv.variable_language_parent, rv.use_language, rv.save_to_file');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        ee()->db->where('rv.variable_group_id', '0');
        ee()->db->order_by('gv.variable_name ASC');
        $variables = ee()->db->get()->result_array();

        // Add languages to the variables
        $variables = $this->get_variables_template($variables);
        $variables = $this->get_variable_languages($variables);
        $variables = $this->strip_uncomplete_variables_from_array($variables);

        if (empty($variables)) {
            return array();
        }

        $results = array(
            'variables'    => array(),
            'use_language' => 'y'
        );

        foreach ($variables as $variable) {
            $results['variables'][] = $variable;
            if ($variable['use_language'] === 'n') {
                $results['use_language'] = 'n';
            }
        }

        return $results;
    }

    public function get_groups_and_variables()
    {
        // Get all variables that ARE in a group
        ee()->db->select('gv.site_id, p.group_id, p.group_name, p.group_order, p.group_access, gv.variable_id, gv.variable_name, rv.variable_description, rv.variable_group_id, gv.variable_data, rv.variable_language, rv.variable_language_parent, rv.use_language, rv.save_to_file');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id');
        ee()->db->join('republic_variables_groups p', 'rv.variable_group_id = p.group_id');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        ee()->db->where('rv.variable_group_id != ', '0');
        ee()->db->order_by('p.group_order ASC, p.group_name ASC, gv.variable_name ASC');
        $variables = ee()->db->get()->result_array();

        $variables = $this->get_variables_template($variables);
        $variables = $this->get_variable_languages($variables);
        $variables = $this->strip_uncomplete_variables_from_array($variables);
        $variables = $this->validate_access_to_groups($variables);

        return $variables;
    }

    public function get_variables_template($variables)
    {
        foreach ($variables as $key => $variable) {
            $variables[$key] = $this->check_for_template($variable);
        }

        return $variables;
    }

    public function strip_uncomplete_variables_from_array($variables)
    {
        // Do not list variables deleted externally
        foreach ($variables as $key => $variable) {
            if (! isset($variable['variable_name'])) {
                unset($variables[$key]);
            }
        }

        return $variables;
    }

    public function get_empty_groups($variables)
    {
        // Get all the empty groups
        ee()->db->select('p.group_id, p.group_name, p.group_access');
        ee()->db->from('exp_republic_variables_groups p');
        ee()->db->where('p.site_id', ee()->config->item('site_id'));
        ee()->db->order_by('p.group_order, p.group_name', 'ASC');
        $groups = ee()->db->get()->result_array();

        $empty_groups = array();

        foreach ($groups as $group) {
            $group['group_access'] = unserialize($group['group_access']);

            $exist = false;
            foreach ($variables as $variable) {
                foreach ($variable['value'] as $entry) {
                    if ($entry['group_id'] !== "") {
                        if ($entry['group_id'] === $group['group_id']) {
                            $exist = true;
                        }
                    }
                }
            }
            if (! $exist) {
                if (ee()->session->userdata['group_id'] === '1' or in_array(ee()->session->userdata['group_id'], $group['group_access'])) {
                    $empty_groups[] = $group;
                }
            }
        }

        return $empty_groups;
    }

    /**
    * Get all variables parents
    *
    * @return array
    */
    public function get_groups()
    {
        ee()->db->select('group_id, group_name, group_access');
        ee()->db->from('republic_variables_groups');
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->order_by('group_order, group_name', 'ASC, ASC');
        $query = ee()->db->get();

        return $query->result_array();
    }

    /**
    * Insert new variable
    *
    * @return void
    */
    public function insert_variable($data)
    {
        $insert_id = 0;
        // Do we use languages
        if (isset($data['languages'])) {

            $languages = $data['languages'];
            unset($data['languages']);
            $data['variable_data'] = trim($data['variable_data']);

            $global_variable_data = array();
            $global_variable_data['variable_name'] = $data['variable_name'];
            $global_variable_data['variable_data'] = $data['variable_data'];
            $global_variable_data['site_id'] = ee()->config->item('site_id');

            ee()->db->insert('global_variables', $global_variable_data);

            $insert_id = ee()->db->insert_id();

            unset($data['variable_name']);
            unset($data['variable_data']);
            unset($data['site_id']);

            $data['variable_id'] = $insert_id;
            ee()->db->insert('republic_variables', $data);

            foreach ($languages as $language) {
                $language['variable_language_parent'] = $insert_id;
                $language['variable_data'] = trim($language['variable_data']);

                $global_variable_data = array();
                $global_variable_language_data['variable_name'] = $language['variable_name'];
                $global_variable_language_data['variable_data'] = $language['variable_data'];
                $global_variable_language_data['site_id'] = ee()->config->item('site_id');

                ee()->db->insert('global_variables', $global_variable_language_data);
                $language_insert_id = ee()->db->insert_id();

                unset($language['variable_name']);
                unset($language['variable_data']);
                unset($language['site_id']);

                $language['variable_id'] = $language_insert_id;
                ee()->db->insert('republic_variables', $language);
            }
        } else {
            $global_variable_data = array();
            $global_variable_data['variable_name'] = $data['variable_name'];
            $global_variable_data['variable_data'] = $data['variable_data'];
            $global_variable_data['site_id']       = ee()->config->item('site_id');

            unset($data['variable_name']);
            unset($data['variable_data']);
            unset($data['site_id']);

            ee()->db->insert('global_variables', $global_variable_data);

            $data['variable_id'] = ee()->db->insert_id();
            ee()->db->insert('republic_variables', $data);

            $insert_id = ee()->db->insert_id();
        }

        return $insert_id;
    }

    /**
    * Update variable
    *
    * @return void
    */
    public function update_variable($id, $data)
    {
        // Do we use languages
        if (isset($data['languages'])) {
            $languages = $data['languages'];
            unset($data['languages']);

            $data['variable_data'] = trim($data['variable_data']);

            $global_variable_data = array();
            $global_variable_data['variable_name'] = $data['variable_name'];
            $global_variable_data['variable_data'] = $data['variable_data'];

            ee()->db->where('variable_id', $id);
            ee()->db->update('global_variables', $global_variable_data);

            unset($data['variable_name']);
            unset($data['variable_data']);
            unset($data['site_id']);

            ee()->db->where('variable_id', $id);
            ee()->db->update('republic_variables', $data);

            foreach ($languages as $language) {

                ee()->db->start_cache();
                ee()->db->select('variable_id');
                ee()->db->where('variable_language_parent', $id);
                ee()->db->where('variable_language', $language['variable_language']);
                $row = ee()->db->get('republic_variables')->row_array();
                ee()->db->stop_cache();
                ee()->db->flush_cache();

                $global_language_variable_data = array();
                $global_language_variable_data['variable_name'] = $language['variable_name'];
                $global_language_variable_data['variable_data'] = trim($language['variable_data']);

                unset($data['variable_name']);
                unset($data['variable_data']);
                unset($data['site_id']);

                // If deleted variable
                if (empty($row)) {
                    continue;
                }

                ee()->db->where('variable_id', $row['variable_id']);
                ee()->db->update('global_variables', $global_language_variable_data);

                ee()->db->where('variable_id', $row['variable_id']);
                ee()->db->update('republic_variables', $data);
            }
        } else {
            $global_variable_data = array();
            $global_variable_data['variable_name'] = $data['variable_name'];
            $global_variable_data['variable_data'] = $data['variable_data'];

            unset($data['variable_name']);
            unset($data['variable_data']);
            unset($data['site_id']);

            ee()->db->where('variable_id', $id);
            ee()->db->update('global_variables', $global_variable_data);

            ee()->db->where('variable_id', $id);
            ee()->db->update('republic_variables', $data);

        }
    }

    public function update_variable_data($id, $data)
    {
        ee()->db->where('variable_id', $id);
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->update('global_variables', array('variable_data' => $data));
    }

    /**
    * Delete variable
    *
    * @return void
    */
    public function delete_variable($id)
    {
        ee()->db->start_cache();
        ee()->db->where('variable_id', $id);
        ee()->db->delete('global_variables');
        ee()->db->stop_cache();
        ee()->db->flush_cache();

        ee()->db->start_cache();
        ee()->db->where('variable_id', $id);
        ee()->db->delete('republic_variables');
        ee()->db->stop_cache();
        ee()->db->flush_cache();

        ee()->db->start_cache();
        ee()->db->select('*');
        ee()->db->where('variable_language_parent', $id);
        $result = ee()->db->get('republic_variables')->result_array();
        ee()->db->stop_cache();
        ee()->db->flush_cache();

        foreach ($result as $row) {
            ee()->db->start_cache();
            ee()->db->where('variable_id', $row['variable_id']);
            ee()->db->delete('global_variables');
            ee()->db->stop_cache();
            ee()->db->flush_cache();

            ee()->db->start_cache();
            ee()->db->where('variable_id', $row['variable_id']);
            ee()->db->delete('republic_variables');
            ee()->db->stop_cache();
            ee()->db->flush_cache();
        }
    }

    /**
    * Delete variable parent/group
    *
    * @return void
    */

    public function delete_parent($id)
    {
        ee()->db->start_cache();
        ee()->db->where('group_id', $id);
        ee()->db->delete('republic_variables_groups');
        ee()->db->stop_cache();
        ee()->db->flush_cache();

        ee()->db->where('variable_group_id', $id);
        ee()->db->delete('republic_variables');
    }

    /**
    * Insert new language
    *
    * @return void
    */
    public function insert_language()
    {
        $data = array(
            'site_id'            => ee()->config->item('site_id'),
            'language_name'      => ee()->input->post('language_name'),
            'language_prefix'    => ee()->input->post('language_prefix'),
            'language_postfix'   => ee()->input->post('language_postfix'),
            'language_direction' => ee()->input->post('language_direction')
        );

        ee()->db->insert('exp_republic_variables_languages', $data);

        $insert_id = ee()->db->insert_id();

        $this->add_language_to_existing_variables($insert_id, $data);

        return $insert_id;
    }

    public function add_language_to_existing_variables($insert_id, $data)
    {
        // Get all existing variables and add the inserted language to those.
        $variables = $this->get_all_language_parents_variables();

        foreach ($variables as $variable) {
            $variable_parent_id                   = $variable['variable_id'];
            $variable['variable_name']            = $data['language_prefix'] . $variable['variable_name'] . $data['language_postfix'];
            $variable['variable_data']            = "";
            $variable['variable_language']        = $insert_id;
            $variable['variable_language_parent'] = $variable_parent_id;
            $variable['variable_description']     = "";
            unset($variable['variable_id']);

            $global_variable_data = array();
            $global_variable_data['variable_name'] = $variable['variable_name'];
            $global_variable_data['variable_data'] = $variable['variable_data'];
            $global_variable_data['site_id']       = ee()->config->item('site_id');

            ee()->db->insert('global_variables', $global_variable_data);

            $variable['variable_id'] = ee()->db->insert_id();

            unset($variable['variable_name']);
            unset($variable['variable_data']);
            unset($variable['site_id']);
            unset($variable['id']);

            ee()->db->insert('republic_variables', $variable);
        }
    }

    /**
    * Delete language and this language variables
    *
    * @return void
    */
    public function delete_language($id)
    {

        ee()->db->start_cache();
        ee()->db->select('variable_id');
        ee()->db->where('variable_language', $id);
        ee()->db->stop_cache();
        ee()->db->flush_cache();
        $variables = ee()->db->get('republic_variables')->result_array();

        ee()->db->start_cache();
        ee()->db->where('language_id', $id);
        ee()->db->delete('republic_variables_languages');
        ee()->db->stop_cache();
        ee()->db->flush_cache();

        ee()->db->start_cache();
        ee()->db->where('variable_language', $id);
        ee()->db->delete('republic_variables');
        ee()->db->stop_cache();
        ee()->db->flush_cache();

        foreach ($variables as $variable) {
            ee()->db->where('variable_id', $variable['variable_id']);
            ee()->db->delete('global_variables');
        }
    }

    /**
    * Delete group
    *
    * @return void
    */
    public function delete_group($id)
    {
        ee()->db->where('group_id', $id);
        ee()->db->delete('republic_variables_groups');

        $data = array('variable_group_id' => '');
        ee()->db->where('variable_group_id', $id);
        ee()->db->update('republic_variables', $data);
    }

    /**
    * Get all language parents
    *
    * @return array
    */
    public function get_all_language_parents_variables()
    {
        ee()->db->select('rv.*, gv.variable_id, gv.site_id, gv.variable_name, gv.variable_data');
        ee()->db->from('republic_variables rv');
        ee()->db->join('global_variables gv', 'rv.variable_id = gv.variable_id', 'left');
        ee()->db->where('rv.variable_language_parent', 0);
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));

        $query = ee()->db->get();
        return $query->result_array();
    }

    /**
    * Update languages
    *
    * @return void
    */
    public function update_languages($ids, $prefixes, $postfixes, $old_prefixes, $old_postfixes, $language_direction)
    {

        foreach ($ids as $key => $id) {
            if (($prefixes !== null && $prefixes[$key] !== $old_prefixes[$key]) or ($postfixes !== null && $postfixes[$key] !== $old_postfixes[$key])) {
                $data = array(
                    'language_prefix'  => $prefixes[$key],
                    'language_postfix' => $postfixes[$key],
                    'language_direction' => $language_direction[$key]
                );
                ee()->db->where('language_id', $ids[$key]);
                ee()->db->update('republic_variables_languages', $data);

                $this->update_variable_pre_post($ids[$key], $prefixes[$key], $postfixes[$key], $old_prefixes[$key], $old_postfixes[$key]);
            } else {
                $data = array(
                    'language_direction' => $language_direction[$key]
                );
                ee()->db->where('language_id', $ids[$key]);
                ee()->db->update('republic_variables_languages', $data);
            }
        }
    }

    /**
    * Update prefix and postfix on variables depending on the language
    *
    * @return void
    */
    public function update_variable_pre_post($group_id, $prefix, $postfix, $old_prefix, $old_postfix)
    {

        ee()->db->select('gv.*');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        ee()->db->where('rv.variable_language', $group_id);
        $query = ee()->db->get();
        $variables = $query->result_array();


        foreach ($variables as $key => $variable) {
            $variable_name = $variable['variable_name'];

            if ($old_postfix === substr($variable_name, -strlen($old_postfix)) or (strlen($old_postfix) === 0 && strlen($postfix) > 0)) {
                if (strlen($old_postfix) === 0) {
                    $variable_name = $variable_name . $postfix;
                } else {
                    $strlength = strlen($variable_name) - strlen($old_postfix);
                    $variable_name =  substr($variable_name, 0, $strlength) . $postfix;
                }
            }

            if ($old_prefix === substr($variable_name, 0, strlen($old_prefix))  or (strlen($old_prefix) === 0 && strlen($prefix) > 0)) {
                if (strlen($old_prefix) === 0) {
                    $variable_name =  $prefix . $variable_name;
                } else {
                     $variable_name =  $prefix . substr($variable_name, strlen($old_prefix), strlen($variable_name));
                }
            }

            ee()->db->where('variable_id', $variable['variable_id']);
            $data = array('variable_name' => $variable_name);
            ee()->db->update('global_variables', $data);
        }
    }

    /**
    * Insert new variable parent/group
    *
    * @return void
    */
    public function insert_group()
    {
        $group_access = ee()->input->post('group_access');
        $group_access[] = 1;
        $data = array(
            'site_id'      => ee()->config->item('site_id'),
            'group_name'   => ee()->input->post('new_group_name'),
            'group_access' => serialize($group_access),
            'group_order'  => 999
        );

        ee()->db->insert('exp_republic_variables_groups', $data);
    }


    /**
    * Validate variable name for uniqueness
    *
    * @return boolean
    */
    public function does_variable_name_exist($variable_name, $id)
    {
        ee()->db->select('variable_id');
        ee()->db->from('global_variables');
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->where('variable_name', $variable_name);

        if ($id != "") {
            ee()->db->where('variable_id !=', $id);
        }
        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }

        return false;
    }

    /**
    * Validate language prefix for uniqueness
    *
    * @return boolean
    */
    public function does_language_prefix_exist ($prefix)
    {
        ee()->db->select('language_id');
        ee()->db->from('republic_variables_languages');
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->where('language_prefix', $prefix);

        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }

        return false;
    }

    /**
    * Validate language postfix for uniqueness
    *
    * @return boolean
    */
    public function does_language_postfix_exist($postfix)
    {
        ee()->db->select('language_id');
        ee()->db->from('republic_variables_languages');
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->where('language_postfix', $postfix);

        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return true;
        }

        return false;
    }

    public function reorder_groups($ids)
    {
        foreach ($ids as $key => $id) {
            if ($id !== "") {
                $data = array('group_order' => $key);
                ee()->db->where('group_id', $id);
                ee()->db->update('republic_variables_groups', $data);
            }
        }
    }

    public function reorder_languages($ids)
    {
        foreach ($ids as $key => $id) {
            if ($id !== "") {
                $data = array('language_order' => $key);
                ee()->db->where('language_id', $id);
                ee()->db->update('republic_variables_languages', $data);
            }
        }
    }

    public function update_groups($group_ids, $group_names, $groups_access = array())
    {
        foreach ($group_ids as $group_id) {
            $group_name   = $group_names[$group_id];
            $group_access = isset($groups_access[$group_id]) ? $groups_access[$group_id] : array();
            $group_access[] = 1;

            $data = array('group_name' => $group_name, 'group_access' => serialize($group_access));
            ee()->db->where('group_id', $group_id);
            ee()->db->update('republic_variables_groups', $data);
        }
    }


    public function get_member_groups()
    {
        ee()->load->model('member_model');
        $member_groups = ee()->member_model->get_member_groups(array(), array(array('can_access_cp' => 'y')))->result_array();

        $module_id = $this->get_module_id();
        ee()->db->select('group_id');
        ee()->db->where('module_id', $module_id);
        $module_access = ee()->db->get('module_member_groups')->result_array();

        if (! is_array($module_access)) {
            $module_access = array();
        } else {
            $tmp_array = array();
            foreach ($module_access as $group) {
                $tmp_array[] = $group['group_id'];
            }
            $module_access = $tmp_array;
        }

        foreach ($member_groups as $key => $member_group) {
            if ($member_group['group_id'] != '1' && ! in_array($member_group['group_id'], $module_access)) {
                unset($member_groups[$key]);
            }
        }

        return $member_groups;
    }

    public function get_member_groups_select()
    {
        $groups        = $this->get_member_groups();
        $member_groups = array();

        foreach ($groups as $group) {
            $member_groups[$group['group_id']] = $group['group_title'];
        }

        return $member_groups;

    }

    public function get_module_id()
    {
        ee()->db->select('module_id');
        ee()->db->where('module_name', 'Republic_variables');
        $module_info = ee()->db->get('modules')->row_array();

        return $module_info['module_id'];
    }

    public function is_extension_installed()
    {
        ee()->db->select('*');
        ee()->db->where('class', 'Republic_variables_ext');
        $query = ee()->db->get('extensions');

        if ($query->num_rows() > 0) {
            return true;
        }

        return false;
    }

    public function get_all_variables_to_pre_parse()
    {
        ee()->db->select('gv.variable_name, gv.variable_data, rv.save_to_file');
        ee()->db->from('republic_variables rv');
        ee()->db->join('global_variables gv', 'rv.variable_id = gv.variable_id');
        ee()->db->where('rv.variable_parse', 'y');
        ee()->db->where('gv.variable_data !=', '');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return array();
    }

    public function get_all_variables_files_post()
    {
        if (! isset($this->cache['variables_template_post'])) {
            ee()->db->select('gv.variable_name, gv.variable_data, rv.save_to_file');
            ee()->db->from('republic_variables rv');
            ee()->db->join('global_variables gv', 'rv.variable_id = gv.variable_id');
            ee()->db->where('rv.save_to_file', 'y');
            ee()->db->where('rv.variable_parse', 'n');
            ee()->db->where('gv.variable_data !=', '');
            ee()->db->where('gv.site_id', ee()->config->item('site_id'));
            $query = ee()->db->get();

            if ($query->num_rows() > 0) {
                $this->cache['variables_template_post'] = $query->result_array();
            } else {
                $this->cache['variables_template_post'] = array();
            }
        }

        return $this->cache['variables_template_post'];
    }

    public function get_all_group_variables_by_id($group_id)
    {
        ee()->db->select('gv.variable_name, gv.variable_data');
        ee()->db->from('republic_variables rv');
        ee()->db->join('global_variables gv', 'rv.variable_id = gv.variable_id');
        ee()->db->where('rv.variable_group_id', $group_id);
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return array();
    }

    public function get_all_group_variables_by_name($group_name)
    {
        ee()->db->select('gv.variable_name, gv.variable_data, rv.variable_language_parent');
        ee()->db->from('republic_variables rv');
        ee()->db->join('global_variables gv', 'rv.variable_id = gv.variable_id');
        ee()->db->join('republic_variables_groups rvg', 'rvg.group_id = rv.variable_group_id');
        ee()->db->where('rvg.group_name', $group_name);
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        $query = ee()->db->get();

        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return array();
    }

    public function get_unsynced_variables($variables = array())
    {
        ee()->db->select('gv.*');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id', 'left');
        if (! empty($variables)) {
            ee()->db->where_in('gv.variable_id', $variables);
        }
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        ee()->db->where('rv.variable_id', null);
        return ee()->db->get()->result_array();
    }

    public function get_selected_unsynced_external_variables($variables = array())
    {
        ee()->db->select('gv.*, rv.variable_group_id');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id', 'left');
        ee()->db->where_in('gv.variable_id', $variables);
        ee()->db->where('gv.site_id !=', ee()->config->item('site_id'));
        return ee()->db->get()->result_array();
    }

    public function get_all_gvs()
    {
        $return_data['current'] = $this->get_unsynced_variables();

        ee()->db->select('gv.*, rv.variable_language_parent as republic_variable');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id', 'left');
        ee()->db->where('gv.site_id !=', ee()->config->item('site_id'));
        $other_sites = ee()->db->get()->result_array();

        $return_data['site'] = array();

        foreach ($other_sites as $variable) {
            if (empty($variable['republic_variable'])) {
                $return_data['site'][$variable['site_id']][] = $variable;
            }
        }

        return $return_data;
    }

    public function get_all_rvs()
    {
        ee()->db->select('gv.*');
        ee()->db->from('global_variables gv');
        ee()->db->join('republic_variables rv', 'rv.variable_id = gv.variable_id');
        ee()->db->where('gv.site_id', ee()->config->item('site_id'));
        $result = ee()->db->get()->result_array();

        $variables = array();
        foreach ($result as $key => $var) {
            $variables[] = $var['variable_name'];
        }

        return $variables;
    }

    public function import_variables($variables)
    {
        if (! empty($variables['current_site'])) {
            $this->sync_global_vars($variables['current_site']);
        }


        // Import languages from site
        $import_languages = ee()->input->post('import_languages');
        if ($import_languages && is_array($import_languages)) {
            foreach ($import_languages as $site_id => $value) {
                if (isset($import_languages[$site_id])) {
                    $this->import_languages($site_id);
                }
            }
        }

        // Import variable groups
        $import_groups = ee()->input->post('import_groups');
        $groups = array();

        if ($import_groups && is_array($import_groups)) {
            foreach ($import_groups as $site_id => $value) {
                if (isset($import_groups[$site_id])) {
                    $groups[$site_id] = $this->import_groups($site_id);
                }
            }
        }

        if (! empty($variables['other_sites'])) {
            $this->sync_ext_global_vars($variables['other_sites'], $groups);
        }
    }

    public function import_groups($site_id)
    {
        ee()->db->select('*');
        ee()->db->where('site_id', $site_id);
        $old_groups = ee()->db->get('republic_variables_groups')->result_array();

        $groups = array();
        if (sizeof($old_groups) > 0) {
            foreach ($old_groups as $old_group) {
                $old_group_id = $old_group['group_id'];
                unset($old_group['group_id']);
                $old_group['site_id'] = ee()->config->item('site_id');
                ee()->db->insert('republic_variables_groups', $old_group);
                $groups[$old_group_id] = ee()->db->insert_id();
            }
        }

        return $groups;
    }

    public function startsWith($haystack, $needle)
    {
        return !strncmp($haystack, $needle, strlen($needle));
    }

    public function endsWith($haystack, $needle)
    {
        $length = strlen($needle);
        if ($length == 0) {
                return true;
        }

        return (substr($haystack, -$length) === $needle);
    }

    public function sync_global_vars($variables = array())
    {
        // If automatic check, we need to get all unsynced variables
        if (empty($variables)) {
            $variables = $this->get_unsynced_variables();
        } else {
            $variables = $this->get_unsynced_variables($variables);
        }

        $other_variables = $this->get_site_variables(ee()->config->item('site_id'));

        // If there are no variables out of sync return
        if (empty($variables)) {
            return;
        }

        $languages          = $this->get_languages();
        $existing_variables = $this->get_existing_variables();

        $language_variables = array();
        foreach ($variables as $key => $variable) {
            foreach ($languages as $language) {
                if (($language['language_prefix'] !== '' && $this->startsWith($variable['variable_name'], $language['language_prefix'])) || ($language['language_postfix'] !== '' && $this->endsWith($variable['variable_name'], $language['language_postfix']))) {
                    $language_variables[$variable['variable_name']] = $variable;
                    unset($variables[$key]);
                }
            }
        }

        foreach ($variables as $variable) {
            // Insert variable into republic_variables
            ee()->db->insert('republic_variables', array('variable_id' => $variable['variable_id']));

            // If we have languages installed we need to add the variable to those
            if (! empty($languages)) {
                foreach ($languages as $language) {
                    $variable_name = $language['language_prefix'] . $variable['variable_name'] . $language['language_postfix'];

                    if (array_key_exists($variable_name, $existing_variables) && ! array_key_exists($variable_name, $language_variables)) {
                        continue;
                    }

                    $existing_variables[$variable_name] = true;

                    $variable_id = 0;
                    if (array_key_exists($variable_name, $language_variables)) {
                        $variable_id = $language_variables[$variable_name]['variable_id'];
                    } else {
                        // Insert language variable into exp_global_variables table
                        $gv_data = array(
                            'site_id'       => ee()->config->item('site_id'),
                            'variable_name' => $variable_name,
                            'variable_data' => isset($other_variables[$variable_name]) ? $other_variables[$variable_name]['variable_data'] : ''
                        );
                        ee()->db->insert('global_variables', $gv_data);
                        $variable_id = ee()->db->insert_id();
                    }

                    // Insert language variable into exp_republic_variables table
                    $rv_data = array(
                        'variable_id'              => $variable_id,
                        'variable_group_id'        => 0,
                        'variable_description'     => '',
                        'variable_language'        => $language['language_id'],
                        'variable_language_parent' => $variable['variable_id'],
                        'variable_parse'           => 'n'
                    );
                    ee()->db->insert('republic_variables', $rv_data);
                }
            }
        }
    }

    public function get_site_variables($site_id)
    {
        ee()->db->select('variable_name, variable_data');
        ee()->db->where('site_id', $site_id);
        $variables = ee()->db->get('global_variables')->result_array();

        $return_data = array();
        foreach ($variables as $variable) {
            $return_data[$variable['variable_name']] = $variable;
        }

        return $return_data;
    }

    public function import_languages($site_id)
    {
        ee()->db->select('*');
        ee()->db->from('republic_variables_languages');
        ee()->db->where('site_id', $site_id);
        $languages = ee()->db->get()->result_array();

        if (sizeof($languages) > 0) {
            foreach ($languages as $language) {
                $language['site_id'] = ee()->config->item('site_id');
                unset($language['language_id']);

                $where = 'site_id = ' . ee()->config->item("site_id");

                // Check if the language already exists

                ee()->db->select('language_name');
                ee()->db->where('site_id', ee()->config->item('site_id'));
                ee()->db->where('language_postfix', $language['language_postfix']);
                ee()->db->where('language_prefix', $language['language_prefix']);
                $existing_language = ee()->db->get('republic_variables_languages');

                if ($existing_language->num_rows() > 0) {
                    continue;
                }

                ee()->db->insert('republic_variables_languages', $language);

                $insert_id = ee()->db->insert_id();
                $this->add_language_to_existing_variables($insert_id, $language);
            }
        }
    }

    /*
     * Import and/or create variables from other sites
     */
    public function sync_ext_global_vars($sites = array(), $groups = array())
    {
        // Loop through all variables for each site.
        foreach ($sites as $site_id => $variables) {
            // If automatic check, we need to get all unsynced variables
            $variables       = $this->get_selected_unsynced_external_variables($variables);
            $other_variables = $this->get_site_variables($site_id);

            // If there are no variables out of sync return
            if (empty($variables)) {
                return;
            }

            $languages          = $this->get_languages();
            $existing_variables = $this->get_existing_variables();

            foreach ($variables as $variable) {
                if (array_key_exists($variable['variable_name'], $existing_variables)) {
                    continue;
                }

                $group_id = 0;
                $variable_group_id = $variable['variable_group_id'];
                unset($variable['variable_group_id']);

                if ($variable_group_id && isset($groups[$site_id][$variable_group_id])) {
                    $group_id = $groups[$site_id][$variable_group_id];
                }

                $existing_variables[$variable['variable_name']] = true;

                unset($variable['variable_id']);
                $variable['site_id'] = ee()->config->item('site_id');

                ee()->db->insert('global_variables', $variable);

                $variable['variable_id'] = ee()->db->insert_id();

                // Insert variable into republic_variables
                ee()->db->insert(
                    'republic_variables',
                    array(
                        'variable_id'       => $variable['variable_id'],
                        'variable_group_id' => $group_id
                    )
                );

                // If we have languages installed we need to add the variable to those
                if (! empty($languages)) {
                    foreach ($languages as $language) {
                        $variable_name = $language['language_prefix'] . $variable['variable_name'] . $language['language_postfix'];
                        if (array_key_exists($variable_name, $existing_variables)) {
                            continue;
                        }

                        $existing_variables[$variable_name] = true;

                        // Insert language variable into exp_global_variables table
                        $gv_data = array(
                            'site_id'       => ee()->config->item('site_id'),
                            'variable_name' => $variable_name,
                            'variable_data' => isset($other_variables[$variable_name]) ? $other_variables[$variable_name]['variable_data'] : ''
                        );
                        ee()->db->insert('global_variables', $gv_data);

                        // Insert language variable into exp_republic_variables table
                        $rv_data = array(
                            'variable_id'              => ee()->db->insert_id(),
                            'variable_group_id'        => $group_id,
                            'variable_description'     => '',
                            'variable_language'        => $language['language_id'],
                            'variable_language_parent' => $variable['variable_id'],
                            'variable_parse'           => 'n'
                        );
                        ee()->db->insert('republic_variables', $rv_data);
                    }
                }
            }
        }
    }

    public function get_existing_variables()
    {
        ee()->db->select('variable_name');
        ee()->db->where('site_id', ee()->config->item('site_id'));
        $variables = ee()->db->get('global_variables')->result_array();
        $return_data = array();

        foreach ($variables as $variable) {
            $return_data[$variable['variable_name']] = true;
        }

        return $return_data;
    }

    public function get_all_sites()
    {
        ee()->db->select('site_id, site_label');
        $sites = ee()->db->get('sites')->result_array();
        $return_data = array();

        foreach ($sites as $site) {
            $return_data[$site['site_id']] = $site['site_label'];
        }

        return $return_data;
    }

    public function check_for_template($variable)
    {
        $settings = $this->get_configurations();

        if ($settings['allow_to_save_to_files'] === 'y' && $variable['save_to_file'] === 'y') {
            $variable_path = reduce_double_slashes(ee()->config->item('tmpl_file_basepath') . '/' . ee()->config->item('site_short_name') . '/' . ee()->config->item('hidden_template_indicator') . $settings['template_group_name'] . '.group/' . $variable['variable_name'] . '.html');

            if (! isset($this->cache[$variable['variable_name']])) {
                $variable_value = false;
                if (file_exists($variable_path)) {
                    $variable_value = file_get_contents($variable_path);
                }

                if ($variable_value !== false) {
                    $this->cache[$variable['variable_name']] = $variable_value;
                } else {
                    $this->cache[$variable['variable_name']] = $variable['variable_data'];
                }
            }

            $variable['variable_data'] = $this->cache[$variable['variable_name']];
        }

        return $variable;
    }

    public function update_variable_value($variable_name, $variable_data)
    {
        ee()->db->select('republic_variables.save_to_file');
        ee()->db->from('global_variables');
        ee()->db->join('republic_variables', 'global_variables.variable_id = republic_variables.variable_id');
        ee()->db->where('global_variables.variable_name', $variable_name);
        ee()->db->where('global_variables.site_id', ee()->config->item('site_id'));
        ee()->db->limit(1);
        $query = ee()->db->get();

        if ($query->num_rows() === 0) {
            return false;
        }

        $entry = $query->row_array();

        // This variable should not be saved to file
        if ($entry['save_to_file'] !== 'y') {
            return false;
        }

        ee()->db->where('variable_name', $variable_name);
        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->update('global_variables', array('variable_data' => $variable_data));

        return ee()->db->affected_rows();
    }
}
// END CLASS

/* End of file republic_variables_model.php */
