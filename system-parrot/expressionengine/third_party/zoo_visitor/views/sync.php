<?php 

if($submitted)
{
	echo lang('sync_submitted');	
}

echo lang('sync_explanation');

if($zoo_visitor_channel_exists)
{
	echo form_open($form_base.AMP.'method=sync');
	
	$this->table->clear();
	$this->table->set_template($cp_table_template);
	$this->table->set_heading(array('colspan'=>4, 'data'=>lang('select_member_fields')));
	
	// ===================
	// = Standard fields =
	// ===================
	$standard_fields = '';
	$post_standard_member_fields = (isset($_POST['standard_member_fields'])) ? $_POST['standard_member_fields'] : array();
	
	foreach($standard_member_fields as $field)
	{
		$standard_fields .= '<div>'.form_checkbox('standard_member_fields[]', $field, in_array($field, $standard_member_fields_checked) )." ".$field.'</div>';
	}
	
	$this->table->add_row(
		array('width' => '50%', 'data' => form_label(lang('standard_member_fields'), 'Standard member fields')), 
		$standard_fields
	);
	
	// =================
	// = custom fields =
	// =================
	$custom_fields = '';
	$post_custom_member_fields = (isset($_POST['custom_member_fields'])) ? $_POST['custom_member_fields'] : array();
	
	foreach($custom_member_fields as $id => $name)
	{
		$custom_fields .= '<div>'.form_checkbox('custom_member_fields[]', $id, in_array($id, $custom_member_fields_checked))." ".$name.'</div>';
	}

	if($custom_fields != '')
	{
		$this->table->add_row(
			array('width' => '50%', 'data' => form_label(lang('custom_member_fields'), 'Custom member fields')), 
			$custom_fields
		);
	}
	
	$this->table->add_row(
		array('width' => '50%', 'data' => '&nbsp;'), 
		form_submit(array('name' => 'submit', 'value' => lang('index_button_transfer_members'), 'class' => 'submit'))
	);

	echo $this->table->generate();
	$this->table->clear();
	
	echo form_close();
	
}
else
{
	echo '<h3>'.lang('zoo_visitor_channel_does_not_exists_txt').'</h3>';

}

?>