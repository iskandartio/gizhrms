<?php

	$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));
	
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
function uploadDone(){
	$('#photo').attr('src','show_picture');
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
<div id="div_personal_data"></div>
<div id="div_employee_project"></div>
<div id="div_project_history"></div>
<div id="div_contract_data"></div>
<div id="div_dependents"></div>
<div id="div_language"></div>
<div id="div_working"></div>
