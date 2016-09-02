<div id='troubleshooting'>
<?php
	$this->table->clear();
	$this->table->set_template($cp_table_template);
	$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_status')));

	if (version_compare(APP_VER, 2.7, '<')) {
		$this->table->add_row(
			array('width' => '50%', 'data' => form_label(lang('is_safecracker_installed'), 'Is safecracker installed?')),
			$safecracker_installed
		);
	}
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('is_fieldtype_installed'), 'Is Zoo Visitor fieldtype installed?')), 
		$fieldtype_installed
	);
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('zoo_visitor_channel_installed'), 'Does Zoo Visitor channel exist?')), 
		$zoo_visitor_channel_exists
	);
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('zoo_visitor_fieldtype_in_channel'), 'Is Zoo Visitor field linked with channel')), 
		$zoo_visitor_fieldtype_in_channel
	);
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('zoo_visitor_linked_with_members'), 'Is Zoo Visitor channel linked with Members?')), 
		$zoo_visitor_linked_with_members
	);
	echo $this->table->generate();


	$this->table->clear();
	$this->table->set_template($cp_table_template);
	$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_members_registration')));

	//if not allow, provide link to settings page
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('allow_member_registration'), 'Are member registrations enabled in ExpressionEngine?')), 
		$allow_member_registration
	);
	
	//if not allow, provide link to settings page
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('guest_member_posts'), 'Are Guest members allowed to post in Zoo Visitor channel?')), 
		$guest_member_posts_allowed
	);
	//if not allow, provide link to settings page
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('guest_member_created'), 'Is an anonymous Guest member assigned for registrations?')), 
		$guest_member_created
	);
	echo $this->table->generate();


	$this->table->clear();
	$this->table->set_template($cp_table_template);
	$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_examples')));

	//if exists, provide link 
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('example_templategroup_exists'), 'Example template group exists?')), 
		$example_templategroup_exists
	);
	
	echo $this->table->generate();	
?>
</div>