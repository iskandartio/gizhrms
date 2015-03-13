<?php
	
?>
<script>
	$(function() {
		bindAll();
		loadData();
		$( "#tabs" ).tabs({
			activate: function( event, ui ) {
				setCookie("medical_summary_tabs", $( "#tabs" ).tabs( "option", "active" ), 1);
			}
		});
		$( "#tabs" ).tabs( "option", "active", getCookie('medical_summary_tabs'));
	});
	function bindAll() {
		bind('.year','change',ChangeYear);
	}
	function ChangeYear() {
		loadData();
	}
	function loadData() {
		var data={}
		data['type']='load_data';
		data['year']=$('.year:checked').val();
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#div_outpatient').html(d['outpatient']);
			$('#div_pregnancy').html(d['pregnancy']);
			$('#div_eyeglasses').html(d['eyeglasses']);
			$('#div_medical_checkup').html(d['medical_checkup']);
		}
		ajax('medical_summaryAjax.php',data, success);
	}
</script>
<div class='row'><input type='radio' name='year' class='year' checked="checked" value='this_year'/>This Year<input type='radio' name='year' class='year' value='last_year'/>Last Year</div>
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