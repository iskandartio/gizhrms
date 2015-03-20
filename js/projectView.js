function projectView(div, beforeSave, afterSave) {
	var self=this;
	self.project_class={}
	self.start=function() {
		var data={}
		data['type']="getProjectClass";
		var success=function(msg) {
			self.project_class=jQuery.parseJSON(msg);
			self.bindProjectView();
		}
		ajax('project_ajax', data, success);
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
		var p=self.find_p(this);
		var v=$(this).val();
		$('.project_number',p).empty();
		$('.principal_advisor',p).html('');
		$('.principal_advisor_name',p).html('');
		$('.financial_controller',p).html('');
		$('.financial_controller_name',p).html('');
		$('.team_leader',p).html('');
		$('.team_leader_name',p).html('');
		$('.project_number',p).append("<option value=''>-Project Number-</option>");
		if (v!='') {
			var project_number=self.project_class[v]['project_number'];
			for (key in project_number) {
				$('.project_number',p).append("<option>"+key+"</option>");
			}
			$('.principal_advisor', p).html(self.project_class[v]['principal_advisor']);
			$('.principal_advisor_name', p).html(self.project_class[v]['principal_advisor_name']);
			$('.financial_controller', p).html(self.project_class[v]['financial_controller']);
			$('.financial_controller_name', p).html(self.project_class[v]['financial_controller_name']);
			
		}
		fixSelect();
	}
	self.ChangeProjectNumber=function() {
		if ($(this).closest('.div_salary_sharing').length>0) return;
		var p=self.find_p(this);
		var project_name=$('.project_name',p).val();
		var project_number=self.project_class[project_name]['project_number'];
		var v=$(this).val();
		$('.team_leader', p).html(project_number['team_leader']);
		$('.team_leader_name', p).html(project_number['team_leader_name']);
		
		var data={}
		data['type']='getProjectNumberByName';
		data['project_number']=$(this).val();
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('.team_leader',p).html(d['team_leader']);
			$('.team_leader_name',p).html(d['team_leader_name']);
		}
		ajax('project_ajax',data, success);
	}
	self.AddSalarySharing = function() {
		var project_name_choice="<select class='project_name'><option value=''>-Project Name-</option>";
		
		for (key in self.project_class) {
			project_name_choice+="<option>"+key+"</option>";
		}
		project_name_choice+="</select>";
		var s="<div class='row'><div class='label width120'>"+project_name_choice+"</div>";
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
