<?php if (! empty($groups_and_variables) OR ! empty($variables) OR ! empty($groups)) : ?>
  <div id="variables">

    <?php /* VARIABLES AND GROUPS */ ?>
    <?php foreach ($groups_and_variables as $key => $variable): ?>
      <?php $use_language = $variable['use_language'];?>
			<?php $variable = $variable['value'];?>
    	<div id="id_<?php echo $variable[0]['group_id']?>" class="editAccordion sort <?php if ($settings['groups_list_open'] === 'y') : ?>open<?php endif;?>">
    		<h3><div class="h3_text"><?php echo $key?></div></h3>
    		<div>
    			<table class="templateTable templateEditorTable" border="0" cellspacing="0" cellpadding="0" style="margin: 0;">
            <tr>
     			   <th><?php echo lang('republic_variables_label_language_name');?></th>
     			   <?php if ($settings['show_default_variable_value'] === 'y' OR $use_language === 'n') : ?>
    			     <th>
    			      <?php if (empty($settings['overwrite_default_variable_value'])) : ?><?php echo lang('republic_variables_label_value');?>
    			      <?php else : ?><?php echo $settings['overwrite_default_variable_value'];?><?php endif;?>
    			     </th>
    			   <?php endif;?>
    			   <?php foreach ($languages AS $language) : ?>
    			     <th><?php echo $language['language_name'];?></th>
    			   <?php endforeach;?>
    			   <?php if ($module_access) : ?><th class="action"><?php echo lang('republic_variables_label_action');?></th><?php endif;?>
    			  </tr>
    			<?php foreach ($variable as $subvariable): ?>
    				<tr>
    					<td>
    					  <a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_action'.AMP.'id='.$subvariable['variable_id']?>"><?php echo $subvariable['variable_name'];?></a>
    					  <?php if ($subvariable['variable_description'] != "") : ?><div class='subtext'><?php echo $subvariable['variable_description'];?></div><?php endif;?>
    					</td>
    					<?php if ($settings['show_default_variable_value'] === 'y' OR $use_language === 'n') : ?>
      					<?php if ($settings['show_variable_text'] === 'n') : ?>
   					      <?php if ($subvariable['variable_data'] != "") : ?>
   					        <td><img src="<?php echo $ok_icon;?>" alt="ok" /></td>
   					      <?php else : ?>
   					        <td><img src="<?php echo $not_ok_icon;?>" alt="ok" /></td>
   					      <?php endif;?>
   					    <?php else : ?>
                  <?php if ($settings['show_default_variable_value'] === 'y' OR $subvariable['use_language'] === 'n'):?>
       			        <td id="variable-<?php echo $subvariable['variable_id'];?>" class="variable-edit-value parent_<?php echo $settings['default_language_direction'];?>">
  										<div class="variable-value <?php echo $settings['default_language_direction'];?>" dir="<?php echo $settings['default_language_direction'];?>"><?php echo htmlentities($subvariable['variable_data'], ENT_QUOTES, "UTF-8");?></div>
  										<?php $attributes = array('class' => 'variable-edit', 'style' => 'display:none');?>
                      <?php echo form_open($variable_edit_action_url . $subvariable['variable_id'], $attributes);?>
  											<input type="hidden" class="variable_id" value="<?php echo $subvariable['variable_id'];?>">
  											<textarea rows="2" name="variable_data" dir="<?php echo $settings['default_language_direction'];?>"><?php echo $subvariable['variable_data'];?></textarea>
                        <a href="#cancel" class="cancel-edit-mode">Cancel</a>
  											<input type="submit" name="submit" value="<?php echo lang('update')?>">
  										<?php echo form_close();?>
  									</td>
                  <?php else:?>
                    <td><p class="default_value_only"><em><?php echo lang('republic_variables_language_only');?></em></p></td>
                  <?php endif;?>
     			      <?php endif;?>
   			      <?php endif;?>
    					<?php foreach ($languages AS $language) : ?>
      			     <?php if ($settings['show_variable_text'] === 'n') : ?>
   					      <?php if (isset($subvariable['lang_'.$language['language_id']]) && isset($subvariable['lang_'.$language['language_id']]['data']) && $subvariable['lang_'.$language['language_id']]['data'] != "") : ?>
   					        <td><img src="<?php echo $ok_icon;?>" alt="ok" /></td>
   					      <?php else : ?>
   					        <td><img src="<?php echo $not_ok_icon;?>" alt="ok" /></td>
   					      <?php endif;?>
   					    <?php else : ?>
     			        <td id="variable-<?php echo $subvariable['variable_id'];?>" <?php if($subvariable['use_language'] !== 'n' && isset($subvariable['lang_'.$language['language_id']])):?>class="variable-edit-value parent_<?php echo $language['language_direction'];?>"<?php else:?>class="parent_<?php echo $language['language_direction'];?>"<?php endif;?>>
                    <?php if ($subvariable['use_language'] === 'y'):?>
  										<div class="variable-value <?php echo $language['language_direction'];?>" dir="<?php echo $language['language_direction'];?>"><?php if(isset($subvariable['lang_'.$language['language_id']])):?><?php echo htmlentities($subvariable['lang_'.$language['language_id']]['data'], ENT_QUOTES, "UTF-8");?><?php else:?><?php echo lang('republic_variables_deleted_variable_message');?><?php endif;?></div>
  										<?php if(isset($subvariable['lang_'.$language['language_id']])):?>
                      <?php $attributes = array('class' => 'variable-edit', 'style' => 'display:none');?>
                      <?php echo form_open($variable_edit_action_url . $subvariable['lang_'.$language['language_id']]['id'], $attributes);?>
  											<input type="hidden" class="variable_id" value="<?php echo $subvariable['lang_'.$language['language_id']]['id'];?>">
  											<textarea rows="2" name="variable_data" dir="<?php echo $language['language_direction'];?>"><?php echo $subvariable['lang_'.$language['language_id']]['data'];?></textarea>
                        <a href="#cancel" class="cancel-edit-mode">Cancel</a>
  											<input type="submit" name="submit" value="<?php echo lang('update')?>">
  										<?php echo form_close();?>
  										<?php endif;?>
                    <?php else:?>
                      <p class="default_value_only"><em><?php echo lang('republic_variables_default_only');?></em></p>
                    <?php endif;?>
									</td>
     			      <?php endif;?>
      			   <?php endforeach;?>
             <?php if ($module_access) : ?>
    					<td class="action">
                <a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_delete'.AMP.'id='.$subvariable['variable_id']?>" class="delete"> <?php echo lang('republic_variables_delete')?></a>
    					</td>
            <?php endif;?>
    				</tr>
    			<?php endforeach;?>
          <?php if ($module_access) : ?>
          <?php
            $nr_cols = 2 + sizeof($languages);
            if ($settings['show_default_variable_value'] === 'y' || $use_language === 'n')
            {
              $nr_cols++;
            }
          ?>
          <tr>
            <td colspan="<?php echo $nr_cols;?>">
              <a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_action'.AMP.'group_id='.$variable[0]['group_id']?>" class="add">
                <strong><?php echo lang('republic_variable_add_variable_to_group_text')?></strong>
              </a>
            </td>
          </tr>
          <?php endif;?>
    			</table>
    		</div>
    	</div>
    <?php endforeach;?>

		<?php /* VARIABLES WITHOUT A GROUP */ ?>
    <?php if ( ! empty($variables['variables'])) : ?>
    <?php $use_language = $variables['use_language'];?>
    <?php $variables = $variables['variables'];?>
    <div class="editAccordion <?php if ($settings['variables_list_open'] === 'y') : ?>open<?php endif;?>">
  		<h3><?php echo lang('republic_variables_variables')?></h3>
  		<div>
  			<table class="templateTable templateEditorTable" border="0" cellspacing="0" cellpadding="0" style="margin: 0;">
          <tr>
  			   <th><?php echo lang('republic_variables_label_language_name');?></th>
  			   <?php if ($settings['show_default_variable_value'] === 'y' OR $use_language === 'n') : ?>
  			   <th><?php if (empty($settings['overwrite_default_variable_value'])) : ?><?php echo lang('republic_variables_label_value');?><?php else : ?><?php echo $settings['overwrite_default_variable_value'];?><?php endif;?></th>
  			  <?php endif;?>
  			   <?php foreach ($languages AS $language) : ?>
  			     <th><?php echo $language['language_name'];?></th>
  			   <?php endforeach;?>
  			   <?php if ($module_access) : ?><th class="action"><?php echo lang('republic_variables_label_action');?></th><?php endif;?>
  			  </tr>
  			<?php foreach ($variables AS $key => $variable) : ?>
  				<tr>
  					<td>
  					  <a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_action'.AMP.'id='.$variable['variable_id']?>"><?php echo $variable['variable_name'];?></a>
  					  <?php if ($variable['variable_description'] != "") : ?><div class='subtext'><?php echo $variable['variable_description'];?></div><?php endif;?>
  					</td>
  					<?php if ($settings['show_default_variable_value'] === 'y' OR $use_language === 'n') : ?>
    					<?php if ($settings['show_variable_text'] === 'n') : ?>
  				      <?php if ($variable['variable_data'] != "") : ?>
  				        <td><img src="<?php echo $ok_icon;?>" alt="ok" /></td>
  				      <?php else : ?>
  				        <td><img src="<?php echo $not_ok_icon;?>" alt="ok" /></td>
  				      <?php endif;?>
  				    <?php else : ?>
                <?php if ($settings['show_default_variable_value'] === 'y' OR $variable['use_language'] === 'n'):?>
  								<td id="variable-<?php echo $variable['variable_id'];?>" class="variable-edit-value parent_<?php echo $settings['default_language_direction'];?>">
  									<div class="variable-value <?php echo $settings['default_language_direction'];?>" dir="<?php echo $settings['default_language_direction'];?>"><?php echo htmlentities($variable['variable_data'], ENT_QUOTES, "UTF-8");?></div>
  									<?//=print_r($subvariable);?>
                    <?php $attributes = array('class' => 'variable-edit', 'style' => 'display:none');?>
                    <?php echo form_open($variable_edit_action_url .  $variable['variable_id'], $attributes);?>
  										<input type="hidden" class="variable_id" value="<?php echo $variable['variable_id'];?>">
  										<textarea rows="2" name="variable_data" dir="<?php echo $settings['default_language_direction'];?>"><?php echo $variable['variable_data'];?></textarea>
                      <a href="#cancel" class="cancel-edit-mode">Cancel</a>
  										<input type="submit" name="submit" value="<?php echo lang('update')?>">
  									<?php echo form_close();?>
  								</td>
                <?php else:?>
                  <td><p class="default_value_only"><em><?php echo lang('republic_variables_language_only');?></em></p></td>
                <?php endif;?>
   			      <?php endif;?>
 			      <?php endif;?>
  					<?php foreach ($languages AS $language) : ?>
  					    <?php if ($settings['show_variable_text'] === 'n') : ?>
  					      <?php if (isset($variable['lang_'.$language['language_id']]) && isset($variable['lang_'.$language['language_id']]['data']) && $variable['lang_'.$language['language_id']]['data'] != "") : ?>
   					        <td><img src="<?php echo $ok_icon;?>" alt="ok" /></td>
  					      <?php else : ?>
   					        <td><img src="<?php echo $not_ok_icon;?>" alt="ok" /></td>
  					      <?php endif;?>
  					    <?php else : ?>

    			        <td <?php if($variable['use_language'] !== 'n' && isset($variable['lang_'.$language['language_id']])):?>id="variable-<?php echo $variable['lang_'.$language['language_id']]['id'];?>" class="variable-edit-value parent_<?php echo $language['language_direction'];?>"<?php else:?>class="parent_<?php echo $language['language_direction'];?>"<?php endif;?>>
                    <?php if ($variable['use_language'] !== 'n'):?>
  										<div class="variable-value <?php echo $language['language_direction'];?>" dir="<?php echo $language['language_direction'];?>" >
  											<?php if(isset($variable['lang_'.$language['language_id']])):?>
  												<?php echo htmlentities($variable['lang_'.$language['language_id']]['data'], ENT_QUOTES, "UTF-8");?>
  											<?php else:?>
  												<?php echo lang('republic_variables_deleted_variable_message');?>
  											<?php endif;?>
  										</div>
  										<?php if(isset($variable['lang_'.$language['language_id']])):?>
                        <?php $attributes = array('class' => 'variable-edit', 'style' => 'display:none');?>
                        <?php echo form_open($variable_edit_action_url .  $variable['lang_'.$language['language_id']]['id'], $attributes);?>
  												<input type="hidden" class="variable_id" value="<?php echo $variable['lang_'.$language['language_id']]['id'];?>">
  												<textarea rows="2" name="variable_data" dir="<?php echo $language['language_direction'];?>"><?php echo $variable['lang_'.$language['language_id']]['data'];?></textarea>
                          <a href="#cancel" class="cancel-edit-mode">Cancel</a>
  												<input type="submit" name="submit" value="<?php echo lang('update')?>">
  											<?php echo form_close();?>
  										<?php endif;?>
                    <?php else:?>
                      <p class="default_value_only"><em><?php echo lang('republic_variables_default_only');?></em></p>
                    <?php endif;?>
									</td>
    			      <?php endif;?>
    			   <?php endforeach;?>
  					<?php if ($module_access) : ?>
            <td class="action">
              <a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_delete'.AMP.'id='.$variable['variable_id']?>" class="delete">Delete</a>
  					</td>
            <?php endif;?>
  				</tr>
  			<?php endforeach;?>

  			</table>
  		</div>
  	</div>
  	<?php endif;?>


		<?php /* EMPTY GROUPS */ ?>
  	<?php if ( ! empty($groups)) : ?>
	    <?php if ($module_access) : ?>
		  	<div class="editAccordion empty <?php if ($settings['empty_groups_list_open'] === 'y') : ?>open<?php endif;?>">
		  		<h3 title="<?php echo lang('republic_variables_empty_groups_help');?>"><?php echo lang('republic_variables_empty_groups')?></h3>
		  		<div>
		  			<table class="templateTable templateEditorTable" border="0" cellspacing="0" cellpadding="0" style="margin: 0;">
		  			<?php foreach ($groups AS $key => $group) : ?>
		  				<tr>
		  					<td><strong><?php echo $group['group_name']?></strong></td>
		            <td class="action"><a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_action'.AMP.'group_id='.$group['group_id']?>" class="add"><?php echo lang('republic_variables_variable_add')?></a></td>
		            <td class="action"><a href="<?php echo BASE.AMP.$module_url.AMP.'method=group_delete'.AMP.'id='.$group['group_id']?>" class="delete"><?php echo lang('republic_variables_delete');?></a></td>
		  				</tr>
		  			<?php endforeach;?>

		  			</table>
		  		</div>
		  	</div>
	    <?php endif;?>
  	<?php endif;?>
