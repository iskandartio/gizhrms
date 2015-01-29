<?php
	$filter_first_name=shared::get_session('filter_first_name',"");
	$filter_last_name=shared::get_session('filter_last_name',"");
?>
<script>
	var fields=generate_assoc(['user_id','first_name','last_name','project_name','project_location']);
	$(function() {
		bindAll();
		Search();
	});
	function bindAll() {
		bind('#btn_search','click',Search);
		bind('#btn_add','click',Add);
		bind('.btn_edit','click',Edit);
		bind('.btn_update','click', ChangeProjectData);
		hideColumnsArr('tbl_employee', ['user_id']);
	}
	function Add() {
		var data={}
		data['type']="set_edit_id";
		data['edit_id']=0;
		var success=function(msg) {
			location.href="employee_detail";
		}
		ajax("employeeAjax.php", data, success);
	}
	function ChangeProjectData() {
		var par=$(this).closest("tr");
		var data={}
		data['type']="set_edit_id";
		data['edit_id']=getChildHtml(par, 'user_id', fields);
		var success=function(msg) {
			location.href="change_project_data";
		}
		ajax("employeeAjax.php", data, success);
	}
	function Edit() {
		var par=$(this).closest("tr");
		var data={}
		data['type']="set_edit_id";
		data['edit_id']=getChildHtml(par, 'user_id', fields);
		var success=function(msg) {
			
			location.href="employee_detail";
		}
		ajax("employeeAjax.php", data, success);
	}
	function Search() {
		var data={}
		data['type']='search';
		data=prepareDataText(data, ['first_name','last_name']);
		var success=function(msg) {
			$('#div_result').html(msg);
			bindAll();
		}
		ajax('employeeAjax.php', data, success);
		
	}
</script>
<div id='div_content'>
<?php _t("first_name", $filter_first_name)?> <?php _t("last_name", $filter_last_name)?><button id='btn_search' class='button_link'>Search</button><br>
<button id="btn_add" class="button_link">Add New Employee</button>
<div id='div_result'>
</div>
</div>