<?php
	$filter_first_name=shared::get_session('filter_first_name',"");
	$filter_last_name=shared::get_session('filter_last_name',"");
	$project_name_choice=shared::select_combo_complete(db::select('project_name','*','','project_name'), 'project_name','-Project Name-', 'project_name');
	if (isset($om)) {
		$employee_detail_table='employee_detail_om';
	} else {
		$employee_detail_table='employee_detail';
	}
	if (isset($om)) {
		$ajaxPage='employee_om_ajax';
	} else if (isset($pa)) {
		$ajaxPage='employee_pa_ajax';
	} else {
		$ajaxPage='employee_ajax';
	}
	
?>
<script>
	var fields=generate_assoc(['user_id','first_name','last_name','project_name','project_location']);
	var ajaxPage="<?php _p($ajaxPage)?>";
	var employee_detail_table="<?php _p($employee_detail_table)?>";
	$(function() {
		
		Search();
		bindAll();
	});
	function bindAll() {
		bind('#btn_search','click',Search);
		bind('#btn_add','click',Add);
		bind('.btn_edit_project','click',Edit);
		
		hideColumnsArr('tbl_employee', ['user_id']);
		$('#div_terminate').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		fixSelect();
	}
	

	function Add() {
		var data={}
		data['type']="set_user_id";
		data['user_id']=0;
		var success=function(msg) {
			location.href="employee_detail";
		}
		ajax(ajaxPage, data, success);
	}
	function Edit() {
		var par=$(this).closest("tr");
		var data={}
		data['type']="set_user_id";
		data['user_id']=getChildHtml(par, 'user_id', fields);
		var success=function(msg) {
			if (msg=='Failed') {
				location="failed";
			} else {
				location.href=employee_detail_table;
			}
		}
		ajax(ajaxPage, data, success);
	}
	function Search() {
		var data={}
		data['type']='search';
		data=prepareDataText(data, ['first_name','last_name','project_name']);
		var success=function(msg) {
			$('#div_result').html(msg);
			bindAll();
		}
		ajax(ajaxPage, data, success);
		
	}

	

</script>
<div id='div_content'>
	<?php _p($project_name_choice)?> <?php _t("first_name", $filter_first_name)?> <?php _t("last_name", $filter_last_name)?><button id='btn_search' class='button_link'>Search</button><br>

	<div id='div_result'>
	</div>
</div>
<div id='div_terminate'></div>
