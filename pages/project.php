<?php
?>
<script src='js/project_name.js'></script>
<script src='js/project_number.js'></script>
<script src='js/project_location.js'></script>
<script src='js/job_title.js'></script>
<script src='js/position.js'></script>
<script>
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;
	var tabs=['project_name','project_number','project_location','job_title','position'];
	var jsTabs=[project_name, project_number, project_location, job_title, position];
	$(function() {
		prepareTabs('project');
	});
	function load(active) {
		if ($('#div_'+tabs[active]).html()!='') return;
		var data={}
		
		data['type']='load_'+tabs[active];
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			var div='#div_'+tabs[active];
			$(div).html(d['result']);
			var a=new jsTabs[active]($('#div_'+tabs[active]));
		}
		ajax("project_ajax", data, success);
	}


</script>
<div id="tabs">
	<ul>
		<li><a href="#div_project_name">Project Name</a></li>
		<li><a href="#div_project_number">Project Number</a></li>
		<li><a href="#div_project_location">Project Location</a></li>
		<li><a href="#div_job_title">Job Title</a></li>
		<li><a href="#div_position">Position</a></li>
	</ul>
	<div id="div_project_name"></div>
	<div id="div_project_number"></div>
	<div id="div_project_location"></div>
	<div id="div_job_title"></div>
	<div id="div_position"></div>
</div>
