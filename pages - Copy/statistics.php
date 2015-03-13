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
	function ExportPDF() {
		var data={};
		
	}
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
		$('#tbl_statistics tbody tr:gt(3)').each(function(idx) {
			$(this).remove();
		});
		var success=function(msg) {
			var returnDataList= jQuery.parseJSON(msg);
			var i=0;
			$('#tbl_result tr').remove();
			var a='<tr><td><button class="btn_export">Export PDF</button></td></tr>';
			$('#tbl_result').append(a);
			for (var key in returnDataList) {
				i++;
				returnData=returnDataList[key];
				
				a='<tr><td valign="top"><h2>'+key+'</h2><div id="tabular'+i+'"></div></td>';
				a+='<td><div id="canvas-holder"><canvas id="chart-area'+i+'" width="300" height="300"/></div><div id="legend'+i+'"></div></td></tr>';
				$('#tbl_result').append(a);
				pieData=returnData['pieData'];
				
				var canvas=document.getElementById("chart-area"+i);
				var ctx = canvas.getContext("2d");
				window.myPie = new Chart(ctx).Doughnut(pieData);
				$('#tabular'+i).html(returnData['tabular']);
				bind('.btn_export','click', ExportPDF);
			}
		}
		if ($(this).val()=='Gender') {
			var data={}
			data['type']="gender";
			$('#range').hide();
			data['vacancy_id']=$('#vacancy_id').val();

			ajax('statisticsAjax.php',data, success);
			
			fixSelect();
			return;
		}
		if ($(this).val()=='Salary Expectation') {
			
			$('#other_category').html("<?php _t("range")?>");
			
			$('#range').show();
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
			$('#range').show();
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
		if ($(this).val()=='Questions') {
			$('#range').hide();
			var data={}
			data['type']="questions";
			data['vacancy_id']=$('#vacancy_id').val();
			ajax('statisticsAjax.php',data, success);
			fixSelect();
			return;
		}
		if ($(this).val()=='Education Background') {
			$('#range').hide();
			var data={}
			data['type']='education';
			data['vacancy_id']=$('#vacancy_id').val();
			ajax('statisticsAjax.php',data, success);
			fixSelect();
		}
	}
	
	function ExportPDF() {
		var data=[];
		var i=0;
		
		$('#tbl_result tr:gt(0)').each(function(idx) { 
			var arr={}
			arr['tabular']=$(this).children("td:eq(0)").html();
			arr['chart']=$(this).children("td:eq(1)").children("div").children("canvas")[0].toDataURL("image/png");
			
			i++;
			data.push(arr);
		});
		
		var dataAll={}
		
		dataAll['data']=data;
		var allParams=$.param(dataAll);
		i=0;
		while (true) {
			var d={}
			i++;
			d['segment']=i;
			d['data']=allParams.substr(0,10000);
			d['last']=0;
			
			if (allParams.length<=10000) {
				d['last']=1;
			}
			
			var success=function(msg) {
				if (msg) {
					location.href="export_pdf.php?type=export_pdf&last="+msg;
				}
			}
			ajax('exportAjax.php', d, success);
			if (allParams.length<=10000) {
				break;
			}
			allParams=allParams.substr(10000);
			
		}
		
		
	}
</script>

<script src="js/excellentexport.js"></script>

<table id='tbl_statistics'>
<tr><td>Vacancy</td><td>:</td><td><?php _p($combo_vacancy)?> <a download="applicants_raw_data.csv" id='export_data_button' class='button_link' href="#" onclick="return ExcellentExport.csv(this, 'datatable');">Export to Excel</a></td>
<tr><td>Based on</td><td>:</td><td>
	<select id='based_on'>
		<option value=''>- Base On -</option>
		<option>Gender</option>
		<option>Salary Expectation</option>
		<option>Education Background</option>
		<option>Age</option>
		<option>Questions</option>
	</select>
</td></tr>
<tr><td colspan="3">
	<div id='other_category'></div>
</td></tr>

<tr><td colspan="3">
<table id="tbl_result">
</table>	
</td></tr>
</table> 
<div id="div_datatable">
</div>
<img id ='test' src="">