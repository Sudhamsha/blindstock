<?php

require_once PATH_THIRD.'zoo_visitor/config.php';
$errorlevel=error_reporting();
//error_reporting($errorlevel & ~E_NOTICE);

if(REQ != 'CP'){
	$lang = array(

	// -------------------------------------------
	//  Error messages
	// -------------------------------------------

	'zoo_visitor_error_missing_new_password'	=> 'Please provide a new password',
	
		'localization_disallowed' =>
		'Member localization preferences are currently disabled.',

		'accept_messages' =>
		'Accept Private Messages sent to you by other members of this site',

		'parse_smileys' =>
		'Display smiley images in entries.',

		'invalid_email_address' =>
		'You did not submit a valid email address',

		'disallowed_screen_chars' =>
		'The provided screen name is not valid',

		'return_to_forum' =>
		'Return to the forums',

		'settings_update' =>
		'Settings Update Form',

		'your_current_un_pw' =>
		'Your existing username and password',

		'access_notice' =>
		'Important notice: The administrator has changed the access requirements for this site as follows:',

		'choose_new_un' =>
		'Please choose a new username',

		'choose_new_pw' =>
		'Please choose a new password',

		'confirm_new_pw' =>
		'Confirm your new password',

		'existing_un' =>
		'Your existing username',

		'existing_pw' =>
		'Your existing password',

		'un_len' =>
		'Usernames must be at least %s characters in length',

		'pw_len' =>
		'Passwords must be at least %s characters in length',

		'yun_len' =>
		'Your username is currently %s characters long',

		'ypw_len' =>
		'Your password is currently %s characters long',

		'existing_username' =>
		'Your Existing Username',

		'existing_password' =>
		'Your Existing Password',

		'current_password' =>
		'current password',

		'new_password' =>
		'new password',

		'confirm_new_password' =>
		'confirm new password',

		'all_fields_required' =>
		'You must submit all fields',

		'invalid_existing_un_pw' =>
		'The existing username and/or password you submitted are not valid',

		'unpw_updated' =>
		'Your settings have been updated.  You may now log-in.',

		'return_to_login' =>
		'Return to login page',

		'member_login' =>
		'Member Login',

		'member_results_row' =>
		'Private Message - Member Search Results Row',

		'communications' =>
		'Communications',

		'personal_info' =>
		'Personal Info',

		'statistics' =>
		'Statistics',

		'post_statistics' =>
		'Post Statistics',

		'photo' =>
		'Member Photo',

		'no_photo' =>
		'No Photo',

		'no_info_available' =>
		'Information is not available',

		'max_characters' =>
		'Characters',

		'kb' =>
		'KB',

		'guided' =>
		'Guided',

		'normal' =>
		'Normal',

		'smileys' =>
		'Smileys',

		'signature' =>
		'Signature',

		'sig_too_big' =>
		'Signatures can only contain %x characters',

		'signature_image' =>
		'Signature Image',

		'sig_img_not_enabled' =>
		'Signature images are not enabled.',

		'no_image_exists' =>
		'Signature image does not exist',

		'signature_updated' =>
		'Signature has been updated',

		'remove_sig_image' =>
		'Remove Signature Image',

		'sig_img_removed' =>
		'Signature image has been removed',

		'update_signature' =>
		'Update Signature',

		'remove_image' =>
		'Remove Image',

		'upload_image' =>
		'Upload an Image',

		'uploads_not_allowed' =>
		'Image uploads are not enabled',

		'my_photo' =>
		'My Photo',

		'private_messages' =>
		'Private Messages',

		'view_private_messages' =>
		'View Private Messages',

		'add_to_buddy' =>
		'Add me to your Buddy List',

		'elapsed_time' =>
		'Script Executed in {elapsed_time} seconds',

		'email_console' =>
		'Email Console',

		'edit_photo' =>
		'Edit Photo',

		'update_photo' =>
		'Update Photo',

		'photos_not_enabled' =>
		'Member Photos are not currently enabled.',

		'current_photo' =>
		'Current Photo',

		'no_photo_exists' =>
		'Member photo does not exist',

		'upload_photo' =>
		'Upload Photo',

		'remove_photo' =>
		'Remove Photo',

		'photo_updated' =>
		'Member photo has been updated',

		'photo_removed' =>
		'Photo has been removed',

		'your_control_panel' =>
		'Your Control Panel',

		'control_panel_home' =>
		'Control Panel Home',

		'your_profile' =>
		'Your Public Profile',

		'edit_signature' =>
		'Edit Signature',

		'signatures_not_allowed' =>
		'Signatures are currently disabled',

		'edit_avatar' =>
		'Edit Avatar',

		'avatars_not_enabled' =>
		'Avatars are currently disabled',

		'current_avatar' =>
		'Current Avatar',

		'my_avatar' =>
		'My Avatar',

		'no_avatar' =>
		'You do not have an avatar',

		'no_user_avatar' =>
		'%s has not uploaded an avatar',

		'choose_installed_avatar' =>
		'Browse our Avatar Library',

		'max_image_size' =>
		'Max Image Size: %x X %y',

		'allowed_image_types' =>
		'Allowed Image Types: gif, jpg, png',

		'upload_an_avatar' =>
		'Upload an Avatar',

		'browse_avatars' =>
		'Browse Avatars',

		'choose_selected' =>
		'Choose Selected Avatar',

		'current_avatar_set' =>
		'Current Avatar Set:',

		'avatars_not_found' =>
		'Unable to locate the desired avatars',

		'image_assignment_error' =>
		'An error was encountered while attempting to assign your image',

		'avatar_updated' =>
		'Avatar has been updated',

		'avatar_upload_disallowed' =>
		'Avatar uploads are not currently enabled.',

		'image_max_size_exceeded' =>
		'The maximum allowed size for images is %s kilobytes',

		'invalid_image_type' =>
		'Images must be one of the following image types: jpg, jpeg, gif, png',

		'avatar_removed' =>
		'Avatar has been removed',

		'upload_avatar' =>
		'Upload Avatar',

		'update_avatar' =>
		'Update Avatar',

		'remove_avatar' =>
		'Remove Avatar',

		'gd_required' =>
		'The GD image library is required to perform this action.',

		'close_tags' =>
		'Close Tags',

		'font_formatting' =>
		'Font Formatting',

		'size' =>
		'Size',

		'search_glass' => 
		'Search Glass',

		'small' =>
		'Small',

		'medium' =>
		'Medium',

		'large' =>
		'Large',

		'very_large' =>
		'Very Large',

		'largest' =>
		'Largest',

		'color' =>
		'Color',

		'blue' =>
		'Blue',

		'red' =>
		'Red',

		'green' =>
		'Green',

		'brown' =>
		'Brown',

		'yellow' =>
		'Yellow',

		'pink' =>
		'Pink',

		'grey' =>
		'Grey',

		'purple' =>
		'Purple',

		'orange' =>
		'Orange',


		'mbr_forum_post' =>
		'Forum Topic',

		'forum_posts' =>
		'Total Posts',

		'mbr_required' =>
		'Indicates required fields',

		'mbr_screen_name_explanation' =>
		'If you leave this field blank, your screen name will be the same as your username',

		'mbr_message_disclaimer' =>
		'By sending this message, your email address will be revealed to the recipient.',

		'mbr_message_logged' =>
		'Note: Email messages are logged and viewable by site administrators',

		'most_recent_forum_topic' =>
		'Most Recent Forum Topic',

		'most_recent_forum_post' =>
		'Most Recent Forum Post',

		'login_required' =>
		'Login Required',

		'must_be_logged_in' =>
		'This page is only accessible to logged-in users with proper access privileges',

		'member_registration' =>
		'Member Registration',

		'mbr_image_gallery' =>
		'Photo Gallery',

		'mbr_view_posts_by_member' =>
		'View all posts by this member',

		'mbr_captcha' =>
		'Submit the word you see below:',

		'mbr_menu' =>
		'Menu',

		'mbr_show' =>
		'Show',

		'mbr_sort' =>
		'Sort',

		'mbr_order' =>
		'Order',

		'mbr_rows' =>
		'Rows',

		'mbr_my_account' =>
		'My Account',

		'mbr_logged_in_as' =>
		'Logged in as:',

		'mbr_logout' =>
		'Logout',

		'mbr_member_registration' =>
		'Member Registration',

		'mbr_forgotten_password' =>
		'Forgotten Password',

		'mbr_memberlist' =>
		'Member List',

		'mbr_delete' =>
		'Delete Account',

		'confirm_password' =>
		'You must confirm your password to complete this action.',

		'invalid_pw' =>
		'The password you submitted is invalid.',

		'mbr_delete_blurb' =>
		'Are you sure you wish to delete your account?  All entries, posts, comments, and other
		content associated with your account will also be deleted.',

		'mbr_delete_warning' =>
		'WARNING: THIS ACTION CANNOT BE UNDONE!',

		'final_delete_confirm' =>
		'Please confirm that you want to permanently delete your account and all associated content.',

		'cannot_delete_self' =>
		'You are not allowed to delete your own membership account.',

		'cannot_delete_super_admin' =>
		'You can not delete a Super Admin unless at least one other exists.',

		'mbr_account_deleted' =>
		'You have successfully deleted your account and all associated content.',

		'mbr_delete_notify_title' =>
		'Member account deletion at {site_name}',

		'mbr_delete_notify_message' =>
		'The following person has deleted their account: {name}',

		'notice' =>
		'Notice',

		'mbr_registration_not_allowed' =>
		'New membership accounts are not accepted at this time.',

		'mbr_login' =>
		'Login',

		'mbr_of' =>
		'of',

		'mbr_passwd_email_sent' => 
		'Password Reset Email Sent',

		'mbr_form_empty' =>
		'You must submit your username and password',

		'mbr_account_not_active' =>
		'Your membership account has not been activated yet.',

		'mbr_you_are_logged_in' =>
		'You are now logged in.',

		'mbr_you_are_logged_out' =>
		'You are now logged out.',

		'mbr_no_reset_id' =>
		'The ID number you submitted does not appear to be valid.  Please check the link you followed.',

		'mbr_id_not_found' =>
		'The code number you submitted was not found in the database.',

		'mbr_username' =>
		'Username',

		'mbr_password' =>
		'Password',

		'mbr_submit' =>
		'Submit',

		'mbr_update' =>
		'Update',

		'mbr_password_confirm' =>
		'Confirm Password',

		'mbr_auto_login' =>
		'Auto-login on future visits',

		'mbr_show_name' =>
		'Show my name in the online users list',

		'mbr_forgot_password' =>
		'Forgot your password?',

		'mbr_email_address' =>
		'Email Address',

		'mbr_email_confirm' =>
		'Confirm Email Address',

		'mbr_your_email' =>
		'Your Email Address',

		'mbr_email_short' =>
		'Email',

		'mbr_icq_console' =>
		'ICQ Console',

		'mbr_aim_console' =>
		'AOL IM',

		'mbr_aol' =>
		'AOL',

		'mbr_icq' =>
		'ICQ',

		'mbr_url' =>
		'URL',

		'mbr_msn_short' =>
		'MSN',

		'mbr_yahoo_short' =>
		'Yahoo',

		'mbr_screen_name' =>
		'Screen Name',

		'mbr_name' =>
		'Name',

		'mbr_your_url' =>
		'Your Web Site URL',

		'mbr_field_required' =>
		'The following field is required:',

		'mbr_username_length' =>
		'Usernames must be at least %x characters long',

		'mbr_password_length' =>
		'Passwords must be at least %x characters long',

		'mbr_registration_complete' =>
		'Registration Complete',

		'mbr_registration_completed' =>
		'Your registration has been successfully completed.',

		'mbr_admin_will_activate' =>
		'A site administrator will activate your account and notify you when it is ready for use.',

		'mbr_membership_instructions_email' =>
		'You have just been sent an email containing membership activation instructions.',

		'mbr_membership_instructions_cont' =>
		'Please check your email and follow the instructions contained in the email.',

		'mbr_your_are_logged_in' =>
		'You are logged-in and ready to begin using your new account.',

		'mbr_activation' =>
		'Account Activation',

		'mbr_problem_activating' =>
		'Invalid activation request.',

		'mbr_activation_success' =>
		'Your account has been activated.',

		'mbr_may_now_log_in' =>
		'You may now log in and begin using it.',

		'mbr_not_allowed_to_view_profiles' =>
		'You are not allowed to view member profiles.',

		'mbr_member_profile' =>
		'Member Profile',

		'mbr_member_group' =>
		'Member Group:',

		'mbr_last_visit' =>
		'Last Visit',

		'mbr_most_recent_entry' =>
		'Most Recent Entry',

		'mbr_most_recent_comment' =>
		'Most Recent Comment',

		'mbr_submit' =>
		'Submit',

		'mbr_join_date' =>
		'Join Date',

		'mbr_total_entries' =>
		'Total Entries',

		'mbr_total_comments' =>
		'Total Comments',

		'mbr_comments' =>
		'Comments',

		'mbr_member_timezone' =>
		'Member Time Zone',

		'mbr_member_local_time' =>
		'Member Local Time',

		'mbr_email' =>
		'Email',

		'mbr_location' =>
		'Location',

		'mbr_birthday' =>
		'Birthday',

		'mbr_your_stats' =>
		'Your Account Statistics',

		'mbr_edit_your_profile' =>
		'Edit Your Profile',

		'mbr_profile_homepage' =>
		'Profile Homepage',

		'mbr_required_fields' =>
		'Indicates required fields',

		'mbr_profile_has_been_updated' =>
		'Your profile has been successfully updated',

		'mbr_email_has_been_updated' =>
		'Your email preferences have been successfully updated',

		'mbr_email_updated' =>
		'Email Preferences Updated',

		'username_disallowed' =>
		'The administrator does not allow usernames to be changed',

		'mbr_settings_updated' =>
		'Your settings have been updated',

		'mbr_notepad' =>
		'Notepad',

		'mbr_notepad_updated' =>
		'Your notepad has been updated',

		'mbr_localization_settings_updated' =>
		'Your localization preferences have been successfully updated',

		'mbr_terms_of_service' =>
		'Terms of Service',

		'terms_of_service_text' =>
		'All messages posted at this site express the views of the author, and do not necessarily reflect the views of the owners and administrators of this site.

		By registering at this site you agree not to post any messages that are obscene, vulgar, slanderous, hateful, threatening, or that violate any laws.   We will permanently ban all users who do so.   

		We reserve the right to remove, edit, or move any messages for any reason.',

		'terms_accepted' =>
		'I agree to the terms of service',

		'mbr_terms_of_service_required' =>
		'You must click the \'agree to terms of service\' checkbox',

		'mbr_emails_not_match' =>
		'The provided emails do not match',

		'mbr_custom_field_empty' =>
		'The following field is required:',

		'mbr_all_member_groups' =>
		'All Member Groups',

		'mbr_member_name' =>
		'Member Name',

		'mbr_ascending' =>
		'Ascending',

		'mbr_descending' =>
		'Descending',

		'mbr_back_to_login' =>
		'Back to Login',

		'mbr_back_to_main' =>
		'Back to Main',

		'mbr_aol_im' =>
		'AOL Instant Messenger',

		'mbr_icq' =>
		'ICQ Number',

		'mbr_yahoo' =>
		'Yahoo Messenger',

		'mbr_msn' =>
		'MSN Messenger',

		'mbr_bio' =>
		'Member Bio',

		'mbr_interests' =>
		'Interests',

		'mbr_occupation' =>
		'Occupation',

		'mbr_email_member' =>
		'Email Console',

		'mbr_subject' =>
		'Email Subject',

		'mbr_message' =>
		'Email Message',

		'mbr_close_window' =>
		'Close Window',

		'mbr_recipient' =>
		'Email Recipient:',

		'mbr_email_not_accepted' =>
		'This member does not currently accept email.',

		'mbr_missing_fields' =>
		'All fields are required',

		'mbr_send_email' =>
		'Send Email',

		'mbr_email_forwarding' =>
		'This message was sent to you through your account at:',

		'mbr_email_forwarding_cont' =>
		'If you do not wish to receive further emails you can disable this preference in your member profile page.',

		'mbr_email_error' =>
		'An error was encountered while sending your email.',

		'mbr_good_email' =>
		'Your email has been successfully sent.',

		'mbr_send_self_copy' =>
		'Send me a copy of this email',

		'mbr_icq_number' =>
		'ICQ Number:',

		'mbr_icq_recipient' =>
		'Recipient:',

		'mbr_icq_subject' =>
		'Subject',

		'mbr_icq_message' =>
		'Message',

		'mbr_not_allowed_to_use_email_console' =>
		'You are not allowed to use the Email Console',

		'mbr_email_timelock_not_expired' =>
		'You are only allowed to use the Email Console every %x minutes.',

		'mbr_you_are_registered' =>
		'You are already registered and logged in.',

		'profile_not_available' =>
		'The member profile you requested is currently not available',

		'mbr_preferences_updated' =>
		'Preferences Updated',

		'mbr_prefereces_have_been_updated' =>
		'Member Preferences have been updated',

		'search_field' =>
		'Search Field',

		'edit_preferences' =>
		'Edit Preferences',

		'display_signatures' =>
		'Display member signatures in entries',

		'display_avatars' =>
		'Display member avatars in entries',

		'enable_smart_notifications' =>
		'Enable Smart Notification',

		'private_message' =>
		'Private Messages',

		'am_online' =>
		'I am Online',

		'send_pm' =>
		'Send Private Message',

		'member_search' =>
		'Member Search',

		'ignore_list' =>
		'Manage Ignore List',

		'ignore_list_empty' =>
		'No Members are being Ignored',

		'ignore_list_blurb' =>
		'Use this form to manage your Ignore List',

		'unignore' =>
		'Stop Ignoring',

		'ignore_member' =>
		'Ignore Member',

		'unignore_member' =>
		'Stop Ignoring Member',

		'invalid_screen_name' =>
		'Invalid Screen Name',

		'can_not_ignore_self' =>
		'You can not ignore yourself',

		'invalid_screen_name_message' =>
		'The Screen Name you have submitted is invalid',

		'ignore_list_updated' =>
		'Ignore List successfully updated',

		'delete_selected_members' =>
		'Delete selected member(s)',

		'member_search' =>
		'Member Search',

		'any' =>
		'Any',

		'search_results' =>
		'Search Results',

		'insert_member_instructions' =>
		'Click a member\'s name to add them to your Ignore List',

		'add_member' =>
		'Add Member',

		'delete_member' =>
		'Delete',

		''=>''
		
		
	);
}else{
$lang = array(
// -------------------------------------------
//  Module CP
// -------------------------------------------

'zoo_visitor_module_name' => ZOO_VISITOR_NAME,
'zoo_visitor_module_description' => ZOO_VISITOR_DESC,

// -------------------------------------------
//  Settings
// -------------------------------------------

'index_title' => 'Welcome to Zoo Visitor',
'installation_title'	=> 'Zoo Visitor Installation',
'index_button_save' => 'Save settings',
'index_button_transfer_members' => 'Transfer member data',
'zoo_visitor_channel_settings'	=> 'Member channel settings - Advanced use (do not change if you\'re not sure about the functionality)',
'member_channel_id'		=> 'Channel which you would like to use as members channel',
'anonymous_member_id'	=> 'Anonymous guest member used for registration',
'zoo_visitor_account_settings'	=> 'Member account settings',
'email_is_username'		=> 'Set username as email (login is email)',
'email_confirmation'	=> 'Require email confirmation<br/><span class="subtext">do not forget to add email_confirm input in the form</span>',
'password_confirmation'	=> 'Require password confirmation when registering<br/><span class="subtext">do not forget to add password_confirm input in the form when set to yes</span>',
'use_screen_name'		=> 'Require screen name<br/><span class="subtext">When set to no, you will be able to compose the screen_name out of custom fields</span>',
'screen_name_override'	=> 'Set screen_name as a combination of the following fields<br/><span class="subtext">Leave blank to use username</span>',
'title_override'	=> 'Set the member entry title as a combination of the following fields<br/><span class="subtext">Leave blank to use username</span>',
'zoo_visitor_activation_settings'	=> 'Member activation settings',
'redirect_after_activation'	=> 'Redirect to a specific page when member account is activated<br/><span class="subtext">Used when account activation preference is set to "No activation required" or "Self activation via email"',
'redirect_location'		=> 'Redirect location<br/><span class="subtext">ex. /account/profile</span>',
'zoo_visitor_account_status_settings'	=> 'Member status settings',
'new_entry_status'		=> 'Status of new member registration',
'incomplete_status'		=> 'Status when profile is considered incomplete',
'zoo_visitor_cp_fieldtype_settings' => 'Control panel fieldtype',
'hide_link_to_existing_member' => 'Hide "Link an existing member" for non super-admins',

'zoo_visitor_general_settings'	=> 'General settings',
'redirect_view_all_members'		=> 'Redirect the "View all members" link to the channel entries overview',
'membergroup_as_status'	        => 'Show membergroup in channel entry status',
'redirect_member_edit_profile_to_edit_channel_entry' => 'Redirect the Account "edit profile" link to the corresponding member channel entry page',

'zoo_visitor_status' => 'General',

'troubleshooting_title'		=> 'Zoo Visitor Troubleshooting',
'is_safecracker_installed'	=> 'Is Safecracker installed?',
'safecracker_installed_yes'	=> '<div class="positive">Safecracker is installed</div>',
'safecracker_installed_no'	=> '<div class="negative">Not installed. Please install it  <a href="'.BASE.AMP.'D=cp'.AMP.'C=addons_modules">on the modules page</a> if you want to enable frontend editing of member profiles.</div>',

'is_fieldtype_installed'	=> 'Is Zoo Visitor fieldtype installed?',
'fieldtype_installed_yes'	=> '<div class="positive">Fieldtype is installed</div>',
'fieldtype_installed_no'	=> '<div class="negative">Not installed, please go to Add-Ons > Fieldtypes and install the fieldtype. The fieldtype enables you to edit member username/screen name/password directly in the channel entry.</div>',

'fieldtype_not_installed'	=> 'Please install the Zoo Visitor fieldtype prior to running the installation',
'zoo_visitor_channel_installed'		=> 'Does Zoo visitor channel exists?',
'zoo_visitor_channel_exists_yes'	=> '<div class="positive">Channel exists</div>',
'zoo_visitor_channel_exists_no'		=> '<div class="negative">Channel does not exist</div>',

'zoo_visitor_fieldtype_in_channel'		=> 'Does the Zoo Visitor fieldtype exist in the channel fields?',
'zoo_visitor_fieldtype_in_channel_yes'	=> '<div class="positive">Fieldtype is present</div>',
'zoo_visitor_fieldtype_in_channel_no'	=> '<div class="negative">Fieldtype has not been added to the channel fields</div>',

'zoo_visitor_linked_with_members'		=> 'Has channel assigned?',
'zoo_visitor_linked_with_members_yes'	=> '<div class="positive">Channel has been assigned</div>',
'zoo_visitor_linked_with_members_no'	=> '<div class="negative">No channel has been assigned</div>',

'zoo_visitor_members_registration'	=> 'Registrations',
'allow_member_registration'			=> 'New ExpressionEngine member registrations are allowed?',
'allow_member_registration_yes'		=> '<div class="positive">New member registrations are allowed</div>',
'allow_member_registration_no'		=> '<div class="negative">EE new member registrations are not allowed, go to <a href="'.BASE.AMP.'C=members'.AMP.'M=member_config">Membership preferences general configuration</a> and set the "Allow New Member Registrations" option to "yes".</div>',

'guest_member_created'				=> 'Is an anonymous member created?<br/><span class="subtext">Required for member registrations</span>',
'guest_member_created_yes'			=> '<div class="positive">An anonymous Guest member exists</div>',
'guest_member_created_no'			=> '<div class="negative">An anonymous Guest member does not exist or is not linked with Zoo Visitor, go to the Zoo Visitor settings and select a member you want to use as anonymous Guest member.</div>',

'guest_member_posts'				=> 'Guest membergroup can create entries in Zoo Visitor Member channel?',
'guest_member_posts_allowed_yes'	=> '<div class="positive">Guests can register</div>',
'guest_member_posts_allowed_no'		=> '<div class="negative">registrations are not possible, go to <a href="'.BASE.AMP.'C=members'.AMP.'M=edit_member_group'.AMP.'group_id=3">Guest membergroup settings</a> &raquo; "Channel assignment" and set the "Can post and edit entries" option to "yes" for the Zoo Visitor channel.</div>',

'zoo_visitor_examples'				=> 'Examples',
'example_templategroup_exists'		=> 'Zoo Visitor examples are installed?',
'example_templategroup_exists_yes'	=> '<div class="positive">Examples exist. They can be located at your_site_root/zoo_visitor_example/profile</div>',
'example_templategroup_exists_no'	=> '<div class="negative">Examples do not exist</div>',

'zoo_visitor_installation'			=> 'Zoo Visitor Auto-installation',
'zoo_visitor_channel_installation'	=> 'Zoo Visitor channel will be created',
'zoo_visitor_fieldtype_in_channel_installation'	=> 'Zoo Visitor fieldtype will be added to the channel fields',
'zoo_visitor_linked_with_members_installation'	=> 'Zoo Visitor channel will be configured to be used as Members channel',
'guest_member_posts_installation'	=> 'Allow "Guests" membergroup to be able to post/edit in the Zoo Visitor channel',
'guest_member_create_installation'	=> 'Create anonymous Zoo Visitor Guest member (required to use registration form)',
'example_templategroup_installation'=> 'Install example login/register/profile/password_change/login change templates which serve as a starting point',

'zoo_visitor_manual_installation'	=> 'Safecracker Manual installation',
'safecracker_installation'			=> 'Install Safecracker (required for frontend forms)',

'installation_done'					=> '<div class="positive">Done</div>',
'installation_not_done'				=> '<div class="negative">Not created</div>',
'installation_templates_not_done'	=> '<div class="negative">Not created - <a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=zoo_visitor'.AMP.'method=install_visitor"  >Install examples &raquo;</a></div>',

// -------------------------------------------
//  Error messages
// -------------------------------------------
'zoo_visitor_error_can_admin_members' => 'You need to be assigned rights to administrate member accounts.',
'zoo_visitor_error_no_member_channel' => 'No member channel has been specified, check your Zoo Visitor settings',
'zoo_visitor_error_non_existing_member_channel' => 'The member channel specified in your Zoo Visitor settings does not exist.',
'zoo_visitor_error_non_existing_anonymous_member'	=> 'The selected anonymous member does not exist, check you Zoo Visitor settings',
'zoo_visitor_error_missing_new_password'	=> 'Please provide a new password',

// ========
// = Sync =
// ========
'sync_title'	=> 'Transfer members data',
'zoo_visitor_channel_does_not_exists_txt'	=> 'Zoo Visitor member channel does not exist, please check you installation.',
'custom_member_fields'	=> 'Custom member fields',
'standard_member_fields'	=> 'Standard member fields',
'select_member_fields'	=> 'Select member fields',
'sync_explanation'		=> '<fieldset><legend><h4>Instructions</h4></legend>
<b>This method can be used to transfer existing members into your Zoo Visitor channel.</b><br/><br/>
1. Select the fields you want to transfer to your member channel. Submit the form.<br/><br/>
2. Corresponding channel fields will automatically be created in the Visitor channel field group. The created fieldnames will use "mbr_" as a prefix.<br/><br/>
3. Member entries will be created for those who don\'t have a corresponding channel entry yet. Selected field data will be transferred.<br/><br/>
<!-- When using {exp:zoo_visitor:sync} in your templates, the same fields as checked here will be used.  This sync tag can be used whenever a new member has been registered through another add-on and you want to transfer this data directly into th extended Visitor profile. Can be used in combination with Membrr registrations, Solspace Facebook Connect, etc... Just place this tag on the registration success page of these add-ons.<br/><br/>
<div class="notice">Important: Make sure you create a db backup prior to synchronizing--></div>
<!-- 4. These selected fields will also be used when using the sync tag.--><br/></fieldset><br/>',
'sync_submitted'	=> '<fieldset style="text-align:center;"><legend><b></b></legend><h3>Members have been transferred.</h3></fieldset><br/>',
// =========
// = Zenbu =
// =========
'zenbu_show_username'	=> 'Show username',
'zenbu_show_screen_name'	=> 'Show screen name',
'zenbu_show_email'	=> 'Show email',
'zenbu_show_member_group'	=> 'Show membergroup'
);
}