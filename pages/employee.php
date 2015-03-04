<?php
	$filter_first_name=shared::get_session('filter_first_name',"");
	$filter_last_name=shared::get_session('filter_last_name',"");
?>
<script>
	var fields=generate_assoc(['user_id','first_name','last_name','project_name','project_location']);
	var fields_dependent=generate_assoc(['employee_dependent_id','relation','name','date_of_birth','btn']);
	$(function() {
		bindAll();
		Search();
	});
	function bindAll() {
		bind('#btn_search','click',Search);
		bind('#btn_add','click',Add);
		bind('.btn_edit_project','click',Edit);
		bind('.btn_update','click', ChangeProjectData);
		bind('.btn_edit_dependent','click', PopupDetail);
		hideColumnsArr('tbl_employee', ['user_id']);
		$('#popup_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
	}
	function PopupDetail()  {
		var par=$(this).closest("tr");
		var data={}
		data['type']="get_dependent";
		data['user_id']=getChildHtml(par, 'user_id', fields);
		var success=function(msg) {
			$('#popup_detail').html(msg);
			$('#popup_detail').dialog("open");
			bindDependent();
		}
		ajax('employeeAjax.php',data, success);
	}
	function bindDependent() {
		bind('#btn_add_dependent','click',AddDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_save','click',SaveDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_edit','click',EditDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_cancel','click',CancelDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_delete','click',DeleteDependent);
		hideColumns('tbl_dependent');
		setDOB();
		setDatePicker();
	}
	function AddDependent()  {
		$s="<tr><td></td><td><?php _t("relation")?></td><td><?php _t("name")?></td><td><?php _t("date_of_birth")?></td><td>"+getImageTags(['save','delete'])+"</tr>";
		$('#tbl_dependent').prepend($s);
		bindDependent();
	}
	function EditDependent() {
		var f= fields_dependent;
		var par=$(this).closest("tr");
		labelToText(par, {'relation':20,'name':20,'date_of_birth':10}, f);
		btnChange(par, ['save','cancel'],f);
		bindDependent();
		
	}
	function CancelDependent() {
		var f=fields_dependent;
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['relation','name','date_of_birth'], f);
		btnChange(par, ['edit','delete'], f);
		bindDependent();
	}
	function DeleteDependent() {
		if (!confirm("Are you sure to delete?")) return;
		var f=fields_dependent;
		var par=$(this).closest("tr");
		data={};
		data['type']='delete_dependent';
		data['employee_dependent_id']=getChildHtml(par,'employee_dependent_id', f);
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax("employeeAjax.php", data, success);
	}
	function SaveDependent()  {
		var par=$(this).closest("tr");
		var f=fields_dependent;
		if (!validate_empty_tbl(par, ['relation','name','date_of_birth'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save_dependent';
		
		data['employee_dependent_id']=getChildHtml(par,'employee_dependent_id', f);
		data=prepareDataText(data, ['relation','name','date_of_birth'], par, f);
		var success= function(msg) {
			setHtmlText(par, 'employee_dependent_id', msg, f);
			textToLabel(par, ['relation','name','date_of_birth'],f);
			btnChange(par, ['edit','delete'], f);
			bindDependent();
		}
		ajax('employeeAjax.php', data, success);
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
<div id="popup_detail"></div>