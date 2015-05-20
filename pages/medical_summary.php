<?php $project_name_choice=shared::select_combo_complete(db::select('project_name','*','','project_name'), 'project_name','-Project Name-');
//project_ajax link

?>
<script src='js/projectView.js'></script>
<script>
	var ajaxPage='medical_summary_ajax';
	$(function() {
		bindAll();
		loadData();
		$( "#tabs" ).tabs({
			activate: function( event, ui ) {
				setCookie("medical_summary_tabs", $( "#tabs" ).tabs( "option", "active" ), 1);
			}
		});
		$( "#tabs" ).tabs( "option", "active", getCookie('medical_summary_tabs'));
		fixSelect();

	});
	function bindAll() {
		bind('.year','change',ChangeYear);
		bind('.btn_search','click', loadData);
	}
	function ChangeYear() {
		loadData();
	}
	function loadData() {
		var data={}
		data['type']='load_data';
		data['year']=$('.year:checked').val();
		data['project_name']=$('.project_name').val();
		data['project_number']=$('.project_number').val();
		data['project_location']=$('.project_location').val();
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			var a=projectView('.div_project',null, null, ajaxPage);
			$('#div_outpatient').html(d['outpatient']);
			$('#div_pregnancy').html(d['pregnancy']);
			$('#div_eyeglasses').html(d['eyeglasses']);
			$('#div_medical_checkup').html(d['medical_checkup']);
		}
		ajax(ajaxPage,data, success);
	}
</script>
<div class='row'><input type='radio' name='year' class='year' checked="checked" value='this_year'/>This Year<input type='radio' name='year' class='year' value='last_year'/>Last Year</div>
<?php if (!isset($_SESSION['project_location'])) {?>
<div class='div_project'>
	<div class='row'><div class='float100'>Project Name</div><div class='float150'><?php _p($project_name_choice) ?></div>
	<div class='label'>Project Number</div><div class='float150'><select class='project_number'></select></div>
	<div class='label'>Project Location</div><div class='float'><select class='project_location'></select></div></div>
	<button class='button_link btn_search'>Search</button>
</div>
<?php }?>
<div id='tabs'>
<ul>
	<li><a href="#div_outpatient">Outpatient</a></li>
	<li><a href="#div_pregnancy">Pregnancy</a></li>
	<li><a href="#div_eyeglasses">Eye Glasses</a></li>
	<li><a href="#div_medical_checkup">Medical Checkup</a></li>
</ul>
<div id='div_outpatient'></div>
<div id='div_pregnancy'></div>
<div id='div_eyeglasses'></div>
<div id='div_medical_checkup'></div>
</div>