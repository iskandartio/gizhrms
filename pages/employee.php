<?php
	$filter_first_name=shared::get_session('filter_first_name',"");
	$filter_last_name=shared::get_session('filter_last_name',"");
?>
<script>
	var fields=generate_assoc(['user_id','first_name','last_name','project_name','project_location']);
	var ajaxPage="<?php _p((isset($om) ? 'employee_om_ajax' : 'employee_ajax'))?>";
	var employee_detail_table="<?php _p((isset($om) ? 'employee_detail_om' : 'employee_detail'))?>";
	$(function() {
		bindAll();
		Search();
	});
	function bindAll() {
		bind('#btn_search','click',Search);
		bind('#btn_add','click',Add);
		bind('.btn_edit_project','click',Edit);
		bind('.btn_update','click', ChangeProjectData);
		bind('.btn_terminate','click', Terminate);
		hideColumnsArr('tbl_employee', ['user_id']);
		$('#div_terminate').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
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
	function ChangeProjectData() {
		var par=$(this).closest("tr");
		var data={}
		data['type']="set_user_id";
		data['user_id']=getChildHtml(par, 'user_id', fields);
		var success=function(msg) {
			location.href="change_project_data";
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
		data=prepareDataText(data, ['first_name','last_name']);
		var success=function(msg) {
			$('#div_result').html(msg);
			bindAll();
		}
		ajax(ajaxPage, data, success);
		
	}
	function Terminate() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='show_terminate_immediately';
		data['user_id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			$('#div_terminate').html(msg);
			$('#div_terminate').dialog("open");
			bindTerminate();
		}
		ajax(ajaxPage,data, success);
		
	}
	
var div='#div_terminate';
function bindTerminate() {
	setDatePicker();
	bindDiv('.btn_calculate', div,'click', jsCalculateSeverance);
}
function jsCalculateSeverance() {
	var data={}
	data['type']='calculate_severance';
	data['terminate_date']=$('#terminate_date',div).val();
	var success=function(msg) {
		$('#div_severance_data').html(msg);
		bindSeveranceData();
	}
	
	ajax(ajaxPage,data, success);
}
function bindSeveranceData() {
	$('#change_severance',div).bind('click', jsChangeSeverance);
	$('#terminate',div).bind('click', jsTerminate);
	$('#cancel_change',div).bind('click', jsCancelChange);
	numeric($('.new_severance'));
}
function jsChangeSeverance() {
	$('#div_severance').show();
}
function jsTerminate() {
	if (!confirm("Are you sure to terminate?")) return;
	
	var data={}
	data['type']='terminate';
	if ($('#new_severance',div).val()=='') {
		$('#new_severance',div).val($('.severance',div).html());
	}
	data['new_severance']=cNum($('#new_severance',div).val());
	data['severance']=cNum($('.severance',div).html());
	data['service']=cNum($('.service',div).html());
	data['housing']=cNum($('.housing',div).html());
	data['reason']=$('#reason',div).val();
	data['terminate_date']=$('.terminate_date',div).val();
	
	var success=function(msg) {
		$(div).dialog("close");
		Search();
	}
	ajax(ajaxPage,data,success);
}
function jsCancelChange() {
	$('#new_severance',div).val('');
	$('#reason',div).val('');
	$('#div_severance',div).hide();
}
</script>
<div id='div_content'>
	<?php _t("first_name", $filter_first_name)?> <?php _t("last_name", $filter_last_name)?><button id='btn_search' class='button_link'>Search</button><br>
	<button id="btn_add" class="button_link">Add New Employee</button>
	<div id='div_result'>
	</div>
</div>
<div id='div_terminate'></div>
