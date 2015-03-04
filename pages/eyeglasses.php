<?php
	$res=employee::get_active_employee_simple();
	$combo_user="";
	$arr=array();
	foreach ($res as $row) {
		if ($combo_user!="") $combo_user.=",";
		$combo_user.="'".$row['first_name']." ".$row['last_name']."'";
		array_push($arr,array('label'=>$row['first_name']." ".$row['last_name'], 'value'=>$row['user_id']));
	}
	
	$combo_user=json_encode($arr);
	
?>
<script>
	var fields=generate_assoc(['invoice_date','invoice_val','btn']);
	$(function() {
		autoCompleteEmployee();
	});
	function bindAll() {
		bind('#btn_save_frame','click',SaveFrame);
		bind('#btn_save_lens','click',SaveLens);
		setDatePicker();
		$('input[id$="invoice_val"]').each(function(idx) {
			numeric($(this));
		});
	}
	function SaveFrame() {
		var data={}
		data['type']='save_frame';
		data['user_id']=$('#employee_id').data("id");
		data=prepareDataText(data, ['frame_invoice_date']);
		data=prepareDataDecimal(data, ['frame_invoice_val']);
		
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
				return;
			}
			EmployeeChange();
		}
		ajax("eyeglassesAjax.php",data, success);
	}
	function SaveLens() {
		var data={}
		data['type']='save_lens';
		data['user_id']=$('#employee_id').data("id");
		data=prepareDataText(data, ['lens_invoice_date']);
		data=prepareDataDecimal(data, ['lens_invoice_val']);
		
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
				return;
			}
			EmployeeChange();
		}
		ajax("eyeglassesAjax.php",data, success);
	}
	
		
	function EmployeeChange() {
		var data={}
		data['type']='search';
		data['employee_id']=$('#employee_id').data("id");
		var success=function(msg) {
			$('#div_search_result').html(msg);
			bindAll();
			hideColumns('tbl_claim');
		}
		ajax("eyeglassesAjax.php",data, success);
	}
	function autoCompleteEmployee() {
		$('.employee_id').autocomplete({
			matchContains: true,
			minLength: 0,
			source : <?php _p($combo_user)?>,
			focus: function( event, ui ) {
				$(this).val(ui.item.label);
				
				return false;
			},
			select: function( event, ui ) {
				$(this).data("id", ui.item.value);
				EmployeeChange();
				return false;
			}
		}).focus(function() {
			$(this).autocomplete('search', $(this).val())
		});
		
	}
</script>
Employee Name : <?php _t("employee_id")?><p>

<div id='div_search_result'>
</div>
<div id='popup_detail'>
</div>