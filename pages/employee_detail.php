<?php
<<<<<<< Updated upstream

	$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));
	
=======
	
	function combo_gender($selected='') {
		$res=db::select('gender','gender_val','','gender_id');
		$combo_gender=shared::select_combo($res,'gender_val', '', $selected);
		return $combo_gender;
	}
	function combo_marital_status($selected='') {
		$res=db::select('marital_status','marital_status_val');
		$combo_marital_status=shared::select_combo($res,'marital_status_val', '', $selected);
		return $combo_marital_status;
	}
	
	function combo_nationality($selected='') {
		$res=db::select('nationality','nationality_id, nationality_val','','ifnull(sort_id,1000), nationality_val');
		$combo_nationality=shared::select_combo($res,'nationality_id','nationality_val', $selected);
		$combo_nationality.="<option value=-1>Others *</option>";
		return $combo_nationality;
	}
	
	function combo_country($selected='') {
		$res=db::select('country','country_id, country_val','','country_id');
		$combo_country=shared::select_combo($res,'country_id','country_val', $selected);
		return $combo_country;
	}
	function combo_province($selected='') {
		$res=db::select('province','province_id, province_val','','province_id');
		$combo_province=shared::select_combo($res,'province_id','province_val', $selected);
		return $combo_province;
	}
	
	$res=db::select('city','city_id, province_id, city_val','','province_id, city_val');
	$js_city='';
	$last=0;
	$cities='';
	foreach ($res as $row) {
		if ($last!=$row['province_id']) {
			if ($last!=0) {
				$js_city.="city_list[".$last."]=[".$cities."];\n";
				$cities='';
			}
			$last=$row['province_id'];
			
		}
		if ($cities!='') $cities.=",";
		$cities.="{".$row['city_id'].":'".$row['city_val']."'}";
	}
	$combo_language_def=language::getChoice();
	$combo_language_skill_def=shared::select_combo_complete(language_skill::getAll(), 'language_skill_id','-Skill-','language_skill_val');
	
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');

	$user_id=$_SESSION['user_id'];
	
	$applicant=Employee::get_active_employee_one('a.user_id=?',array($user_id));
