<?php
	require_once("libs/MPDF57/mpdf.php");
	$res=db::DoQuery("select a.vacancy_id, c.vacancy_code, c.vacancy_code2, c.vacancy_name, d.update_time from job_applied a
	left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id
	left join vacancy c on c.vacancy_id=a.vacancy_id
	left join vacancy_timeline d on d.vacancy_id=a.vacancy_id and a.vacancy_progress_id=d.vacancy_progress_id 
	where b.vacancy_progress_val='Closing'");
	$result="<table class='tbl' id='tbl'><thead><tr><th>Vacancy Id</th><th>Vacancy</th><th>Closing Date</th><th></th></tr></thead><tbody>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['vacancy_id']."</td><td>".$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")</td><td>".formatDate($row['update_time'])."</td>";
		$result.="<td>".getImageTags(array('print'))."</td></tr>";
	}
	$result.="</tbody></table>";
	
	$res=db::DoQuery("select b.update_time, b.vacancy_timeline_id, a.vacancy_name, a.vacancy_code, a.vacancy_code2, c.process_name, b.interview_date, b.interview_time, b.interview_place from vacancy a
left join vacancy_timeline b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.vacancy_progress_id
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where c.vacancy_progress_val!='Closing'");
	$result.="<table class='tbl' id='tbl_current_recruitment'><thead><tr><th>Vacancy Timeline Id</th><th>Vacancy Name</th><th>Process</th><th>Update Time</th><th>Interview Date</th><th>Time</th><th>Interview Place</th><th></th></tr></thead><tbody>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['vacancy_timeline_id']."</td><td>".$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")</td>
		<td>".$row['process_name']."</td><td>".formatDate($row['update_time'])."</td>
		<td>"._t2("interview_date",formatDate($row['interview_date']), "8")."</td>
		<td>"._t2("interview_time",$row['interview_time'],"3","","","Time")."</td>
		<td><div id='interview_place' style='border-style:dotted'>".$row['interview_place']."</div></td>
		<td>".getImageTags(array('save'))."</td>
		</tr>";
	}
	$result.="</tbody></table>";
	$result.=shared::get_tinymce_script('interview_place');
?>
<?php _p($result);

?>
<script>
	function ajax(data, Func) {
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'recruitment_summaryAjax.php',
			data:$.param(data),
			success: function(msg) {
				$('#freeze').hide();
				Func(msg);
			}
		});
	}

	$(function() {
		$('.btn_print').bind("click",Print);
		$('.btn_save').bind("click",Save);
		hideColumns('tbl');
		hideColumns('tbl_current_recruitment');
		setDatePicker();
	});
	function Print() {		
		window.open("print_recruitment_summary.php?vacancy_id="+$(this).closest("tr").children("td:eq(0)").html(),"_blank");
	}
	function Save() {
		var par=$(this).closest("tr");
		var data={};
		var f={'vacancy_timeline_id':0, 'interview_date':4, 'interview_time':5, 'interview_place':6, 'btn':7}
		data['type']='update_interview';
		data['vacancy_timeline_id']=getChild(par, 'vacancy_timeline_id', f);
		data['interview_date']=getChild(par, 'interview_date', f);
		data['interview_time']=getChild(par, 'interview_time', f);
		
		data['interview_place']=getChildObj(par, 'interview_place', f).html();
		
		var func=function(msg) {
		}
		ajax(data, func);
		
	}
</script>