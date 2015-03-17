<?php
	
?>
<script>
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;
	$(function() {
		autoCompleteEmployee('.employee_id', EmployeeChange);
	});
	function bindAll() {
		bind('#btn_save_frame','click',SaveFrame);
		bind('#btn_save_lens','click',SaveLens);
		bind('.employee_id','change', EmployeeChange);
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
	
		
	function EmployeeChange(obj) {
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

</script>
Employee Name : <?php _t("employee_id")?><p>

<div id='div_search_result'>
</div>
<div id='popup_detail'>
</div>