if (count($applicant)>0) {
	foreach ($applicant as $key=>$val) {
		$$key=$val;
	}
	
	$severanceData=shared::calculateSeverance($salary,  $contract1_start_date, $contract1_end_date
	, $am1_start_date, $am1_end_date
	, $contract2_start_date, $contract2_end_date
	, $am2_start_date, $am2_end_date);
	$salary_history=db::select('contract_history a
inner join contract_history b on a.user_id=b.user_id','b.*','a.contract_history_id=?', 'start_date desc',array($applicant['contract_history_id']));
	
	$language=db::select('applicants_language a
	left join language b on a.language_id=b.language_id
	left join language_skill c on c.language_skill_id=a.language_skill_id'
	,'ifnull(a.language_val, b.language_val) language_val, a.language_id, a.language_skill_id, c.language_skill_val, a.applicants_language_id'
	,'user_id=?','language_val', array($user_id));
	
	
	$project_view=Employee::getProjectView($applicant, $combo_project_name_def);
	$contract_data_view=Employee::getContractDataView($applicant, $severanceData);
}	
>>>>>>> Stashed changes
?>
<script>
var tabs=generate_assoc(['personal_data','employee_project','project_history','contract_data','dependents','language','working']);
var isNew=<?php _p(count($applicant)==0 ? "true" : "false")?>;
$(function() {
	bind('#btn_back','click',Back);
	$( "#tabs" ).tabs({
		create: function( event, ui ) {
			if (isNew) setCookie("employee_detail_tabs", 0, 1);
			$( "#tabs" ).tabs( "option", "active", getCookie('employee_detail_tabs'));
			if (tabs['personal_data']==$('#tabs').tabs("option","active")) {
				loadPersonalData();
			}
			
		},
		activate: function( event, ui ) {
			setCookie("employee_detail_tabs", $( "#tabs" ).tabs( "option", "active" ), 1);
			if (tabs['personal_data']==$('#tabs').tabs("option","active")) {
				loadPersonalData();
			}
			if (tabs['employee_project']==$('#tabs').tabs("option","active")) {
				loadEmployeeProject();
			}
			if (tabs['project_history']==$('#tabs').tabs("option","active")) {
				loadProjectHistory();
			}
			if (tabs['contract_data']==$('#tabs').tabs("option","active")) {
				loadContractData();
			}
			if (tabs['dependents']==$('#tabs').tabs("option","active")) {
				loadDependents();
			}
			if (tabs['language']==$('#tabs').tabs("option","active")) {
				loadLanguage();
			}
			if (tabs['working']==$('#tabs').tabs("option","active")) {
				loadWorking();
			}
			
		}
	});



});
function loadPersonalData() {
	if ($('#div_personal_data').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_personal_data').html(d['result']);
		var a=new personal_data("#div_personal_data");
		a.city_option=d['city_option'];
	}
	ajax("personal_data_ajax", data, success);
}
function loadEmployeeProject() {
	if ($('#div_employee_project').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_employee_project').html(d['result']);
		
		var a=new projectView("#div_employee_project");
		a.project_name_choice=d['project_name_choice'];
		a.type='save_current_contract';
		
		
	}
	ajax("employee_project_ajax", data, success);
}

function loadProjectHistory() {
	if ($('#div_project_history').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_project_history').html(d['result']);
		var a=new project_history($("#div_project_history"));
		
	}
	ajax("project_history_ajax", data, success);
}
function loadContractData() {
	if ($('#div_contract_data').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_contract_data').html(d['result']);
		var a=new contract_data($("#div_contract_data"));
		
	}
	ajax("contract_data_ajax", data, success);
}
function loadDependents() {
	if ($('#div_dependents').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_dependents').html(d['result']);
		var a=new dependents($("#div_dependents"));
		
	}
	ajax("dependents_ajax", data, success);
}
function loadLanguage() {
	if ($('#div_language').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_language').html(d['result']);
		var a=new language($("#div_language"));
		a.language_choice=d['language_choice'];
		a.language_skill_choice=d['language_skill_choice'];
	}
	ajax("language_ajax", data, success);
}
function loadWorking() {
	if ($('#div_working').html()!='') return;
	var data={}
	data['type']='load';
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		$('#div_working').html(d['result']);
		var a=new working($("#div_working"));
		
	}
	ajax("working_ajax", data, success);
}

function project_history(div) {
	var self=this;
	self.start=function() {
		hideColumns('tbl_salary_history');
		bindDiv('.btn_print',div, "click", self.Print);
	}
	
	self.Print=function() {		
		window.open("print_recruitment_summary?contract_history_id="+$(this).closest("tr").children("td:eq(0)").html(),"_blank");
	}
	this.start();
}

function Back() {
	location.href="employee";
}


</script>
<button id='btn_back' class="button_link">Back</button>

<div id="tabs">
	<ul>
		<li><a href="#div_personal_data">Personal Data</a></li>
		<li><a href="#div_employee_project">Project</a></li>
		<li><a href="#div_project_history">Project History</a></li>
		<li><a href="#div_contract_data">Contract Data</a></li>
		<li><a href="#div_dependents">Dependents</a></li>
		<li><a href="#div_language">Language</a></li>
		<li><a href="#div_working">Working Exp</a></li>
	</ul>
<div class='row'><div class='float100'><img id='photo' src="show_picture" width="75px" height="100px"/></div>
<div style='font-weight:bold;line-height:100px'><?php _p($applicant['first_name']." ".$applicant['last_name'])?></div></div>
<<<<<<< Updated upstream
<div id="div_personal_data"></div>
<div id="div_employee_project"></div>
<div id="div_project_history"></div>
<div id="div_contract_data"></div>
<div id="div_dependents"></div>
<div id="div_language"></div>
<div id="div_working"></div>
=======
<div id="div_personal_data">
<form action="upload.php" id="data" method="post" enctype="multipart/form-data">
<div class='row'><div class='label'>Photo</div><div class='label width200'><input type="file" id="uploadPhoto" name="uploadPhoto" accept=".png,.jpg"></div>
<button class="button_link" id="btnUpload">Upload</button>
</div>

 
</form>

