<?php

?>
<script src='js/terminate.js'></script>
<script>
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;	
	var ajaxPage='terminate_ajax';
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
			var d=jQuery.parseJSON(msg);
			$('#div_terminate').html(d['result']);
			var a=new terminate('#div_terminate', ajaxPage);
			bindAll();
		}
		ajax(ajaxPage, data, success);
	}
</script>
Employee Name : <?php _t("employee_id")?><p>
<div id='div_terminate'></div>