<?php

$lang = array(

  "republic_variables_module_name" =>
  "Republic Variables",

  "republic_variables_module_description" =>
  "Manages your Global Variables",

  "republic_variables_configurations" =>
  "Configuration",

  "republic_variables_label_key" =>
  "Key",

  "republic_variables_label_value" =>
  "Value",

  "republic_variables_label_action" =>
  "Action",

  /* Configuration */

  "republic_variables_configuration_main" =>
  "Module configuration",

  "republic_variables_configuration_variables" =>
  "Variable configuration",

  "republic_variables_configuration_languages" =>
  "Language configuration",

  "republic_variables_configuration_templates" =>
  "Variable template configuration",

  "republic_variables_configuration_overwrite_default_variable_value" =>
  "Rename the term &ldquo;Value&rdquo; used in table (optional)",

	"republic_variables_configuration_overwrite_default_variable_value_smalltext" =>
  "",

  "republic_variables_configuration_group_access" =>
  "Which member groups should be allowed to change the configurations, languages, groups etc.",

	"republic_variables_configuration_group_access_smalltext" =>
  "",

  "republic_variables_configuration_default_language" =>
  "Default language",

	"republic_variables_missing_extension" =>
	"You need to install Republic Variable Extension to use this functionality",

	"republic_variables_configuration_default_language_smalltext" =>
  "<div class='subtext'>A default language will be shown as the first language in all lists, and is required by the Extension if you like to use a specific language as fallback.</div>",

  "republic_variables_configuration_use_default_language_on_empty" =>
  "In templates, fallback on default language variable if current language variable is empty",

	"republic_variables_configuration_use_default_language_on_empty_smalltext" =>
  "<div class='subtext'>Example: Fall back on English (default) if Spanish word does not exist. Requires the extension to be installed and default language selected</div>",

  "republic_variables_configuration_show_language_prefix" =>
  "Use language prefix",

	"republic_variables_configuration_show_language_prefix_smalltext" =>
  "<div class='subtext'>I almost all situations you use either a prefix or a postfix</div>",

  "republic_variables_configuration_show_language_postfix" =>
  "Use language postfix",

	"republic_variables_configuration_show_language_postfix_smalltext" =>
  "",

  "republic_variables_label_language_direction" =>
  "Direction of the language",

  "republic_variables_default_language_direction" =>
  "Default variable language direction",

  "republic_variables_label_language_ltr" =>
  "Left to right",

  "republic_variables_label_language_rtl" =>
  "Right to left",

  "republic_variables_configuration_variable_prefix" =>
  "Variable prefix, for name spacing the global variables (optional)",

	"republic_variables_configuration_variable_prefix_smalltext" =>
  "<div class='subtext'>Example: <strong>global_</strong> (only English characters, dash and underscore are allowed)</div>",

  "republic_variables_configuration_variable_postfix" =>
  "Variable postfix (optional)",

	"republic_variables_configuration_variable_postfix_smalltext" =>
  "<div class='subtext'>Example: <strong>_global</strong> (only English characters, dash and underscore are allowed)</div>",

  "republic_variables_configuration_show_variable_text" =>
  "Show variable data as text",

	"republic_variables_configuration_show_variable_text_smalltext" =>
  "<div class='subtext'>If set to no, an red or green image will be used instead. This might be useful if you have a lot of languages.</div>",

  "republic_variables_configuration_groups_list_open" =>
  "Show custom groups expanded by default",

	"republic_variables_configuration_groups_list_open_smalltext" =>
  "",

  "republic_variables_configuration_variables_list_open" =>
  "Show &ldquo;Variables&rdquo; group expanded by default",

	"republic_variables_configuration_variables_list_open_smalltext" =>
  "<div class='subtext'>Variables not assigned any group</div>",

  "republic_variables_configuration_empty_groups_list_open" =>
  "Show groups without variables open by default",

	"republic_variables_configuration_empty_groups_list_open_smalltext" =>
  "",

  "republic_variables_configuration_auto_sync" =>
  "Auto sync new Global Variables created outside Republic Variables",

  "republic_variables_save_on_page_click" =>
  "Save variable value in list view on mousclick outside the column",


  "republic_variables_allow_to_save_to_files" =>
  "Allow to save variables to file",

  "republic_variables_configuration_template_group_name" =>
  "Name of the variable template group",

  "republic_variables_configuration_template_group_name_smalltext" =>
  "If the template group does not exist it will be created in your template folder: <br />",

  "republic_variables_sync_files_to_db" =>
  "Click here to sync all saved variables from files to db",

  /* Variables */
	"republic_variables_variable_heading" =>
	"Variable settings",

  "republic_variables_variables" =>
  "Variables",

  "republic_variable_deleted" =>
  "Variable deleted",

  "republic_variables_variable_add" =>
  "Add Variable",

  "republic_variables_variable_edit" =>
  "Edit Variable",

  "republic_variable_added" =>
  "Variable added",

  "republic_variable_add_failed" =>
  "Variable was not added:",

  "republic_variable_updated" =>
  "Variable updated",

  "republic_variable_update_failed" =>
  "Variable was not updated",

  "republic_variables_configuration_show_default_variable_value" =>
  "Show default variable when using languages",

  "republic_variables_configuration_show_default_variable_value_desc" =>
  "The default value field is hidden (when no is selected) for the variables, except when variable hides languages",

	"republic_variables_configuration_show_default_variable_value_smalltext" =>
  "<div class='subtext'>When using language variables (with pre- or postfix) the default variable (without pre- or postfix) can be hidden under &ldquo;Variables&rdquo;.</div>",

  "republic_variable_add_variable_to_group_text" =>
  "Add new variable to this group",

  "republic_variables_group_variables" =>
  "Variables",

  "republic_variables_empty_groups" =>
  "Empty groups",

  "republic_variables_empty_groups_help" =>
  "The following groups are empty. You might wan't to assign variables to them, or delete them.",

  "republic_variables_label_choose_group" =>
  "Choose group",

  "republic_variables_label_variable_name" =>
  "Variable name",

	"republic_variables_label_variable_name_desc" =>
  "(only English characters, dash and underscore are allowed)",

  "republic_variables_label_variable_description" =>
  "Variable description",

  "republic_variables_label_variable_name_text" =>
  "Name of the variable",

  "republic_variables_label_variable_value" =>
  "Variable value",

  "republic_variables_variable_name_check" =>
  "The %s can only consist of English letters, numbers, underscores, hyphens and no spaces",

  "republic_variables_variable_name_check_exist" =>
  "The %s already exist",

	"republic_variables_reserved_word" =>
	"The variable name is reserved in the system",

	"republic_variables_label_variable_parse" =>
	"Parse variable early",

  "republic_variables_label_use_language" =>
  "Show languages",

  "republic_variables_label_use_language_desc" =>
  "Set this to 'no' to hide the language values and use default value only",

  "republic_variables_language_must_exist_to_use" =>
  "You need to add languages to use this option",

	"republic_variables_admin_only" =>
	"This group is only visible for Super Admins",

  "republic_variables_language_only" =>
  "Variable uses language values only",

  "republic_variables_default_only" =>
  "Variable uses default value only",

  "republic_variables_label_save_to_file" =>
  "Save the variable to a template file",

  /* Languages */
  "republic_variables_languages" =>
  "Languages",

  "republic_variables_language_add" =>
  "Add Language",

  "republic_variables_language_add_failed" =>
  "Language was not added",

  "republic_variables_language_update_failed" =>
  "Language was not updated.",

  "republic_variables_language_added" =>
  "Language added",

  "republic_variables_language_deleted" =>
  "Language deleted",

  "republic_variables_language_updated" =>
  "Languages updated.",

  "republic_variables_label_language_prefix" =>
  "Language prefix",

  "republic_variables_label_language_postfix" =>
  "Language postfix",

  "republic_variables_label_language_name" =>
  "Name",

  "republic_variables_label_language_name_text" =>
  "Name of the language",

  "republic_variables_label_language" =>
  "Language",

  "republic_variables_language_prefix_postfix_required" =>
  "Either prefix or postfix is required.",

  "republic_variables_language_prefix_duplicate" =>
  "The prefixes have to be unique and can't be the same for different languages",

  "republic_variables_language_postfix_duplicate" =>
  "The postfixes have to be unique and can't be the same for different languages",

	"republic_variable_no_language" =>
	"You haven't added any languages yet,",

	"republic_variable_add_new_group" =>
	"click here to add a language",

  /* Groups */

	"republic_variables_groups" =>
	"Groups",

  "republic_variables_label_group_name" =>
  "Name of the group",

  "republic_variables_group_added" =>
  "Group added",

  "republic_variables_group_add_failed" =>
  "Group was not added:",

  "republic_group_deleted" =>
  "Group deleted",

  "republic_variables_group_add" =>
  "Add Group",

	"republic_variables_label_admin_only" =>
	"Give the following member groups access to this group",

	"republic_variables_group_updated" =>
	"The groups have been updated.",

	"republic_variables_group_update_failed" =>
	"Group name can't be empty:",

	"republic_variables_group_deleted" =>
	"The group was successfully deleted",

	"republic_variable_no_groups" =>
	"You haven't added any groups yet,",

	"republic_variable_add_new_groups" =>
	"click here to add a group",

	"republic_variable_variable_imported" =>
	"The variables were successfully imported",

  "republic_variables_template_folder_not_writable" =>
  "Could not write to following folder: ",

  "republic_variables_could_not_create_folder" =>
  "Could not create following folder: ",

  "republic_variables_folder_does_not_exist" =>
  "The variable template folder does not exist",

  /* Actions */
  "republic_variables_add" =>
  "Add",

  "republic_variables_submit" =>
  "Submit",

  "republic_variables_update" =>
  "Update",

  "republic_variables_delete" =>
  "Delete",

	"republic_variables_choose_language" =>
	"Choose Language",

	"republic_variables_delete_confirm" =>
	"Are you sure you want to delete this entry?",

	"republic_variables_deleted_variable_message" =>
	"<i>Deleted from Global Variables<i>",

  "republic_variables_files_synced" =>
  "variables were successfully synced to the DB",

  "republic_variables_no_files_synced" =>
  "No files needed to be synced to the DB",

  "republic_variables_save_to_files_not_allowed" =>
  "You must allow to save to files",

  "republic_variables_deleted_filed" =>
  "The following files were deleted because there were no matching variable or the variable did not allow to save to file:",

	/* Import view */
  "republic_variables_import" =>
  "Import",

	"republic_variables_import_introduction" =>
	"Select the Global Variables you want to import to Republic Variables. Turn on &ldquo;Auto sync Global Variables&rdquo; under Configuration if you like to import all variables from this site automatically.",

	"republic_variables_import_current_site" =>
	"Import Global Variables from current site",

	"republic_variables_import_another_site" =>
	"Import Global Variables from site",

	"republic_variables_import_empty" =>
	"There are no variables to import from this site",

	"republic_variables_import_rv" =>
	"Republic Variable",

	"republic_variables_variable_exist" =>
	"Variable already exist",

  "republic_variables_copy_groups" =>
  "Import groups from Republic Variables",

  "republic_variables_copy_language" =>
  "Import languages from Republic Variables",

''=>''
);

/* End of file xmlrpc_lang.php */
/* Location: ./system/expressionengine/language/english/xmlrpc_lang.php */
