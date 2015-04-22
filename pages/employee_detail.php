<?php
	$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));
?>
<script src='js/personal_data.js'></script>
<script src='js/employee_project.js'></script>
<script src='js/contract_data.js'></script>
<script src='js/dependents.js'></script>
<script src='js/language.js'></script>
<script src='js/working.js'></script>
<script src='js/education.js'></script>
<script src='js/projectView.js'></script>
<script src='js/pictures.js'></script>
<script>
var tabs=['personal_data','employee_project','project_history','contract_data','dependents','language','working','education','pictures','historical_contract'];
var jsTabs=[personal_data, employee_project, project_history, contract_data, dependents, language, working, education, pictures, historical_contract];
var isNew=<?php _p(count($applicant)==0 ? "true" : "false")?>;
var ajaxPage="<?php _p(isset($om) ? "employee_detail_om_ajax" : "employee_detail_ajax")?>";
var employee_table="<?php _p(isset($om) ? "employee_om" : "employee")?>";
$(function() {
	if (isNew) {
		$('#photo').closest(".row").hide();
	} else {
		$('#photo').closest(".row").show();
	}
	bind('#btn_back','click',Back);
	if (ajaxPage=='employee_detail_om_ajax') {
		$('[href=\"#div_contract_data\"]').closest('li').hide();
		$('[href=\"#div_project_history\"]').closest('li').hide();
		$('[href=\"#div_historical_contract\"]').closest('li').hide();
	}
	
	prepareTabs('employee_detail');
	
});
function load(active) {
	if ($('#div_'+tabs[active]).html()!='') return;
	var data={}
	data['type']='load_'+tabs[active];
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		var div='#div_'+tabs[active];
		$(div).html(d['result']);
		var a=new jsTabs[active]($('#div_'+tabs[active]), ajaxPage);
		if (tabs[active]=='personal_data') {
			if (isNew) {
				$('#btn_upload',div).hide();
			} else {
				$('#btn_upload',div).show();
			}
			a.city_option=d['city_option'];
		} else if (tabs[active]=='employee_project') {
			a.insertParams('save_current_contract');
			
		} else if (tabs[active]=='language') {
			a.language_choice=d['language_choice'];
			a.language_skill_choice=d['language_skill_choice'];
		} else if (tabs[active]=='working') {
			a.tbl='employee';
		} else if (tabs[active]=='education') {
			a.education_choice=d['education_choice'];
			a.countries_choice=d['countries_choice'];
			a.adder=d['adder'];
		}
	}
	ajax(ajaxPage, data, success);
}


function project_history(div) {
	var self=this;
	self.start=function() {
		hideColumns('tbl_salary_history');
		bindDiv('.btn_print',div, "click", self.Print);
	}
	
	self.Print=function() {		
		var data={}
		data['type']="set_contract_history_id";
		data['id']=$(this).closest("tr").children("td:eq(0)").html();
		var success=function(msg) {
			window.open("print_hrsr_ajax","_blank");
		}
		ajax(ajaxPage, data, success);
	}
	this.start();
}
function historical_contract() {
}
function Back() {
	location.href= employee_table;
}
function uploadDone(){
	$('#photo').attr('src','show_picture_ajax');
}
function uploadOthersDone(){
	if ($('.div_pic_collection').html()=='') {
		location.reload();
	}
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
		<li><a href="#div_education">Education</a></li>
		<li><a href="#div_pictures">Pictures</a></li>
		<li><a href="#div_historical_contract">Historical Contract</a></li>
	</ul>
<div class='row'><div class='float100'><a href='show_picture_ajax' target='_blank'><img id='photo' src="show_picture_ajax" width="75px" height="100px"/></a></div>
<div style='font-weight:bold;line-height:100px'><?php _p($applicant['first_name']." ".$applicant['last_name'])?></div></div>
<div id="div_personal_data"></div>
<div id="div_employee_project"></div>
<div id="div_project_history"></div>
<div id="div_contract_data"></div>
<div id="div_dependents"></div>
<div id="div_language"></div>
<div id="div_working"></div>
<div id="div_education"></div>
<div id="div_pictures"></div>
<div id="div_historical_contract"></div>
