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

<?php if(sizeof($languages) > 0):?>
<!-- Module configuratinos -->
<?php echo form_open($action_url, '', FALSE)?>
<table id="sort_table" class="mainTable" data-action="reorder_languages" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>
			<th><?php echo lang('republic_variables_label_language'); ?></th>
			<?php if ($settings['show_language_prefix'] === 'y') : ?>
				<th><?php echo lang('republic_variables_label_language_prefix'); ?></th>
			<?php endif;?>
			<?php if ($settings['show_language_postfix'] === 'y') : ?>
				<th><?php echo lang('republic_variables_label_language_postfix'); ?></th>
			<?php endif;?>
			<th><?php echo lang('republic_variables_label_language_direction');?></th>
			<th><?php echo lang('republic_variables_configuration_default_language'); ?></th>
			<th><?php echo lang('republic_variables_delete'); ?></th>
		</tr>
	</thead>
	<tbody>
		<?php $i = 0; ?>
		<?php foreach ($languages AS $language) : ?>
			<?php $language_id = $language['language_id']; ?>
			<tr id="id_<?php echo $language['language_id']?>" data-id="<?php echo $language['language_id']?>" class="sort <?php if ($i++ % 2 == 0) : ?>even<?php else:?>odd<?php endif;?>">
				<td class="move"></td>
				<td><input name="language_id[<?php echo $language_id;?>]" value="<?php echo $language_id;?>" type="hidden" /><label><?php echo $language['language_name']; ?></label></td>
				<?php if ($settings['show_language_prefix'] === 'y') : ?>
					<td>
						<input name="old_prefix[<?php echo $language_id;?>]" value="<?php echo set_value('old_prefix[' . $language_id . ']', $language['language_prefix']); ?>" type="hidden" />
						<input name="language_prefix[<?php echo $language_id;?>]" value="<?php echo set_value('language_prefix[' . $language_id . ']', $language['language_prefix']); ?>" type="text" />
					</td>
				<?php else : ?>
					<input type="hidden" name="old_prefix[<?php echo $language_id;?>]" value="" />
					<input type="hidden" name="language_prefix[<?php echo $language_id;?>]" value="" />
				<?php endif;?>

				<?php if ($settings['show_language_postfix'] === 'y') : ?>
				<td>
					<input name="old_postfix[<?php echo $language['language_id'];?>]" value="<?php echo set_value('old_postfix[' . $language_id . ']', $language['language_postfix']); ?>" type="hidden" />
					<input name="language_postfix[<?php echo $language['language_id'];?>]" value="<?php echo set_value('language_postfix[' . $language_id . ']', $language['language_postfix']); ?>" type="text" />
				</td>
				<?php else : ?>
					<input type="hidden" name="old_postfix[<?php echo $language_id;?>]" value="" />
					<input type="hidden" name="language_postfix[<?php echo $language_id;?>]" value="" />
				<?php endif;?>
				<td>
					<?php $ltr = ($language['language_direction'] === 'ltr') ? TRUE : FALSE; ?>
					<?php $rtl = ($language['language_direction'] === 'rtl') ? TRUE : FALSE; ?>
					<select name="language_direction[<?php echo $language['language_id'];?>]">
						<option value="ltr" <?php echo set_select('language_direction', 'ltr', $ltr); ?> ><?php echo lang('republic_variables_label_language_ltr');?></option>
						<option value="rtl" <?php echo set_select('language_direction', 'rtl', $rtl); ?> ><?php echo lang('republic_variables_label_language_rtl');?></option>
					</select>
				</td>
				<td class="default_lang">
					<?php $is_checked = ($settings['default_language'] == $language_id) ? "checked=checked" : ""; ?>
					<input type="radio" value="<?php echo $language_id;?>" name="default_language" <?php echo $is_checked;?> />
				</td>
				<td class="delete_button"><a href="<?php echo BASE.AMP.$module_url.AMP.'method=language_delete'.AMP.'id='.$language_id;?>" class="delete">Delete</a>
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
  <p><?php echo lang('republic_variable_no_language'); ?> <a href="<?php echo BASE.AMP.$module_url.AMP.'method=language_add'?>"><?php echo lang('republic_variable_add_new_group'); ?></a>.</p>
<?php endif;?>

</div>
