<div id="variables">

	<!-- Module configuratinos -->
	<?php echo form_open($action_url, '', FALSE)?>

		<table class="mainTable" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<th colspan="2"><?php echo lang('republic_variables_configuration_main');?></th>
			</tr>

			<tr class="even">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_group_access');?></label></td>
				<td>
					<?php foreach ($member_groups AS $key => $member_group) : ?>
						<?php $is_selected = (is_array($settings['group_access']) && in_array($key, $settings['group_access']) OR $key === 1 ) ? "checked=checked" : ""; ?>
						<input id="group_<?php echo $key;?>" type="checkbox" name="group_access[]" value="<?php echo $key;?>" <?php echo $is_selected; ?> <?php if($key === 1):?>disabled<?php endif;?>>
						<label for="group_<?php echo $key;?>"><?php echo $member_group;?></label><br />
					<?php endforeach; ?>
				</td>
			</tr>
		</table>

		<table class="mainTable" border="0" cellpadding="0" cellspacing="0">

			<tr>
				<th colspan="2"><?php echo lang('republic_variables_configuration_variables');?></th>
			</tr>

			<tr class="even">
				<td style="width: 50%"><label for="overwrite_default_variable_value"><?=lang('republic_variables_configuration_overwrite_default_variable_value');?></label></td>
				<td>
					<input type="text" id="overwrite_default_variable_value" name="overwrite_default_variable_value" value="<?php echo $settings['overwrite_default_variable_value'];?>" />
				</td>
			</tr>

			<tr class="odd">
				<td style="width: 50%"><label><?=lang('republic_variables_default_language_direction');?></label></td>
				<td>
					<?php $ltr = ($settings['default_language_direction'] === 'ltr') ? TRUE : FALSE; ?>
					<?php $rtl = ($settings['default_language_direction'] === 'rtl') ? TRUE : FALSE; ?>
					<select name="default_language_direction">
						<option value="ltr" <?php echo set_select('default_language_direction', 'ltr', $ltr); ?> ><?php echo lang('republic_variables_label_language_ltr');?></option>
						<option value="rtl" <?php echo set_select('default_language_direction', 'rtl', $rtl); ?> ><?php echo lang('republic_variables_label_language_rtl');?></option>
					</select>
				</td>
			</tr>

			<tr class="even">
				<td style="width: 50%">
					<label><?=lang('republic_variables_configuration_show_default_variable_value');?></label>
					<div class="subtext"><?php echo lang('republic_variables_configuration_show_default_variable_value_desc'); ?></div>
				</td>
				<td>
					<?php $yes_selected = ($settings['show_default_variable_value'] === 'y' OR $settings['show_default_variable_value'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['show_default_variable_value'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="show_default_variable_value" id="yes_show_default_variable_value" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_show_default_variable_value"><?php echo lang('yes');?></label>
					<input name="show_default_variable_value" id="no_show_default_variable_value" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_show_default_variable_value"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="odd">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_groups_list_open');?></label></td>
				<td>
					<?php $yes_selected = ($settings['groups_list_open'] === 'y' OR $settings['groups_list_open'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['groups_list_open'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="groups_list_open" id="yes_groups_list_open" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_groups_list_open"><?php echo lang('yes');?></label>
					<input name="groups_list_open" id="no_groups_list_open" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_groups_list_open"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="even">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_variables_list_open');?></label></td>
				<td>
					<?php $yes_selected = ($settings['variables_list_open'] === 'y' OR $settings['variables_list_open'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['variables_list_open'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="variables_list_open" id="yes_variables_list_open" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_variables_list_open"><?php echo lang('yes');?></label>
					<input name="variables_list_open" id="no_variables_list_open" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_variables_list_open"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="odd">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_empty_groups_list_open');?></label></td>
				<td>
					<?php $yes_selected = ($settings['empty_groups_list_open'] === 'y' OR $settings['empty_groups_list_open'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['empty_groups_list_open'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="empty_groups_list_open" id="yes_empty_groups_list_open" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_empty_groups_list_open"><?php echo lang('yes');?></label>
					<input name="empty_groups_list_open" id="no_empty_groups_list_open" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_empty_groups_list_open"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="even">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_show_variable_text');?></label></td>
				<td>
					<?php $yes_selected = ($settings['show_variable_text'] === 'y' OR $settings['show_variable_text'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['show_variable_text'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="show_variable_text" id="yes_show_variable_text" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_show_variable_text"><?php echo lang('yes');?></label>
					<input name="show_variable_text" id="no_show_variable_text" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_show_variable_text"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="odd">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_auto_sync');?></label></td>
				<td>
					<?php $yes_selected = ($settings['auto_sync_global_vars'] === 'y' OR $settings['auto_sync_global_vars'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['auto_sync_global_vars'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="auto_sync_global_vars" id="yes_auto_sync_global_vars" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_auto_sync_global_vars"><?php echo lang('yes');?></label>
					<input name="auto_sync_global_vars" id="no_auto_sync_global_vars" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_auto_sync_global_vars"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="even">
				<td style="width: 50%"><label><?=lang('republic_variables_save_on_page_click');?></label></td>
				<td>
					<?php $yes_selected = ($settings['save_on_page_click'] === 'y' OR $settings['save_on_page_click'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['save_on_page_click'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="save_on_page_click" id="yes_save_on_page_click" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_save_on_page_click"><?php echo lang('yes');?></label>
					<input name="save_on_page_click" id="no_save_on_page_click" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_save_on_page_click"><?php echo lang('no');?></label>
				</td>
			</tr>

			</table>

			<table class="mainTable" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<th colspan="2"><?php echo lang('republic_variables_configuration_templates');?></th>
				</tr>

			<tr class="even">
				<td style="width: 50%"><label><?=lang('republic_variables_allow_to_save_to_files');?></label></td>
				<td>
					<?php $yes_selected = ($settings['allow_to_save_to_files'] === 'y' OR $settings['allow_to_save_to_files'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['allow_to_save_to_files'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="allow_to_save_to_files" id="yes_allow_to_save_to_files" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_allow_to_save_to_files"><?php echo lang('yes');?></label>
					<input name="allow_to_save_to_files" id="no_allow_to_save_to_files" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_allow_to_save_to_files"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="even">
				<td style="width: 50%">
					<label for="template_group_name"><?=lang('republic_variables_configuration_template_group_name');?></label>
					<div class="smalltext"><?=lang('republic_variables_configuration_template_group_name_smalltext');?><?php echo $template_group_path;?><strong><span id="template_group_name_span"><?php echo $settings['template_group_name'];?></span></strong>.group</div>
				</td>
				<td>
					<input type="text" id="template_group_name" name="template_group_name" value="<?php echo $settings['template_group_name'];?>" />
				</td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: right"><a href="<?php echo $variables_sync_url;?>"><?php echo lang('republic_variables_sync_files_to_db');?></a></td>
			</tr>

		</table>

		<table class="mainTable" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<th colspan="2"><?php echo lang('republic_variables_configuration_languages');?></th>
			</tr>

			<tr class="odd">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_use_default_language_on_empty');?></label></td>
				<td>
					<?php $yes_selected = ($settings['use_default_language_on_empty'] === 'y' OR $settings['use_default_language_on_empty'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['use_default_language_on_empty'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="use_default_language_on_empty" id="yes_use_default_language_on_empty" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_use_default_language_on_empty"><?php echo lang('yes');?></label>
					<input name="use_default_language_on_empty" id="no_use_default_language_on_empty" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_use_default_language_on_empty"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="even">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_show_language_prefix');?></label></td>
				<td>
					<?php $yes_selected = ($settings['show_language_prefix'] === 'y' OR $settings['show_language_prefix'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['show_language_prefix'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="show_language_prefix" id="yes_show_language_prefix" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_show_language_prefix"><?php echo lang('yes');?></label>
					<input name="show_language_prefix" id="no_show_language_prefix" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_show_language_prefix"><?php echo lang('no');?></label>
				</td>
			</tr>

			<tr class="odd">
				<td style="width: 50%"><label><?=lang('republic_variables_configuration_show_language_postfix');?></label></td>
				<td>
					<?php $yes_selected = ($settings['show_language_postfix'] === 'y' OR $settings['show_language_postfix'] === '') ? "checked=checked" : ""; ?>
					<?php $no_selected	= ($settings['show_language_postfix'] === 'n' ) ? "checked=checked" : ""; ?>
					<input name="show_language_postfix" id="yes_show_language_postfix" type="radio" value="y" <?php echo $yes_selected; ?>>
					<label for="yes_show_language_postfix"><?php echo lang('yes');?></label>
					<input name="show_language_postfix" id="no_show_language_postfix" type="radio" value="n" <?php echo $no_selected; ?> style="margin-left: 12px">
					<label for="no_show_language_postfix"><?php echo lang('no');?></label>
				</td>
			</tr>

		</table>

	<div class="tableFooter">
		<div class="tableSubmit" style="margin-top: 0">
			<?php echo form_submit(array('name' => 'submit', 'value' => lang('submit'), 'class' => 'submit'))?>
		</div>
	</div>

	<?php echo form_close()?>

</div>
