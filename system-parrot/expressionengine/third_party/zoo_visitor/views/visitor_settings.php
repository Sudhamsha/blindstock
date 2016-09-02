<script>
$(document).ready(function() {
  
	if('<? echo $settings['use_screen_name']; ?>' == 'yes'){
		
		$('.screen_name_row').hide();
		
	}
	
	$('#use_screen_name').change(function() {
		if($(this).val() == 'no')
		{
			$('.screen_name_row').show();
		}
		else
		{
			$('.screen_name_row').hide();
		}
	});

});

</script>

<?php 

echo form_open($form_base.AMP.'method=settings_save');

// Settings
$this->table->set_template($cp_table_template);
$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_account_settings')));

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('email_is_username'), 'email_is_username')), 
	form_dropdown('email_is_username', array('no'=>'No','yes'=>'Yes'), $settings['email_is_username'])
);

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('use_screen_name'), 'use_screen_name')), 
	form_dropdown('use_screen_name', array('no'=>'No','yes'=>'Yes'), $settings['use_screen_name'], ' id="use_screen_name"')
);

$this->table->add_row(
	array('width' => '35%', 'class' => 'screen_name_row', 'data' => form_label(lang('screen_name_override'), 'screen_name_override')), 
	array('class' => 'screen_name_row', 'data' => form_input('screen_name_override', $settings['screen_name_override']).'<div class="notice">'.$screen_name_field_errors.'</div>')
	
);

$this->table->add_row(
	array('width' => '35%', 'class' => 'title_row', 'data' => form_label(lang('title_override'), 'title_override')), 
	array('class' => 'title_row', 'data' => form_input('title_override', $settings['title_override']).'<div class="notice">'.$title_field_errors.'</div>')
	
);
$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('email_confirmation'), 'email_confirmation')), 
	form_dropdown('email_confirmation', array('no'=>'No','yes'=>'Yes'), $settings['email_confirmation'])
);

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('password_confirmation'), 'password_confirmation')), 
	form_dropdown('password_confirmation', array('no'=>'No','yes'=>'Yes'), $settings['password_confirmation'])
);




echo $this->table->generate();
$this->table->clear();


$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_general_settings')));

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('redirect_view_all_members'), 'redirect_view_all_members')),
	form_dropdown('redirect_view_all_members', array('no'=>'No','yes'=>'Yes'), $settings['redirect_view_all_members'])
);

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('redirect_member_edit_profile_to_edit_channel_entry'), 'redirect_member_edit_profile_to_edit_channel_entry')),
	form_dropdown('redirect_member_edit_profile_to_edit_channel_entry', array('no'=>'No','yes'=>'Yes'), $settings['redirect_member_edit_profile_to_edit_channel_entry'])
);

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('membergroup_as_status'), 'membergroup_as_status')),
	form_dropdown('membergroup_as_status', array('no'=>'No','yes'=>'Yes'), $settings['membergroup_as_status'])
);

//$this->table->add_row(
//	array('width' => '35%', 'data' => form_label(lang('delete_member_when_deleting_entry'), 'delete_member_when_deleting_entry')),
//	form_dropdown('delete_member_when_deleting_entry', array('no'=>'No','yes'=>'Yes'), $settings['delete_member_when_deleting_entry'])
//);

echo $this->table->generate();
$this->table->clear();




$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_cp_fieldtype_settings')));

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('hide_link_to_existing_member'), 'hide_link_to_existing_member')), 
	form_dropdown('hide_link_to_existing_member', array('no'=>'No','yes'=>'Yes'), $settings['hide_link_to_existing_member'])
);

echo $this->table->generate();
$this->table->clear();



$this->table->set_template($cp_table_template);
$this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_channel_settings')));

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('member_channel_id'), 'member_channel_id')), 
	form_dropdown('member_channel_id', $channels, $settings['member_channel_id']
	)
);

$this->table->add_row(
	array('width' => '35%', 'data' => form_label(lang('anonymous_member_id'), 'anonymous_member_id')), 
	form_dropdown('anonymous_member_id', $members, $settings['anonymous_member_id']
	)
);

echo $this->table->generate();
$this->table->clear();


// We found a code intruder in the Zoo!  Release the hounds!
// $this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_activation_settings')));
// 
// 
// $this->table->add_row(
// 	array('width' => '35%', 'data' => form_label(lang('redirect_after_activation'), 'redirect_after_activation')), 
// 	form_dropdown('redirect_after_activation', array('no'=>'No','yes'=>'Yes'), $settings['redirect_after_activation'])
// );
// 
// $this->table->add_row(
// 	array('width' => '35%', 'data' => form_label(lang('redirect_location'), 'redirect_location')), 
// 	form_input('redirect_location', $settings['redirect_location'])
// );
// 
// 
// echo $this->table->generate();
// $this->table->clear();
// 
// $this->table->set_heading(array('colspan'=>4, 'data'=>lang('zoo_visitor_account_status_settings')));
// 
// 
// $this->table->add_row(
// 	array('width' => '35%', 'data' => form_label(lang('new_entry_status'), 'new_entry_status')), 
// 	form_input('new_entry_status', $settings['new_entry_status'])
// );
// 
// $this->table->add_row(
// 	array('width' => '35%', 'data' => form_label(lang('incomplete_status'), 'incomplete_status')), 
// 	form_input('incomplete_status', $settings['incomplete_status'])
// );
// 
// echo $this->table->generate();

echo form_submit(array('name' => 'submit', 'value' => lang('index_button_save'), 'class' => 'submit'));
echo form_close();
?>