<p>
	<?php echo lang('republic_variables_import_introduction'); ?>
</p>

<?php echo form_open($action_url, '', FALSE)?>
	<table class="mainTable" style="margin-bottom: 20px" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th style="width: 15px"><input type="checkbox" name="all" /></th>
				<th style="text-align:left"><?php echo lang('republic_variables_import_current_site'); ?></th>
			</tr>
		</thead>
		<tbody>
		<?php if ( ! empty($global_variables['current'])):?>
			<?php foreach ($global_variables['current'] AS $var): ?>
				<tr>
					<td><input type="checkbox" name="variables[current_site][]" id="var_<?php echo $var['variable_id'];?>" value="<?php echo $var['variable_id'];?>"/></td>
					<td><label for="var_<?php echo $var['variable_id'];?>" style="font-weight: normal"><?php echo $var['variable_name'];?></label></td>
				</tr>
			<?php endforeach;?>
		<?php else:?>
			<tr>
				<td colspan="2"><i><?php echo lang('republic_variables_import_empty'); ?></i></td>
			</tr>
		<?php endif;?>
		</tbody>
	</table>

	<?php foreach ($global_variables['site'] AS $site_id => $site): ?>
	<table class="mainTable" style="margin-bottom: 20px" border="0" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th style="width: 15px"><input type="checkbox" name="all" /></th>
				<th style="text-align:left"><?php echo lang('republic_variables_import_another_site'); ?> "<?php echo $sites[$site_id];?>" (Site ID: <?php echo $site_id;?>)</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<div>
						<input type="checkbox" name="import_groups[<?php echo $site_id;?>]" id="import_groups" value="y" />
						<label for="import_groups"><?php echo lang('republic_variables_copy_groups');?></label>
					</div>

					<div>
						<input type="checkbox" name="import_languages[<?php echo $site_id;?>]" id="import_languages" value="y" />
						<label for="import_languages"><?php echo lang('republic_variables_copy_language');?></label>
					</div>
				</td>
			</tr>
		<?php if ( ! empty($site)):?>
			<?php foreach ($site AS $variable): ?>
				<?php $is_duplicate = (in_array($variable['variable_name'], $republic_variables)) ? TRUE : FALSE; ?>
				<tr>
					<td><input type="checkbox" name="variables[other_sites][<?php echo $site_id;?>][]" id="var_<?php echo $variable['variable_id'];?>" value="<?php echo $variable['variable_id'];?>" <?php if ($is_duplicate):?>disabled=disabled<?php endif;?>/></td>
					<td <?php if ($is_duplicate):?>class="rv_exist"<?php endif;?>>
						<label for="var_<?php echo $variable['variable_id'];?>" style="font-weight: normal"><?php echo $variable['variable_name'];?></label>
							<?php if ($is_duplicate):?>
								<span class="duplicate_republic_variable"><?php echo lang('republic_variables_variable_exist'); ?></span>
							<?php endif;?>
							<?php if($variable['republic_variable'] === '0'):?>
								<span class="site_republic_variable"><?php echo lang('republic_variables_import_rv'); ?></span>
							<?php endif;?>
					</td>
				</tr>
			<?php endforeach;?>
		<?php else:?>
			<tr>
				<td colspan="2"><i><?php echo lang('republic_variables_import_empty'); ?></i></td>
			</tr>
		<?php endif;?>
		</tbody>
	</table>
	<?php endforeach;?>

	<div class="tableFooter">
		<div class="tableSubmit" style="margin-top: 0">
			<?php echo form_submit(array('name' => 'submit', 'value' => lang('republic_variables_import'), 'class' => 'submit'))?>
		</div>
	</div>
<?php echo form_close();?>
