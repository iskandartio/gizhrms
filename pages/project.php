<?php
	
	$fields=['project_name_id','project_name','principal_advisor','financial_controller','btn'];
	$fieldsProjectNumber=['project_number_id','project_number','team_leader','project_name','btn'];
	$res=Project::getProjectName();
	$combo_project_name_def=shared::select_combo_complete($res, 'project_name', '-Project Name-','project_name');
	
?>
<script>
	var fields=generate_assoc(<?php _p(json_encode($fields))?>);
	var fieldsProjectNumber=generate_assoc(<?php _p(json_encode($fieldsProjectNumber))?>);
	var project_name_choice="<?php _p($combo_project_name_def)?>";
	var employee_choice=<?php _p(Employee::getComboEmployee())?>;
	$(function() {
		
		bindAll();
		$( "#tabs" ).tabs({
			activate: function( event, ui ) {
				loadData(ui['newTab'].attr("aria-controls"));
				setCookie("project_tabs", $( "#tabs" ).tabs( "option", "active" ), 1);
			}
		});
		$( "#tabs" ).tabs( "option", "active", getCookie('project_tabs'));
	});
	function loadData(a) {
		var data={}
		if (a=="tabs-2") {
			data['type']='getProjectNumberTable';
			var success=function(msg) {
				$('#tabs-2').html(msg);
				bindAllProjectNumber();
			}
		}
			
		ajax("projectAjax.php",data, success);
		
	}
	
	function bindAll() {
		hideColumns('tbl_project_name');
		bind('#add_project_name','click',AddProjectName);
		bind('.btn_save','click',Save);
		bind('.btn_edit','click',Edit);
		bind('.btn_delete','click',Delete);
		bind('.btn_cancel','click',Cancel);
		autoCompleteEmployee('.principal_advisor');
		autoCompleteEmployee('.financial_controller');
	}
	function bindAllProjectNumber() {
		hideColumns('tbl_project_number');
		bind('#add_project_number','click',AddProjectNumber);
		bind('.btn_saveProjectNumber','click',SaveProjectNumber);
		bind('.btn_editProjectNumber','click',EditProjectNumber);
		bind('.btn_deleteProjectNumber','click',DeleteProjectNumber);
		bind('.btn_cancelProjectNumber','click',CancelProjectNumber);
		autoCompleteEmployee('.team_leader');
		fixSelect();
	}
	function editMode(par) {
		labelToText(par, {'project_name':0}, fields);
		
		labelToAutoComplete(par, ['principal_advisor','financial_controller'], fields);
		
		btnChange(par, ['save','cancel']);
		bindAll();
	}
	
	function editModeProjectNumber(par) {
		labelToText(par, {'project_number':0}, fieldsProjectNumber);
		labelToAutoComplete(par, ['team_leader'], fieldsProjectNumber);
		labelToSelect(getChildObj(par, 'project_name', fieldsProjectNumber), project_name_choice);
		
		bindAllProjectNumber();
	}
	function AddProjectName() {
		$('#tbl_project_name>tbody').append("<?php _p(Project::project_name_td(array()))?>");
		var par=$('#tbl_project_name>tbody>tr:last');
		editMode(par);
	}
	function AddProjectNumber() {
		$('#tbl_project_number>tbody').append("<?php _p(Project::project_number_td(array()))?>");
		var par=$('#tbl_project_number>tbody>tr:last');
		btnChange(par, ['save','delete'], fieldsProjectNumber, 'ProjectNumber');
		editModeProjectNumber(par);
	}
	function Edit(){
		var par=$(this).closest("tr");		
		editMode(par);
	}
	function EditProjectNumber(){
		var par=$(this).closest("tr");
		btnChange(par, ['save','cancel'], fieldsProjectNumber, 'ProjectNumber');		
		editModeProjectNumber(par);
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['project_name','principal_advisor','financial_controller']);
		autoCompleteToDefaultLabel(par, ['principal_advisor','financial_controller'], fields);
		btnChange(par, ['edit','delete']);
		bindAll();
	}
	
	function CancelProjectNumber() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['project_number'], fieldsProjectNumber);
		autoCompleteToDefaultLabel(par, ['team_leader'], fieldsProjectNumber);
		selectedToDefaultLabel(par,['project_name'], fieldsProjectNumber);
		btnChange(par, ['edit','delete'], fieldsProjectNumber,'ProjectNumber');
		bindAllProjectNumber();
	}
	function Delete() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).closest("tr");
		data={};
		data['type']='delete';
		data['project_name_id']=getChildHtml(par,'project_name_id', fields);
		var success=function(msg) {
			par.remove();
		}
		ajax("projectAjax.php", data, success);
	}
	function DeleteProjectNumber() {
		if (!confirm("Are you sure to delete?")) return;
		
		var par=$(this).closest("tr");
		data={};
		data['type']='deleteProjectNumber';
		data['project_number_id']=getChildHtml(par,'project_number_id', fieldsProjectNumber);
		var success=function(msg) {
			par.remove();
		}
		ajax("projectAjax.php", data, success);
	}
	
	function Save() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save';
		data=prepareDataHtml(data,['project_name_id'], par);
		data=prepareDataText(data, ['project_name'],  par);
		data=prepareDataAutoComplete(data, [ 'principal_advisor','financial_controller'], par, fields);
		
		var success=function(msg) {
			
			setHtmlText(par, 'project_name_id', msg);
			textToLabel(par,['project_name']);
			autoCompleteToLabel(par, ['principal_advisor','financial_controller'], fields);
			btnChange(par, ['edit','delete']);
			bindAll();
		}
		ajax('projectAjax.php',data, success);
	}
	function SaveProjectNumber() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='saveProjectNumber';
		data=prepareDataHtml(data,['project_number_id'], par,  fieldsProjectNumber);
		data=prepareDataText(data, ['project_number','project_name','project_number'],  par,  fieldsProjectNumber);
		data=prepareDataAutoComplete(data, [ 'team_leader'], par, fieldsProjectNumber);
		var success=function(msg) {
			
			setHtmlText(par, 'project_number_id', msg, fieldsProjectNumber);
			textToLabel(par,['project_number'], fieldsProjectNumber);
			autoCompleteToLabel(par, ['team_leader'], fieldsProjectNumber);
			selectedToLabel(par, ['project_name'], fieldsProjectNumber);
			btnChange(par, ['edit','delete'], fieldsProjectNumber,'ProjectNumber');
			bindAllProjectNumber();
		}
		ajax('projectAjax.php',data, success);
	}
</script>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">Project Name</a></li>
		<li><a href="#tabs-2">Project Number</a></li>
	</ul>
	<div id="tabs-1">
		<button class='button_link' id='add_project_name'>Add Project Name</button><br>
		<table class='tbl' id='tbl_project_name'>
		<thead><tr><th>ID</th><th>Project Name</th><th>Principal Advisor</th><th>Financial Controller</th><th></th></tr></thead><tbody>
		<?php
			foreach ($res as $rs) {
				_p(Project::project_name_td($rs));
			}
		?>
		</tbody>
		</table>

	</div>
	<div id="tabs-2">
		
	</div>
</div>
