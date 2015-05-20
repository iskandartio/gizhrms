<script src='js/projectView.js'></script>
<script>
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;	
	var ajaxPage='update_contract_data_ajax';
	$(function() {
		autoCompleteEmployee('#employee_id', EmployeeChange);
	});
	function bindAll() {
		fixSelect();
	}
	function EmployeeChange() {
		var data={}
		data['type']='getData';
		data['user_id']=$('#employee_id').data("id");
		var success=function(msg) {
			var a=new projectView("#div_project_data", beforeSave, afterSave, ajaxPage);
			a.type='save';
			var d=jQuery.parseJSON(msg);
			$('#div_project_data').html(d['result']);
			bindAll();
		}
		ajax(ajaxPage, data, success);
	}
	function beforeSave() {
		var p=$('#div_project_data');
		if (!validate_empty_col(p,['start_date'])) return false;
		return true;
	}
	function afterSave() {
		location.reload();
	}
</script>
Employee Name : <?php _t("employee_id")?><p>
<div id='div_project_data'></div>