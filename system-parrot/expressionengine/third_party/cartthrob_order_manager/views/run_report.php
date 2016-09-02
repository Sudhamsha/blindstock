<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

	<?php
	if (!empty($data['report_title']))
	{
		echo "<h3>".$data['report_title'] ."</h3>"; 
	}
	?>
 	<p>
	 	<?=$data['total_table']?>
 	</p>

 	<p>
		<?=$data['order_table']?>
	</p>
	
	<?=$data['export_csv']?>
		<?=$data['hidden_inputs']?>
		<p>
			<!-- filenames are dynamically output if they exist -->
			<button type="submit" name="download" value="xls" class="submit"><?=lang('cartthrob_order_manager_export_xls')?></button> <button type="submit" name="download" value="csv" class="submit"><?=lang('cartthrob_order_manager_export_csv')?></button> 		<input type="submit" name="save_report" value="<?=lang('cartthrob_order_manager_save_report')?>" class="submit" /> 	<?=lang('cartthrob_order_manager_report_title')?> <input type="text" name="report_title" value="" style="width:235px" /> 
		</p>
 
 
	
	</form>