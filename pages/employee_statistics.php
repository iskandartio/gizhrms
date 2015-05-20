
<script src="js/chart.js"></script>
<script>

	$(function() {
		fixSelect();
		
		bind('#based_on','change', BasedOnChange);
		
		
		$('#div_datatable').hide();
		var successDataTable=function(msg) {
			$('#div_datatable').html(msg);
			$('#export_data_button').show();
		}
		var data={}
		data['type']="get_datatable";
		data['vacancy_id']=$('#vacancy_id').val();
		ajax('employee_statistics_ajax',data, successDataTable);
		fixSelect();
	});
	function ExportPDF() {
		var data={};
		
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
			var a='';
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
				fixSelect();
			}
		}
		if ($(this).val()=='Gender') {
			var data={}
			data['type']="gender";
			$('#range').hide();
			ajax('employee_statistics_ajax',data, success);
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
				
				ajax('statistics_ajax',data, success);
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
				
				ajax('employee_statistics_ajax',data, success);
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
			ajax('statistics_ajax',data, success);
			fixSelect();
			return;
		}
		if ($(this).val()=='Education Background') {
			$('#range').hide();
			var data={}
			data['type']='education';
			data['vacancy_id']=$('#vacancy_id').val();
			ajax('statistics_ajax',data, success);
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
<a download="statistics_raw_data.csv" id='export_data_button' class='button_link' href="#" onclick="return ExcellentExport.csv(this, 'datatable');">Export to Excel</a>
<table id='tbl_statistics'>
<tr><td>Based on</td><td>:</td><td>
	<select id='based_on'>
		<option value=''>- Base On -</option>
		<option>Gender</option>
		<option>Age</option>
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