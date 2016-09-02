
<!-- Module configuratinos -->
<?php if(isset($message_error) AND $message_error != ""):?>
  <div class="failure">
    <p><?php echo $message_error;?></p>
    <?php echo validation_errors(); ?>
  </div>
<?php endif;?>

<?php echo form_open($action_url, '', FALSE)?>

<table class="mainTable" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th style="width: 50%;"><?php echo lang('republic_variables_label_key'); ?></th>
			<th><?php echo lang('republic_variables_label_value'); ?></th>
		</tr>
	</thead>
	<tbody>
		<tr class="even">
			<td><label for="new_group_name"><?php echo lang('republic_variables_label_group_name'); ?></label></td>
			<td><input id="new_group_name" name="new_group_name" value="<?php echo set_value('new_group_name'); ?>" type="text" /></td>
		</tr>
		<tr class="odd">
			<td><label for="variable_parse_yes"><?php echo lang('republic_variables_label_admin_only'); ?></label></td>
			<td>
				<?php foreach ($member_groups AS $key => $member_group) : ?>
						<input id="group_<?php echo $key;?>" type="checkbox" name="group_access[]" value="<?php echo $key;?>" checked=checked <?php if($key === 1):?> disabled<?php endif;?>>
						<label for="group_<?php echo $key;?>"><?php echo $member_group;?></label><br />
					<?php endforeach; ?>
			</td>
		</tr>
	</tbody>
</table>

<div class="tableFooter">
	<div class="tableSubmit">
		<?php echo form_submit(array('name' => 'submit', 'value' => lang('republic_variables_add'), 'class' => 'submit'))?>
	</div>
</div>

<?php echo form_close()?>


