<?php
	$filter=" and date_add(curdate(), interval 30 day)>coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)";
	
	$res=employee::get_active_employee($filter);
?>
<script>
	$(function() {
		bindAll();
		loadData();
	});
	function bindAll() {
		bind('.btn_terminate','click',Terminate);
		bind('.btn_recontract','click', Recontract);
		$('#recontract_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		bind('.btn_save','click', SaveRecontract);
		fixSelect();
		numeric($('#salary'));
		setDatePicker();
	}
	function Terminate() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='terminate';
		data['user_id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			if (msg!='') alert(msg);
			loadData();
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
			loadData();
		};
		ajax("employeeAjax.php", data, success);
	}
	function SaveRecontract() {
		var data={}
		data['type']='save_recontract';
		data['user_id']=user_id;
		data=prepareDataText(data, ['salary_band','reason','start_date','end_date', 'project_name','project_number','project_location','principal_advisor','team_leader','responsible_superior','SAP_No','position','job_title']);
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
</script>
<div id='search_expiring_result'>
</div>

<div id="recontract_detail"></div>