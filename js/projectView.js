
function bindProjectView() {
	bind('.project_name', 'change', ChangeProjectName);
	bind('.project_number', 'change', ChangeProjectNumber);
	bind(".btn_add", "click", AddSalarySharing);
	bind("#btn_save_project", "click", SaveProject);
	bind('.btn_deleteSalarySharing','click',DeleteSalarySharing);
	numeric($('.salary'));
	$('input').blur();
	setDatePicker();
}
function ChangeProjectName() {
	var data={}
	data['type']='getProjectNameAndNumber';
	data['project_name']=$(this).val();
	var p=$(this).closest(".row");
	if (p.length==0) p=document;
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
	ajax('projectAjax.php',data, success);
}
function ChangeProjectNumber() {
	if ($(this).closest('.div_salary_sharing').length>0) return;
	var data={}
	data['type']='getProjectNumberByName';
	data['project_number']=$(this).val();
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('.team_leader').html(d['team_leader']);
		$('.team_leader_name').html(d['team_leader_name']);
	}
	ajax('projectAjax.php',data, success);
}

function AddSalarySharing() {

	var s="<div class='row'><div class='label width120'>"+combo_project_name+"</div>";
	s+="<div class='label width120'><select class='project_number'><option value=''>-Project Number-</option></select></div>";
	s+="<div class='label width80'><input type='text' class='percentage' id='percentage' size='1'> % ";
	s+=getImageTags(['delete'],'SalarySharing');
	s+="</div></div>";
	var p=$(this).closest(".row").next();
	$(p).append(s);
	bindProjectView();
	fixSelect();

}
function DeleteSalarySharing() {
	$(this).closest(".row").remove();
}

