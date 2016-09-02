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
* Republic Variables Install and update class
*
* @package   Republic Variables
* @author    Ragnar Frosti Frostason <ragnar@republic.se> - Republic Factory
* @link     http://www.republic.se
*/
class Republic_variables_upd
{

    /**
    * Version number
    *
    * @var  string
    */
    public $version = REPUBLIC_VARIABLES_VERSION;

    // --------------------------------------------------------------------

    /**
    * PHP4 Constructor
    *
    * @see  __construct()
    */
    public function Republic_variables_upd()
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
        // set module name
        $this->name = str_replace('_upd', '', ucfirst(get_class($this)));
    }

    // --------------------------------------------------------------------

    /**
    * Install the module
    *
    * @return bool
    */
    public function install()
    {
        ee()->db->insert(
            'modules',
            array(
                'module_name'        => $this->name,
                'module_version'     => $this->version,
                'has_cp_backend'     => 'y',
                'has_publish_fields' => 'n'
            )
        );

        ee()->load->dbforge();

        // Create the Republic Variables table
        $fields = array(
            'variable_id'               => array('type' => 'int', 'constraint' => '6', 'unsigned' => true, 'auto_increment' => true),
            'variable_group_id'         => array('type' => 'int', 'constraint' => '6', 'default' => 0),
            'variable_description'      => array('type' => 'varchar', 'constraint' => '250'),
            'variable_language'         => array('type' => 'varchar', 'constraint' => '50'),
            'variable_language_parent'  => array('type' => 'int', 'constraint' => '6', 'default' => 0),
            'variable_parse'            => array('type' => 'varchar', 'constraint' => '1', 'default' => 'n'),
            'use_language'              => array('type' => 'varchar', 'constraint' => '2', 'default' => 'y'),
            'save_to_file'              => array('type' => 'varchar', 'constraint' => '2', 'default' => 'n')
        );

        ee()->dbforge->add_field($fields);
        ee()->dbforge->add_key('variable_id', true);
        ee()->dbforge->create_table('republic_variables');


        // Create the variable parent table
        $fields = array(
            'group_id'     => array('type' => 'int', 'constraint' => '10', 'unsigned' => true, 'auto_increment' => true),
            'site_id'      => array('type' => 'int', 'constraint' => '10', 'unsigned' => true),
            'group_name'   => array('type' => 'varchar', 'constraint' => '250'),
            'group_order'  => array('type' => 'int', 'constraint' => '5'),
            'group_access' => array('type' => 'varchar', 'constraint' => '500', 'default' => serialize(array()))
        );

        ee()->dbforge->add_field($fields);
        ee()->dbforge->add_key('group_id', true);
        ee()->dbforge->create_table('republic_variables_groups');

        unset($fields);

        // Create the modules table
        $fields = array(
            'settings_id' => array('type' => 'int', 'constraint' => '10', 'unsigned' => true, 'auto_increment' => true),
            'site_id'     => array('type' => 'int', 'constraint' => '10', 'unsigned' => true),
            'settings'    => array('type' => 'longtext')
        );

        ee()->dbforge->add_field($fields);
        ee()->dbforge->add_key('settings_id', true);
        ee()->dbforge->create_table('republic_variables_settings');
        unset($fields);

        // Load module model if not exist
        ee()->load->model('republic_variables_model');

        $default_settings = ee()->republic_variables_model->get_default_settings();

        ee()->db->insert(
            'republic_variables_settings',
            array(
                'site_id'  => ee()->config->item('site_id'),
                'settings' => base64_encode(serialize($default_settings))
            )
        );

        // Create the variable language table
        $fields = array(
            'language_id'        => array('type' => 'int', 'constraint' => '10', 'unsigned' => true, 'auto_increment' => true),
            'site_id'            => array('type' => 'int', 'constraint' => '10', 'unsigned' => true),
            'language_name'      => array('type' => 'varchar', 'constraint' => '250'),
            'language_prefix'    => array('type' => 'varchar', 'constraint' => '250', 'null' => true, 'default' => null),
            'language_postfix'   => array('type' => 'varchar', 'constraint' => '250', 'null' => true, 'default' => null),
            'language_order'     => array('type' => 'int', 'constraint' => '5', 'default' => 999),
            'language_direction' => array('type' => 'varchar', 'constraint' => '5', 'default' => 'ltr')
        );

        ee()->dbforge->add_field($fields);
        ee()->dbforge->add_key('language_id', true);
        ee()->dbforge->create_table('republic_variables_languages');

        unset($fields);

        // Activate Extension
        if (! class_exists('republic_variables_ext')) {
            include_once PATH_THIRD.'republic_variables/ext.republic_variables.php';
        }

        $republic_variables_extension = new Republic_variables_ext();
        $republic_variables_extension->activate_extension();

        // Add all existing Global Variables to Republic Variables

        /*ee()->db->select('*');
        $global_variables = ee()->db->get('global_variables')->result_array();

        foreach ($global_variables AS $variable) {
            ee()->db->insert('republic_variables', array('variable_id' => $variable['variable_id']));
        }*/

        return true;
    }

    // --------------------------------------------------------------------

    /**
    * Uninstall the module
    *
    * @return bool
    */
    public function uninstall()
    {
        ee()->load->dbforge();

        // get module id
        ee()->db->select('module_id');
        ee()->db->from('exp_modules');
        ee()->db->where('module_name', $this->name);
        $query = ee()->db->get();

        // remove references from module_member_groups
        ee()->db->where('module_id', $query->row('module_id'));
        ee()->db->delete('module_member_groups');

        // remove references from modules
        ee()->db->where('module_name', $this->name);
        ee()->db->delete('modules');

        // Delete the modules tables
        ee()->dbforge->drop_table('republic_variables');
        ee()->dbforge->drop_table('republic_variables_settings');
        ee()->dbforge->drop_table('republic_variables_groups');
        ee()->dbforge->drop_table('republic_variables_languages');

        // Disable Extension
        if (! class_exists('republic_variables_ext')) {
            include_once PATH_THIRD.'republic_variables/ext.republic_variables.php';
        }

        $republic_variables_extension = new Republic_variables_ext();
        $republic_variables_extension->disable_extension();

        return true;
    }

    // --------------------------------------------------------------------

    /**
    * Update the module
    *
    * @return bool
    */
    public function update($current = '')
    {

        if ($current == '' or version_compare($current, $this->version) === 0) {
            return false;
        }

        if (version_compare($current, '1.1', '<')) {
            ee()->db->query("ALTER TABLE exp_republic_variables_parents ADD COLUMN parent_order int(5)");
        }

        if (version_compare($current, '1.2', '<')) {
            $this->update_to_1_2();
        }

        if (version_compare($current, '1.3', '<')) {
            $this->update_to_1_3();
        }

        if (version_compare($current, '1.5', '<')) {
            $this->update_to_1_5();
        }

        if (version_compare($current, '1.6', '<')) {
            $this->update_to_1_6();
        }

        if (version_compare($current, '1.6.2', '<')) {
            $this->update_to_1_6_2();
        }

        if (version_compare($current, '1.6.3', '<')) {
            $this->update_to_1_6_3();
        }

        if (version_compare($current, '1.6.4', '<')) {
            $this->update_to_1_6_4();
        }

        return true;
    }

    public function update_to_1_2()
    {
        $old_configs = ee()->db->select('*')->get('republic_variables')->result_array();
        $data = array('site_id' => ee()->config->item('site_id'));

        foreach ($old_configs as $config) {
            $data['settings'][$config['settings_key']] = $config['settings_value'];
        }

        $data['settings'] = base64_encode(serialize($data['settings']));

        ee()->db->where('site_id', ee()->config->item('site_id'));
        ee()->db->delete('republic_variables');
        ee()->db->query("ALTER TABLE exp_republic_variables DROP COLUMN settings_key");
        ee()->db->query("ALTER TABLE exp_republic_variables DROP COLUMN settings_value");
        ee()->db->query("ALTER TABLE exp_republic_variables ADD COLUMN settings longtext");
        ee()->db->query("ALTER TABLE exp_global_variables ADD COLUMN variable_parse varchar(1) DEFAULT 'n' AFTER variable_language_parent");
        ee()->db->query("ALTER TABLE exp_republic_variables_parents ADD COLUMN admin_only varchar(1) DEFAULT 'n'");

        ee()->db->insert('republic_variables', $data);

    }

    public function update_to_1_3()
    {

        ee()->load->dbforge();

        // Create the modules table
        $fields = array(
            'settings_id' => array('type' => 'int', 'constraint' => '10', 'unsigned' => true, 'auto_increment' => true),
            'site_id'     => array('type' => 'int', 'constraint' => '10', 'unsigned' => true),
            'settings'    => array('type' => 'longtext')
        );

        ee()->dbforge->add_field($fields);
        ee()->dbforge->add_key('settings_id', true);
        ee()->dbforge->create_table('republic_variables_settings');
        unset($fields);

        $old_settings = ee()->db->select('*')->get('republic_variables')->result_array();

        foreach ($old_settings as $site_settings) {
            ee()->db->insert('republic_variables_settings', $site_settings);
        }

        ee()->dbforge->drop_table('republic_variables');

        // Create the modules table
        $fields = array(
            'variable_id'               => array('type' => 'int', 'constraint' => '6', 'unsigned' => true, 'auto_increment' => true),
            'variable_parent_id'        => array('type' => 'int', 'constraint' => '6', 'default' => 0),
            'variable_description'      => array('type' => 'varchar', 'constraint' => '250'),
            'variable_language'         => array('type' => 'varchar', 'constraint' => '50'),
            'variable_language_parent'  => array('type' => 'int', 'constraint' => '6', 'default' => 0),
            'variable_parse'            => array('type' => 'varchar', 'constraint' => '1', 'default' => 'n')
        );

        ee()->dbforge->add_field($fields);
        ee()->dbforge->add_key('variable_id', true);
        ee()->dbforge->create_table('republic_variables');

        $variable_data = ee()->db->select('*')->get('global_variables')->result_array();

        foreach ($variable_data as $variable) {
            $data = array(
                'variable_id'               => $variable['variable_id'],
                'variable_parent_id'        => $variable['variable_parent_id'],
                'variable_description'      => $variable['variable_description'],
                'variable_language'         => $variable['variable_language'],
                'variable_language_parent'  => isset($variable['variable_language_parent']) ? $variable['variable_language_parent'] : '',
                'variable_parse'            => isset($variable['variable_parse']) ? $variable['variable_parse'] : 'n'
            );

            ee()->db->insert('republic_variables', $data);
        }

        // Remove custom columns from exp_global_variables table
        ee()->db->query("ALTER TABLE exp_global_variables DROP COLUMN variable_description");
        ee()->db->query("ALTER TABLE exp_global_variables DROP COLUMN variable_parent_id");
        ee()->db->query("ALTER TABLE exp_global_variables DROP COLUMN variable_language");
        ee()->db->query("ALTER TABLE exp_global_variables DROP COLUMN variable_language_parent");
        ee()->db->query("ALTER TABLE exp_global_variables DROP COLUMN republic_variable");

        $global_variable_fields = ee()->db->list_fields('global_variables');
        if (in_array('variable_parse', $global_variable_fields)) {
            ee()->db->query("ALTER TABLE exp_global_variables DROP COLUMN variable_parse");
        }

        $republic_variables_parents_fields = ee()->db->list_fields('republic_variables_parents');
        if (! in_array('admin_only', $republic_variables_parents_fields)) {
            ee()->db->query("ALTER TABLE exp_republic_variables_parents ADD COLUMN admin_only varchar(1) DEFAULT 'n'");
        }

        $query = ee()->db->select('*')->where('class', 'Republic_variables_ext')->get('extensions');

        if ($query->num_rows() === 0) {
            // Activate Extension
            if (! class_exists('republic_variables_ext')) {
                include_once PATH_THIRD.'republic_variables/ext.republic_variables.php';
            }

            $republic_variables_extension = new Republic_variables_ext();
            $republic_variables_extension->activate_extension();
        } else {
            $extension_data = array('method' => 'session_start', 'hook' => 'session_start');
            ee()->db->where('class', 'Republic_variables_ext');
            ee()->db->update('extensions', $extension_data);
        }
    }

    public function update_to_1_5()
    {
        ee()->db->query("ALTER TABLE exp_republic_variables CHANGE variable_parent_id variable_group_id int(6) DEFAULT 0");
        ee()->db->query("ALTER TABLE exp_republic_variables_parents RENAME TO exp_republic_variables_groups");
        ee()->db->query("ALTER TABLE exp_republic_variables_groups CHANGE parent_id group_id int(10) UNSIGNED AUTO_INCREMENT");
        ee()->db->query("ALTER TABLE exp_republic_variables_groups CHANGE parent_name group_name varchar(250)");
        ee()->db->query("ALTER TABLE exp_republic_variables_groups CHANGE parent_order group_order int(5)");
        ee()->db->query("ALTER TABLE exp_republic_variables_languages ADD COLUMN language_order int(5) DEFAULT '999'");

        // Update the settings
        ee()->db->select('*');
        $variables_settings = ee()->db->get('republic_variables_settings')->result_array();

        ee()->load->model('republic_variables_model');

        $languages = ee()->republic_variables_model->get_languages();

        foreach ($variables_settings as $settings) {
            $changed_settings = unserialize(base64_decode($settings['settings']));

            $changed_settings['groups_list_open']       = $changed_settings['parents_list_open'];
            $changed_settings['empty_groups_list_open'] = $changed_settings['empty_parents_list_open'];

            unset($changed_settings['parents_list_open']);
            unset($changed_settings['empty_parents_list_open']);

            if ($changed_settings['default_language'] == '' && ! empty($languages)) {
                $first_language = reset($languages);
                $changed_settings['default_language'] = $first_language['language_id'];
            }

            ee()->db->where('settings_id', $settings['settings_id']);
            ee()->db->update('republic_variables_settings', array('settings' => base64_encode(serialize($changed_settings))));

        }

        $this->update_extension();
    }

    public function update_to_1_6()
    {
        if (! ee()->db->field_exists('language_direction', 'exp_republic_variables_languages')) {
            ee()->db->query("ALTER TABLE exp_republic_variables_languages ADD COLUMN language_direction varchar(5) DEFAULT 'ltr'");
        }

        if (! ee()->db->field_exists('group_access', 'exp_republic_variables_groups')) {
            ee()->db->query("ALTER TABLE exp_republic_variables_groups CHANGE admin_only group_access varchar(500)");
        }

        ee()->load->model('republic_variables_model');

        $groups        = ee()->db->get('republic_variables_groups')->result_array();
        $member_groups = ee()->republic_variables_model->get_member_groups();
        $group_array   = array();
        foreach ($member_groups as $member_group) {
            $group_array[] = $member_group['group_id'];
        }

        foreach ($groups as $group) {
            if ($group['group_access'] === 'y') {
                ee()->db->where('group_id', $group['group_id']);
                ee()->db->update('republic_variables_groups', array('group_access' => serialize(array("1"))));
            } else {
                ee()->db->where('group_id', $group['group_id']);
                ee()->db->update('republic_variables_groups', array('group_access' => serialize($group_array)));
            }
        }

        // Update the settings
        ee()->db->select('*');
        $variables_settings = ee()->db->get('republic_variables_settings')->result_array();

        ee()->load->model('republic_variables_model');

        $languages = ee()->republic_variables_model->get_languages();

        foreach ($variables_settings as $settings) {
            $changed_settings = unserialize(base64_decode($settings['settings']));

            $changed_settings['auto_sync_global_vars']      = 'n';
            $changed_settings['default_language_direction'] = 'ltr';

            ee()->db->where('settings_id', $settings['settings_id']);
            ee()->db->update('republic_variables_settings', array('settings' => base64_encode(serialize($changed_settings))));
        }

        $this->update_extension();
    }

    public function update_to_1_6_2()
    {
        ee()->db->query("ALTER TABLE exp_republic_variables ADD COLUMN use_language varchar(2) DEFAULT 'y'");
        $this->update_extension();
    }

    public function update_to_1_6_3()
    {
        // Update the settings
        ee()->db->select('*');
        $variables_settings = ee()->db->get('republic_variables_settings')->result_array();

        ee()->load->model('republic_variables_model');

        foreach ($variables_settings as $settings) {
            $changed_settings = unserialize(base64_decode($settings['settings']));

            $changed_settings['save_on_page_click'] = 'y';

            ee()->db->where('settings_id', $settings['settings_id']);
            ee()->db->update('republic_variables_settings', array('settings' => base64_encode(serialize($changed_settings))));
        }
    }

    public function update_to_1_6_4()
    {
        ee()->db->query("ALTER TABLE exp_republic_variables ADD COLUMN save_to_file varchar(2) DEFAULT 'n'");

        // Update the settings
        ee()->db->select('*');
        $variables_settings = ee()->db->get('republic_variables_settings')->result_array();

        ee()->load->model('republic_variables_model');


        foreach ($variables_settings as $settings) {
            $changed_settings = unserialize(base64_decode($settings['settings']));

            $changed_settings['template_group_name']    = 'variables';
            $changed_settings['allow_to_save_to_files'] = 'n';

            ee()->db->where('settings_id', $settings['settings_id']);
            ee()->db->update('republic_variables_settings', array('settings' => base64_encode(serialize($changed_settings))));
        }
    }

    public function update_extension()
    {
        $query = ee()->db->select('*')->where('class', 'Republic_variables_ext')->get('extensions');

        // Activate Extension
        if (! class_exists('republic_variables_ext')) {
            include_once PATH_THIRD.'republic_variables/ext.republic_variables.php';
        }

        $republic_variables_extension = new Republic_variables_ext();

        if ($query->num_rows() === 0) {
            $republic_variables_extension->activate_extension();
        } else {
            $republic_variables_extension->update_extension($this->version);
        }
    }
}

// END CLASS

/* End of file upd.republic_variables.php */
