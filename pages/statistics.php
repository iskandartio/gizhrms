<?php
	

	$res=db::DoQuery("select a.vacancy_id, concat(a.vacancy_name, ' (', a.vacancy_code, '-', a.vacancy_code2, ')') vacancy, a.vacancy_progress_id from vacancy a 
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
where ifnull(b.vacancy_progress_val,'')!='Closing' order by a.vacancy_code, a.vacancy_code2");
	
	$combo_vacancy=shared::select_combo_complete($res, 'vacancy_id', '- Vacancy -','vacancy');
?>
<script src="js/chart.js"></script>
<script>

	$(function() {
		fixSelect();
		bind('#vacancy_id','change', VacancyChange);
		bind('#based_on','change', BasedOnChange);
		$('#export_data_button').hide();
		$('#div_datatable').hide();
	});
	function VacancyChange() {
		var successDataTable=function(msg) {
			$('#div_datatable').html(msg);
			$('#export_data_button').show();
		}
		var data={}
		data['type']="get_datatable";
		data['vacancy_id']=$('#vacancy_id').val();
		ajax('statisticsAjax.php',data, successDataTable);
		fixSelect();
	}
	function BasedOnChange() {
		$('#tabular').html("");
		var canvas=document.getElementById("chart-area");
		if (window.myPie) {
			while  (myPie.segments.length>0) {
				myPie.removeData();
			}
		}
		var success=function(msg) {
			var returnData= jQuery.parseJSON(msg);
			pieData=returnData['pieData'];
			var canvas=document.getElementById("chart-area");
			var ctx = canvas.getContext("2d");
			window.myPie = new Chart(ctx).Doughnut(pieData);
			$('#tabular').html(returnData['tabular']);
		}
		if ($(this).val()=='Gender') {
			var data={}
			data['type']="gender";
			data['vacancy_id']=$('#vacancy_id').val();

			ajax('statisticsAjax.php',data, success);
			fixSelect();
			return;
		}
		if ($(this).val()=='Salary Expectation') {
			
			$('#other_category').html("<?php _t("range")?>");
			
			
			numeric($('#range'));
			
			$('#range').blur(function(e) {
				var data={}
				data['type']='salary_expectation';
				data['range']=cNum($(this).val());
				data['vacancy_id']=$('#vacancy_id').val();
				
				ajax('statisticsAjax.php',data, success);
				fixSelect();	
			});
			fixSelect();	
			return;
		}
		if ($(this).val()=='Age') {
			
			$('#other_category').html("<?php _t("range")?>");
			
			
			numeric($('#range'));
			
			$('#range').blur(function(e) {
				var data={}
				data['type']='age';
				data['range']=cNum($(this).val());
				data['vacancy_id']=$('#vacancy_id').val();
				
				ajax('statisticsAjax.php',data, success);
				fixSelect();	
			});
			fixSelect();	
			return;
		}
			
	}
	
	
</script>

<script src="js/excellentexport.js"></script>

<table>
<tr><td>Vacancy</td><td>:</td><td><?php _p($combo_vacancy)?> <a download="applicants_raw_data.csv" id='export_data_button' class='button_link' href="#" onclick="return ExcellentExport.csv(this, 'datatable');">Export to Excel</a></td>
<tr><td>Based on</td><td>:</td><td>
	<select id='based_on'>
		<option value=''>- Base On -</option>
		<option>Gender</option>
		<option>Salary Expectation</option>
		<option>Education Background</option>
		<option>Age</option>
		<option>Field of Expertise</option>
	</select>
</td></tr>
<tr><td colspan="3">
	<div id='other_category'></div>
</td></tr>
<tr><td colspan="3">
<table>
<tr>
<td valign="top"><div id="tabular"></div></td>
<td>
<div id="canvas-holder">
	<canvas id="chart-area" width="300" height="300"/>
</div>
</td></tr></table>	
</td></tr>
</table> 
<div id="div_datatable">
</div>