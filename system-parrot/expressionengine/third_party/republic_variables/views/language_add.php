
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

<?php echo form_open($action_url, '', FALSE)?>
<table class="mainTable" border="0" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>Configuration</th>
			<th>Value</th>
		</tr>
	</thead>
	<tbody>
		<tr class="even">
			<td style="width: 50%;"><label for="language_name"><?php echo lang('republic_variables_label_language_name');?></label></td>
			<td><input id="language_name" name="language_name" value="<?php echo set_value('language_name');?>" type="text" /></td>
		</tr>
		<?php if ($settings['show_language_prefix'] === 'y') : ?>
			<tr class="odd">
				<td><label for="language_prefix"><?php echo lang('republic_variables_label_language_prefix'); ?></label><div class="subtext"><?php echo lang('republic_variables_label_variable_name_desc');?></div></td>
				<td><input id="language_prefix" name="language_prefix" value="<?php echo set_value('language_prefix');?>" type="text" /></td>
			</tr>
		<?php else : ?>
			<input type="hidden" name="language_prefix" value="" />
		<?php endif;?>

		<?php if ($settings['show_language_postfix'] === 'y') : ?>
			<tr class="odd">
				<td><label for="language_postfix"><?php echo lang('republic_variables_label_language_postfix'); ?></label><div class="subtext"><?php echo lang('republic_variables_label_variable_name_desc');?></div></td>
				<td><input id="language_postfix" name="language_postfix" value="<?php echo set_value('language_postfix');?>" type="text" /></td>
			</tr>
		<?php else : ?>
			<input type="hidden" name="language_postfix" value="" />
		<?php endif;?>
		<tr class="even">
			<td style="width: 50%;"><label for="language_direction"><?php echo lang('republic_variables_label_language_direction');?></label></td>
			<td>
				<select name="language_direction">
					<option value="ltr" <?php echo set_select('language_direction', 'ltr', TRUE); ?> ><?php echo lang('republic_variables_label_language_ltr');?></option>
					<option value="rtl" <?php echo set_select('language_direction', 'rtl'); ?> ><?php echo lang('republic_variables_label_language_rtl');?></option>
				</select>
			</td>
		</tr>
	</tbody>
</table>



<div class="tableFooter">
	<div class="tableSubmit">
		<?php echo form_submit(array('name' => 'submit', 'value' => $action, 'class' => 'submit'))?>
	</div>
</div>

<?php echo form_close()?>


