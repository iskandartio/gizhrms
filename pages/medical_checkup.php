<?php
	$res=Employee::get_active_employee_simple();
	$combo_user="";
	$arr=array();
	foreach ($res as $row) {
		if ($combo_user!="") $combo_user.=",";
		$combo_user.="'".$row['first_name']." ".$row['last_name']."'";
		array_push($arr,array('label'=>$row['first_name']." ".$row['last_name'], 'value'=>$row['user_id']));
	}
	
	$combo_user=json_encode($arr);
	$combo_employee=Employee::getComboEmployee();
?>
<script>
	var employee_choice=<?php _p($combo_employee)?>;
	$(function() {
		autoCompleteEmployee('.employee_id', EmployeeChange);
	});
	function bindAll() {
		bind('#btn_save','click',SaveMedicalCheckup);
		setDatePicker();
		$('input[id$="invoice_val"]').each(function(idx) {
			numeric($(this));
		});
	}
	
	function SaveMedicalCheckup() {
		var data={}
		data['type']='save';
		data['user_id']=$('#employee_id').data("id");
		data=prepareDataText(data, ['invoice_date','remarks']);
		data=prepareDataDecimal(data, ['invoice_val']);
		
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
				return;
			}
			EmployeeChange();
		}
		ajax("medical_checkup_ajax",data, success);
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
		ajax("medical_checkup_ajax",data, success);
	}

</script>
Employee Name : <?php _t("employee_id")?><p>

<div id='div_search_result'>
</div>
<div id='popup_detail'>
</div>