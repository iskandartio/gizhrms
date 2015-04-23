<?php	
	$_SESSION['user_id']=$_SESSION['uid'];
	$applicant=Employee::get_active_employee_simple_one("a.user_id=?", array($_SESSION['user_id']));

?>

<script>
var tabs=['personal_data','employee_project','dependents','language','working','education','pictures','medical'];
$(function() {
	prepareTabs('self_data');	
});
function load(active) {
	if ($('#div_'+tabs[active]).html()!='') return;
	var data={}
	data['type']='load_'+tabs[active];
	var success=function(msg) {
		var d=jQuery.parseJSON(msg);
		var div='#div_'+tabs[active];
		$(div).html(d['result']);
	}
	ajax("self_data_ajax", data, success);
}


</script>
	
<div id="tabs">
	<ul>
		<li><a href="#div_personal_data">Personal Data</a></li>
		<li><a href="#div_employee_project">Project</a></li>		
		<li><a href="#div_dependents">Dependents</a></li>
		<li><a href="#div_language">Language</a></li>
		<li><a href="#div_working">Working Exp</a></li>
		<li><a href="#div_education">Education</a></li>
		<li><a href="#div_pictures">Pictures</a></li>
		<li><a href="#div_medical">Medical</a></li>
	</ul>
<div class='row'><div class='float100'><a href='show_picture_ajax' target='_blank'><img id='photo' src="show_picture_ajax" width="75px" height="100px"/></a></div>
<div style='font-weight:bold;line-height:100px'><?php _p($applicant['first_name']." ".$applicant['last_name'])?></div></div>
<div id="div_personal_data"></div>
<div id="div_employee_project"></div>
<div id="div_dependents"></div>
<div id="div_language"></div>
<div id="div_working"></div>
<div id="div_education"></div>
<div id="div_pictures"></div>
<div id="div_medical"></div>