<table>
	<tr style='display:none'><td>Applicants ID</td><td>:</td><td><?php _t("applicants_id",$applicant)?></td></tr>
	<tr><td>First Name *</td><td>:</td><td><?php _t("first_name",$applicant)?></td></tr>
	<tr><td>Last Name *</td><td>:</td><td><?php _t("last_name", $applicant)?></td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td><?php _t("place_of_birth", $applicant)?></td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td><?php _t("date_of_birth", $applicant)?></td></tr>
	<tr><td>Gender</td><td>:</td><td><select id='gender'><option value='' selected>-Gender-</option><?php _p(combo_gender($applicant['gender']))?></select></td></tr>
	<tr><td>Marital Status</td><td>:</td><td><select id='marital_status'><option value='' selected>-Marital Status-</option><?php _p(combo_marital_status($applicant['marital_status']))?></select></td></tr>
	<tr><td>Nationality *</td><td>:</td><td><select id='nationality'><option value='' selected disabled>-Nationality-</option><?php _p(combo_nationality($applicant['nationality']))?></select> <?php _t("nationality_val", $applicant)?></td></tr>	
	<tr><td valign='top'>Address *</td><td>:</td><td><textarea id='address' cols='30' rows='3'><?php _p($applicant['address'])?></textarea><br/>
	<select id='country'><option value='' disabled selected>-Country-</option><?php _p(combo_country($applicant['country']))?><option value=-1>Other *</option></select> <?php _t("country_name", $applicant)?><br/>
	<select id='province'><option value='' disabled selected>-Province-</option><?php _p(combo_province($applicant['province']))?></select>
	<select id='city'><option value='' disabled selected>-City-</option></select></td></tr>
	<tr><td>Post Code *</td><td>:</td><td><?php _t("post_code", $applicant)?></td></tr>
	<tr><td>Phone1 *</td><td>:</td><td><?php _t("phone1", $applicant)?></td></tr>
	<tr><td>Phone2</td><td>:</td><td><?php _t("phone2", $applicant)?></td></tr>
	<tr><td>Email *</td><td>:</td><td><?php _t("user_name",$applicant,"","text","","Email")?></td></tr>
	<tr><td>Computer Skills</td><td>:</td><td><textarea id="computer_skills" cols='30' rows='3'><?php _p($applicant['computer_skills'])?></textarea></td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td><textarea id="professional_skills" cols='30' rows='3'><?php _p($applicant['professional_skills'])?></textarea></td></tr>
	<tr><td>Account Bank</td><td>:</td><td><?php _t("account_bank", $applicant)?></td></tr>
	<tr><td>Account Number</td><td>:</td><td><?php _t("account_number", $applicant)?></td></tr>
	<tr><td>Emergency Phone</td><td>:</td><td><?php _t("emergency_phone", $applicant)?></td></tr>
	<tr><td>Emergency Email</td><td>:</td><td><?php _t("emergency_email", $applicant)?></td></tr>
	
	
</table>
<button class='button_link' id='btn_save'>Save</button>
</div>
<?php if (count($applicant)>0) {?>
<div id="div_current_contract">
<?php _p($project_view)?>
</div>

<div id="div_salary_history">
<h1>Salary History</h1>
<table id='tbl_salary_history' class='tbl'>
<thead><tr><th>id</th><th>Date</th><th>Project</th><th>Leader</th><th>Position</th><th>Salary</th><th></th></tr></thead>
<?php _p(Employee::get_salary_history_tbl($salary_history));?>
</table>
</div>

<div id="div_contract_data">
<?php _p($contract_data_view)?>
</div>
<div id='div_dependents'>
</div>
<div id='div_language'>
	<button id='btn_add_language' class='button_link'>Add</button>
	<table class='tbl' id='tbl_language'>
	<thead>
	<tr><th>ID<th>Language</th><th>Skill Level</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($language as $row) {
		_p('<tr><td>'.$row['applicants_language_id'].'</td>');
		_p('<td><span style="display:none">'.$row['language_id'].'</span> '.$row['language_val'].'</td>');
		_p('<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
	</table>
</div>
<div id='div_working'>

</div>
<?php }?>
>>>>>>> Stashed changes
