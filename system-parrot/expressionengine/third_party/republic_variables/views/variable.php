<?php if(isset($message_error) AND $message_error != ""):?>
	<div class="failure">
		<p><?php echo $message_error;?></p>
		<?php echo validation_errors(); ?>
	</div>
<?php endif;?>

<div id="variable_add">
	<!-- Module configuratinos -->
	<?php echo form_open($action_url, '', FALSE)?>

	<table class="mainTable" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th colspan='2'><?php echo lang('republic_variables_variable_heading'); ?></th>
			</tr>
		</thead>
		<tbody>
			<tr class="even">
				<td style='width: 50%'>
					<label for="variable_group_id"><?php echo lang('republic_variables_label_choose_group');?></label>
				</td>
				<td>
					<?php if ( $module_access):?>
						<select name="variable_group_id" id="variable_group_id">
							<option value="0" selected="selected"><?php echo lang('republic_variables_label_choose_group');?></option>
							<?php foreach ($groups AS $group) : ?>
								<?php $is_selected = ( set_value('variable_group_id', $variable['variable_group_id']) == $group['group_id'] ) ? "selected=selected" : ""; ?>
								<option value="<?php echo $group['group_id'];?>" <?php echo $is_selected;?>><?php echo $group['group_name'];?></option>
							<?php endforeach; ?>
						</select>
					<?php else:?>
						<?php foreach ($groups AS $group) : ?>
							<?php if ($variable['variable_group_id'] === $group['group_id']):?>
								<label class="readonly"><?php echo $group['group_name'];?></label>
							<?php endif;?>
						<?php endforeach; ?>

						<input type="hidden" name="variable_group_id" value="<?php echo $variable['variable_group_id'];?>" />
					<?php endif;?>
				</td>
			</tr>
			<tr class="odd">
				<td>
					<label for="variable_name"><?php echo lang('republic_variables_label_variable_name'); ?></label>
					<?php if ( $module_access):?><div class="subtext"><?php echo lang('republic_variables_label_variable_name_desc'); ?></div><?php endif;?>
				</td>
				<td>
					<?php if ($module_access):?>
						<input type="text" id="variable_name" name="variable_name" value="<?php echo set_value('variable_name', $variable['variable_name']); ?>"  />
					<?php else:?>
						<label class="readonly"><?php echo $variable['variable_name'];?></label>
						<input type="hidden" name="variable_name" value="<?php echo $variable['variable_name'];?>" />
					<?php endif;?>
				</td>
			</tr>
			<tr class="even">
				<td>
					<label for="variable_description"><?php echo lang('republic_variables_label_variable_description'); ?></label>
				</td>
				<td>
					<input type="text" id="variable_description" name="variable_description" value="<?php echo set_value('variable_description', $variable['variable_description']); ?>"  />
				</td>
			</tr>

			<tr class="odd" <?php if ( ! $module_access):?>style="display: none"<?php endif;?>>
				<td>
					<label for="variable_parse_yes"><?php echo lang('republic_variables_label_variable_parse'); ?></label>
				</td>
				<td>
					<?php $yes_selected = (set_value('variable_parse', $variable['variable_parse']) === 'y') ? "checked=checked" : ""; ?>
					<?php $no_selected  = (set_value('variable_parse', $variable['variable_parse']) === 'n' OR set_value('variable_parse', $variable['variable_parse']) === '' ) ? "checked=checked" : ""; ?>
					<input type="radio" name="variable_parse" value="y" id="variable_parse_yes" <?php echo $yes_selected; ?> />
					<label for="variable_parse_yes"><?php echo lang('yes');?></label>
					<input type="radio" name="variable_parse" value="n" id="variable_parse_no" <?php echo $no_selected; ?> style="margin-left: 12px" />
					<label for="variable_parse_no"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="even" <?php if (!$module_access || $settings['allow_to_save_to_files'] === 'n'):?>style="display: none"<?php endif;?>>
				<td>
					<label for="save_to_file_yes"><?php echo lang('republic_variables_label_save_to_file'); ?></label>
				</td>
				<td>
					<?php $yes_selected = (set_value('save_to_file', $variable['save_to_file']) === 'y') ? "checked=checked" : ""; ?>
					<?php $no_selected  = (set_value('save_to_file', $variable['save_to_file']) === 'n' OR set_value('save_to_file', $variable['save_to_file']) === '' ) ? "checked=checked" : ""; ?>
					<input type="radio" name="save_to_file" value="y" id="save_to_file_yes" <?php echo $yes_selected; ?> />
					<label for="save_to_file_yes"><?php echo lang('yes');?></label>
					<input type="radio" name="save_to_file" value="n" id="save_to_file_no" <?php echo $no_selected; ?> style="margin-left: 12px" />
					<label for="save_to_file_no"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr <?php if ($settings['allow_to_save_to_files'] === 'y'):?>class="test even"<?php else:?>class="odd"<?php endif;?> <?php if ( ! $module_access):?>style="display: none"<?php endif;?>>
				<td>
					<label for="use_language_yes"><?php echo lang('republic_variables_label_use_language'); ?></label>
					<?php if ( $module_access):?><div class="subtext"><?php echo lang('republic_variables_label_use_language_desc'); ?></div><?php endif;?>
				</td>
				<td>
					<?php if( ! empty($languages)) : ?>
						<?php $yes_selected = (set_value('use_language', $variable['use_language']) === 'y') ? "checked=checked" : ""; ?>
						<?php $no_selected  = (set_value('use_language', $variable['use_language']) === 'n' OR set_value('use_language', $variable['use_language']) === '' ) ? "checked=checked" : ""; ?>
						<input type="radio" name="use_language" value="y" id="use_language_yes" <?php echo $yes_selected; ?> />
						<label for="use_language_yes"><?php echo lang('yes');?></label>
						<input type="radio" name="use_language" value="n" id="use_language_no" <?php echo $no_selected; ?> style="margin-left: 12px" />
						<label for="use_language_no"><?php echo lang('no');?></label>
					<?php else: ?>
						<?php echo lang('republic_variables_language_must_exist_to_use'); ?>
						<input type="hidden" name="use_language" value="y" />
					<?php endif;?>
				</td>
			</tr>

			<tr class="odd <?php if ($settings['show_default_variable_value'] === 'n'):?>hidden<?php endif;?>" id="default_value_row" <?php if ($settings['show_default_variable_value'] === 'n' && $variable['use_language'] === 'y') : ?>style="display:none"<?php endif; ?>>
				<td>
					<label for="variable_data">
						<?php if ($settings['overwrite_default_variable_value'] !== '') : ?>
							<?php echo $settings['overwrite_default_variable_value'];?>
						<?php else : ?>
							<?php echo lang('republic_variables_label_variable_value');?>
						<?php endif;?>
					</label>
				</td>
				<td>
					<div class="expandingArea">
					  <pre><span></span><br></pre>
						<textarea id="variable_data" name="variable_data" cols="30" rows="4" dir="<?php echo $settings['default_language_direction'];?>"><?php echo set_value('variable_data', $variable['variable_data']); ?></textarea>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<?php if( ! empty($languages)) : ?>
		<table id="language_table" class="mainTable" border="0" cellpadding="0" cellspacing="0" <?php if ($variable['use_language'] === 'n'): ?>style="display: none"<?php endif;?>>
			<thead>
				<tr>
					<th style='width:50%;'><?php echo lang('republic_variables_label_language'); ?></th>
					<th><?php echo lang('republic_variables_label_value'); ?></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach($languages AS $language) : ?>
				<tr class="even">
					<td>
						<label for="lang_<?php echo $language['language_id'];?>">
						<?php echo $language['language_name'];?><br />
						<?php if (isset($variable['lang_'.$language['language_id']])):?>{<?php echo $language['language_prefix'];?><span class="variable_name"><?php echo $variable['variable_name'];?></span><?php echo $language['language_postfix'];?>}<?php endif;?>
						</label>
					</td>
					<td>
						<?php if (isset($variable['lang_'.$language['language_id']])):?>
							<div class="expandingArea">
							  <pre><span></span><br></pre>
								<textarea id="lang_<?php echo $language['language_id'];?>" name="lang_<?php echo $language['language_id'];?>" cols="30" rows="4" dir="<?php echo $language['language_direction'];?>"><?php echo set_value('lang_'.$language['language_id'], $variable['lang_'.$language['language_id']]); ?></textarea>
							</div>
						<?php else:?>
							<p><?php echo lang('republic_variables_deleted_variable_message');?></p>
						<?php endif;?>
					</td>
				</tr>
				<?php endforeach;?>
			</tbody>
		</table>
	<?php endif;?>

	<div class="tableFooter">
		<div class="tableSubmit">
			<?php echo form_submit(array('name' => 'submit', 'value' => $action_button, 'class' => 'submit'))?>
		</div>
	</div>
	<?php echo form_close()?>
</div>