</div>
<?php else : ?>
<div class="introduction">
  <h3>Hello! This is where all your variables will be shown in a little while.</h3>
  <ul>
    <li>
      If you're working on a <strong>multi language site</strong>, you'll probably want to start by
      <a href="<?php echo BASE.AMP.$module_url.AMP.'method=language_add';?>">adding the languages</a>
      and decide if you like to use a language prefix or postfix. Let's say you decide
      to use language codes and a dash as prefix, adding English with the <strong>en-</strong> prefix will
      result in English variables like <code>{en-variablename}</code>.
    </li>
    <li>
      If you're working on a <strong>single language site</strong> you can start by
      <a href="<?php echo BASE.AMP.$module_url.AMP.'method=group_add';?>">creating groups</a> to organize
      your variables in, or start <a href="<?php echo BASE.AMP.$module_url.AMP.'method=variable_action';?>">adding variables</a>
      right away. (You can always add groups and languages later.)
    </li>
  </ul>

  <h4>Templates</h4>
  <p>
    To use a variable in your templates you use the variable name with brackets, it's just a normal global variable, or the localized version.
  </p>
  <p>
    <em>Example: Let's say you created a variable called <code>{variablename}</code> and you have added the English (en-), German (de-) and Swedish (se-) languages.
    To display the different localized values you would use <code>{en-variablename}</code>, <code>{de-variablename}</code>, and <code>{se-variablename}</code> respectively.</em>
  </p>


</div>
<?php endif;?>

<?php if ($module_access) : ?>

<?php endif;?>

<?php if ($settings['save_on_page_click'] === 'y'): ?><div id="save_on_page_click"></div><?php endif;?>
