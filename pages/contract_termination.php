<?php
	$filter=" and date_add(curdate(), interval 30 day)>coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)";
	


?>
<script>
	var combo_project_name="<?php _p(shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-'))?>";
	$(function() {
		bindAll();
		loadData();
	});
	function bindAll() {
		bind('.btn_terminate','click',ShowTerminate);
		bind('.btn_recontract','click', Recontract);
		$('#recontract_detail').dialog({
			autoOpen:false,
			height:550,
			width:750,
			modal:true
		});
		$('#terminate_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		bind('.btn_save','click', SaveRecontract);
		bind('#change_severance','click', ChangeSeverance);
		bind('#cancel_change','click', CancelChange);
		bind('#terminate','click', Terminate);
		fixSelect();
		numeric($('#salary'));
		numeric($('#new_severance'));
		setDatePicker();
	}
	function ChangeSeverance() {
		$('#div_severance').show();
	}
	function CancelChange() {
		$('#new_severance').val('');
		$('#reason').val('');
		$('#div_severance').hide();
	}
	function Terminate() {
		if (!confirm("Are you sure to terminate?")) return;
		var data={}
		data['type']='terminate';
		if ($('#new_severance').val()=='') {
			$('#new_severance').val($('.severance').html());
		}
		data['new_severance']=cNum($('#new_severance').val());
		data['severance']=cNum($('.severance').html());
		data['service']=cNum($('.service').html());
		data['housing']=cNum($('.housing').html());
		data['reason']=$('#reason').val();
		
		var success=function(msg) {
			$('#terminate_detail').dialog("close");
			loadData();
		}
		ajax('employeeAjax.php',data,success);
	}
	
	function ShowTerminate() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='show_terminate';
		data['user_id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			$('#terminate_detail').html(msg);
			$('#terminate_detail').dialog("open");
			bindAll();
			
		}
		ajax('employeeAjax.php',data, success);
	}
	var user_id=0;
	function Recontract() {
		var par=$(this).closest("tr");
		var data={};
		data['type']='recontract';
		data['user_id']=par.children("td:eq(0)").html();
		user_id=data['user_id'];
		var success=function(msg) {
			$('#recontract_detail').html(msg);
			$('#recontract_detail').dialog("open");
			
			bindProjectView();
			
		};
		ajax("employeeAjax.php", data, success);
	}
	function SaveRecontract() {
		var data={}
		data['type']='save_recontract';
		data['user_id']=user_id;
		data=prepareDataText(data, ['salary_band','reason','start_date','end_date', 'project_name','project_number','project_location','team_leader','principal_advisor','responsible_superior','SAP_No','position','job_title']);
		data=prepareDataDecimal(data, ['salary']);
		var success=function(msg) {
			if (msg!='') alert(msg);
			$('#recontract_detail').dialog("close");
			loadData();
		}
		ajax("employeeAjax.php", data, success);
	}
	function loadData() {
		var data={}
		data['type']='search_expiring';
		var success=function(msg) {
			$('#search_expiring_result').html(msg);
			bindAll();
			hideColumns('tbl');
		}
		ajax('employeeAjax.php', data, success);
	}
function SaveProject() {
	var p=$('#recontract_detail');
	var data={}
	data['type']='save_recontract';
	var success=function() {
		$('#recontract_detail').dialog("close");
		loadData();
	}
	if (!SaveProject2(p, data, success)) return;
}
function SaveProject2(p, data, func) {
	if (!validate_empty_col(p,['job_title','position','project_name_id','project_number_id','project_location','responsible_superior','salary','salary_band'])) return false;
	data = prepareDataMultiInput(data
	, ['job_title','position','project_name','project_number','team_leader','principal_advisor','financial_controller','project_location'
	,'responsible_superior','SAP_No','salary_band','working_time','reason','start_date','end_date']
	, p);
	data = prepareDataDecimal(data, ['salary']);
	data['salary_sharing_project_name']=new Array();
	data['salary_sharing_project_number']=new Array();
	data['salary_sharing_percentage']=new Array();
	var percentage=0;
	var flag=false;
	$(p).find('.div_salary_sharing').find('.row').each(function(idx) {
		data['salary_sharing_project_name'].push($(this).find('.project_name').val());
		data['salary_sharing_project_number'].push($(this).find('.project_number').val());
		data['salary_sharing_percentage'].push($(this).find('.percentage').val());
		percentage=percentage+1*$(this).find('.percentage').val();
		flag=true;
	});
	if (percentage!=100 && flag) {
		alert('salary sharing not correct');
		return false;
	}
	
	var success=function(msg) {
		if (func) func();
	}
	ajax('employeeAjax.php',data, success);
}

</script>
<div id='search_expiring_result'>
</div>

<div id="terminate_detail"></div>
<div id="recontract_detail"></div>