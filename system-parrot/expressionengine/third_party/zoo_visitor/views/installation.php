<div id='installation'>
<?php
	
	if($errors != '')
	{
		echo '<h3><div class="negative">'.lang($errors).'</div></h3>';
	}
	$this->table->clear();
	$this->table->set_template($cp_table_template);
	$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_installation')));
	
	$zoo_visitor_channel_exists_txt = ($zoo_visitor_channel_exists) ? lang('installation_done') : lang('installation_not_done');
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label('1. '.lang('zoo_visitor_channel_installation'), 'Does Zoo Visitor channel exist?')), 
		$zoo_visitor_channel_exists_txt
	);
	
	$zoo_visitor_fieldtype_in_channel_txt = ($zoo_visitor_fieldtype_in_channel) ? lang('installation_done') : lang('installation_not_done');
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label('2. '.lang('zoo_visitor_fieldtype_in_channel_installation'), 'Is Zoo Visitor field linked with channel')), 
		$zoo_visitor_fieldtype_in_channel_txt
	);
	
	$zoo_visitor_linked_with_members_txt = ($zoo_visitor_linked_with_members) ? lang('installation_done') : lang('installation_not_done');
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label('3. '.lang('zoo_visitor_linked_with_members_installation'), 'Is Zoo Visitor channel linked with Members?')), 
		$zoo_visitor_linked_with_members_txt
	);

	//if not allow, provide link to settings page
	$guest_member_posts_allowed_txt = ($guest_member_posts_allowed) ? lang('installation_done') : lang('installation_not_done');
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label('4 '.lang('guest_member_posts_installation'), 'Are Guest members allowed to post in Zoo Visitor channel?')), 
		$guest_member_posts_allowed_txt
	);

	//generate anonymous guest member required to register
	$guest_member_create_txt = ($guest_member_create) ? lang('installation_done') : lang('installation_not_done');
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label('5 '.lang('guest_member_create_installation'), 'Are Guest members allowed to post in Zoo Visitor channel?')), 
		$guest_member_create_txt
	);

	//if exists, provide link 
	$example_templategroup_exists_txt = ($example_templategroup_exists) ? lang('installation_done') : lang('installation_templates_not_done');
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label('6. '.lang('example_templategroup_installation'), 'Example template group exists?')), 
		$example_templategroup_exists_txt
	);
	
	if(!$zoo_visitor_installed){
		$status = '';
 		$bt = '<a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=zoo_visitor'.AMP.'method=install_visitor"  class="submit">START INSTALLATION &raquo;</a>';

	}else{
		$status = '<div id="zoo_visitor_installed"><div class="zoo_logo">&nbsp;</div><div class="content">Zoo Visitor is installed</div></div>';
		$bt = '';
	}

	

	$this->table->add_row(
		array('data'=>$status.$bt,
		'colspan' => 2,
		'style'=>'text-align:center; padding:14px;')
	);

	echo $this->table->generate();

	$this->table->clear();

	if (version_compare(APP_VER, 2.7, '<')) {
		$this->table->set_template($cp_table_template);
		$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_manual_installation')));

		$safecracker_installed_txt = ($safecracker_installed) ? lang('safecracker_installed_yes') : lang('safecracker_installed_no');
		$this->table->add_row(
			array('width' => '50%', 'data' => form_label(lang('safecracker_installation'), 'Is safecracker installed?')),
			$safecracker_installed_txt
		);

		echo $this->table->generate();
	}
?>
</div>
