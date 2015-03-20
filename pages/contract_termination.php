<?php

?>

<script>

	$(function() {
		bindAll();
		loadData();
	});
	function bindAll() {
		bind('.btn_terminate','click',ShowTerminate);
		bind('.btn_recontract','click', ShowRecontract);
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
			location.reload();
		}
		ajax('contract_termination_ajax',data,success);
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
		ajax('contract_termination_ajax',data, success);
	}
	var user_id=0;
	function ShowRecontract() {
		var par=$(this).closest("tr");
		var data={};
		data['type']='show_recontract';
		data['user_id']=par.children("td:eq(0)").html();
		user_id=data['user_id'];
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#recontract_detail').html(d['result']);
			$('#recontract_detail').dialog("open");
			var a=new projectView("#recontract_detail", beforeSave, afterSave);
			a.project_name_choice=d['project_name_choice'];
			a.type='save_recontract';
			
			
		};
		var beforeSave=function() {
			if (!validate_empty_col($('#recontract_detail'), ['start_date','end_date'])) return false;
			return true;
		}
		var afterSave=function(msg) {
			location.reload();
		}
		ajax("contract_termination_ajax", data, success);
	}

	function loadData() {
		var data={}
		data['type']='search_expiring';
		var success=function(msg) {
			$('#search_expiring_result').html(msg);
			bindAll();
			hideColumns('tbl');
		}
		ajax('contract_termination_ajax', data, success);
	}
function projectView(div, beforeSave, afterSave) {
	var self=this;
	self.start=function() {
		self.bindProjectView();
	}
	self.find_p=function(o) {
		var p=$(o).closest(".row");
		if (p.length==0) {
			p=div;
			if (!p) p=document;
		}		
		return p;
	}
	self.bindProjectView=function() {
		bind('.project_name', 'change', self.ChangeProjectName);
		bind('.project_number', 'change', self.ChangeProjectNumber);
		bind(".btn_add", "click", self.AddSalarySharing);
		bind("#btn_save_project", "click", self.SaveProject);
		bind('.btn_deleteSalarySharing','click', self.DeleteSalarySharing);
		numeric($('.salary'));
		$('input').blur();
		setDatePicker();
		fixSelect();
	}
	self.ChangeProjectName=function() {
		var data={}
		data['type']='getProjectNameAndNumber';
		data['project_name']=$(this).val();
		var p=self.find_p(this);
		
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$(p).find('.project_number:first').html(d['combo_project_number']);
			$(p).find('.principal_advisor').html(d['principal_advisor']);
			$(p).find('.principal_advisor_name').html(d['principal_advisor_name']);
			$(p).find('.financial_controller').html(d['financial_controller']);
			$(p).find('.financial_controller_name').html(d['financial_controller_name']);
			$(p).find('.team_leader').html('');
			$(p).find('.team_leader_name').html('');
			fixSelect();
		}
		ajax('project_ajax',data, success);
	}
	self.ChangeProjectNumber=function() {
		if ($(this).closest('.div_salary_sharing').length>0) return;
		var data={}
		data['type']='getProjectNumberByName';
		data['project_number']=$(this).val();
		var p=self.find_p(this);
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('.team_leader',p).html(d['team_leader']);
			$('.team_leader_name',p).html(d['team_leader_name']);
		}
		ajax('project_ajax',data, success);
	}
	self.AddSalarySharing = function() {
		var s="<div class='row'><div class='label width120'>"+self.project_name_choice+"</div>";
		s+="<div class='label width120'><select class='project_number'><option value=''>-Project Number-</option></select></div>";
		s+="<div class='label width80'><input type='text' class='percentage' id='percentage' size='1'> % ";
		s+=getImageTags(['delete'],'SalarySharing');
		s+="</div></div>";
		var p=$(this).closest(".row").next();
		$(p).append(s);
		self.bindProjectView();
		fixSelect();

	}
	self.DeleteSalarySharing=function() {
		$(this).closest(".row").remove();
	}

	self.SaveProject=function() {
		if (beforeSave) if (!beforeSave()) return;
		var p=div;
		var data={};
		data['type']=self.type;
		if (!validate_empty_col(p,['job_title','position','project_name_id','project_number_id','project_location','responsible_superior','salary','salary_band'])) return false;
		data = prepareDataMultiInput(data
		, ['job_title','position','project_name','project_number','team_leader','principal_advisor','financial_controller','project_location'
		,'responsible_superior','SAP_No','salary','salary_band','working_time','reason','start_date','end_date']
		, p);
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
			if (afterSave) afterSave(msg);
		}
		ajax('employee_ajax',data, success);
	}
	self.start();
}

</script>
<div id='search_expiring_result'>
</div>

<div id="terminate_detail"></div>
<div id="recontract_detail"></div>
