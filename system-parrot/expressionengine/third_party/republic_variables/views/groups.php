<div id="variables">
<?php if(isset($message_error) AND $message_error != ""):?>
  <div class="failure">
    <?php if(is_array($message_error)):?>
      <?php foreach($message_error AS $error):?>
        <p><?php echo $error;?></p>
      <?php endforeach;?>
    <?php else:?>
      <p><?php echo $message_error;?></p>
    <?php endif;?>
    <?php echo validation_errors(); ?>
  </div>
<?php endif;?>

<?php if ( ! empty($groups)) : ?>
<!-- Module configuratinos -->
<?php echo form_open($action_url, '', FALSE)?>
<table id="sort_table" class="mainTable" data-action="reorder_groups" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th></th>
			<th><?php echo lang('republic_variables_label_group_name'); ?></th>
			<th><?php echo lang('republic_variables_label_admin_only'); ?></th>
			<th><?php echo lang('republic_variables_delete'); ?></th>
		</tr>
	</thead>
	<tbody>
		<?php $i = 0;?>
		<?php foreach($groups AS $group) : ?>
			<tr id="id_<?php echo $group['group_id']?>" data-id="<?php echo $group['group_id']?>" class="sort <?php if ( $i++ % 2 == 0) : ?>even<?php else : ?>odd<?php endif;?>">
				<td class="move"></td>
				<td>
					<?php $group_id = $group['group_id']?>
					<?php echo set_value('group_name[$group_id]'); ?>
					<input type="hidden" name="group_id[<?php echo $group['group_id'];?>]" value="<?php echo $group['group_id'];?>" />
					<input type="text" name="group_name[<?php echo $group['group_id'];?>]" value="<?php echo set_value('group_name[' . $group_id . ']', $group['group_name']); ?>" />
				</td>
				<td>
					<?php $group['group_access'] = unserialize($group['group_access']); ?>
					<?php foreach ($member_groups AS $key => $member_group) : ?>
						<?php $is_selected = (is_array($group['group_access']) && in_array($key, $group['group_access']) OR $key === '1') ? "checked=checked" : ""; ?>
						<input id="group_<?php echo $key;?>_<?php echo $group['group_id'];?>" type="checkbox" name="group_access[<?php echo $group['group_id'];?>][]" value="<?php echo $key;?>" <?php echo $is_selected; ?> <?php if($key === 1):?> disabled<?php endif;?>>
						<label for="group_<?php echo $key;?>_<?php echo $group['group_id'];?>"><?php echo $member_group;?></label><br />
					<?php endforeach; ?>
				</td>
				<td>
					<a href="<?php echo BASE.AMP.$module_url.AMP.'method=group_delete'.AMP.'id='.$group['group_id'];?>" class="delete"><?php echo lang('republic_variables_delete');?></a>
				</td>
			</tr>
		<?php endforeach;?>
	</tbody>
</table>

<div class="tableFooter">
	<div class="tableSubmit">
		<?php echo form_submit(array('name' => 'submit', 'value' => lang('update'), 'class' => 'submit'))?>
	</div>
</div>

<?php echo form_close()?>

<?php else: ?>
  <p><?php echo lang('republic_variable_no_groups');?> <a href="<?php echo BASE.AMP.$module_url.AMP.'method=group_add'?>"><?php echo lang('republic_variable_add_new_groups');?></a>.</p>
<?php endif;?>
</div>
