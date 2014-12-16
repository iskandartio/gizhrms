<?php
	require_once("libs/MPDF57/mpdf.php");
	$res=db::select("location", "*");
	$combo_location=shared::select_combo_complete($res, 'location_code', '- Location -');
	$res=db::DoQuery("select a.vacancy_id, c.vacancy_code, c.vacancy_code2, c.vacancy_name, d.update_time from job_applied a
	left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id
	left join vacancy c on c.vacancy_id=a.vacancy_id
	left join vacancy_timeline d on d.vacancy_id=a.vacancy_id and a.vacancy_progress_id=d.vacancy_progress_id 
	where b.vacancy_progress_val='Closing'");
	$result="<table class='tbl' id='tbl'><thead><tr><th>Vacancy Id</th><th>Vacancy</th><th>Closing Date</th><th></th></tr></thead><tbody>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['vacancy_id']."</td><td>".$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")</td><td>".formatDate($row['update_time'])."</td>";
		$result.="<td>".getImageTags(array('print','export'))."</td>";
		
		$result.="</tr>";
		
	}
	$result.="</tbody></table>";
	
	$res=db::DoQuery("select d.first_name, d.last_name, b.update_time, a0.vacancy_interview_id, a.vacancy_name, a.vacancy_code, a.vacancy_code2, c.process_name
	, a0.interview_date, a0.interview_time, a0.interview_place 
from vacancy_interview a0 
left join vacancy a on a0.vacancy_id=a.vacancy_id
left join vacancy_timeline b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.vacancy_progress_id
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
left join applicants d on d.user_id=a0.user_id
inner join job_applied e on e.vacancy_id=a.vacancy_id and e.user_id=a0.user_id and e.vacancy_progress_id=a0.vacancy_progress_id
where c.vacancy_progress_val!='Closing'");
	$result.="<table class='tbl' id='tbl_current_recruitment'><thead><tr><th>Vacancy Timeline Id</th><th>Vacancy Name</th><th>Process</th><th>Update Time</th>
	<th>Name</th>
	<th>Interview Date</th><th>Time</th><th>Interview Place</th><th></th></tr></thead><tbody>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['vacancy_interview_id']."</td><td>".$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")</td>
		<td>".$row['process_name']."</td><td>".formatDate($row['update_time'])."</td>
		<td>".$row['first_name']." ".$row['last_name']."</td>
		<td>"._t2("interview_date",formatDate($row['interview_date']), "8")."</td>
		<td>"._t2("interview_time",$row['interview_time'],"3","","","Time")."</td>
		<td>".shared::set_selected($row['interview_place'], $combo_location)."</td>
		<td>".getImageTags(array('save'))."</td>
		</tr>";
	}
	$result.="</tbody></table>";
	$result.=shared::get_tinymce_script('interview_place');
?>
<?php _p($result);

?>
<script src="js/excellentexport.js"></script>
<script>


	$(function() {
		$('.btn_print').bind("click",Print);
		$('.btn_save').bind("click",Save);
		$('.btn_export').bind("click",Export);
		hideColumns('tbl');
		hideColumns('tbl_current_recruitment');
		setDatePicker();
	});
	 
	function Print() {		
		window.open("print_recruitment_summary.php?vacancy_id="+$(this).closest("tr").children("td:eq(0)").html(),"_blank");
	}
	function Export() {
		
		var data={}
		data['type']='export';
		data['vacancy_id']=$(this).closest("tr").children("td:eq(0)").html();
		location.href="recruitmentSummaryGet.php?"+$.param(data);
		
	}
	function Save() {
		var par=$(this).closest("tr");
		var data={};
		var f={'vacancy_interview_id':0, 'interview_date':5, 'interview_time':6, 'interview_place':7, 'btn':8}
		data['type']='update_interview';
		data['vacancy_interview_id']=getChild(par, 'vacancy_interview_id', f);
		data['interview_date']=getChild(par, 'interview_date', f);
		data['interview_time']=getChild(par, 'interview_time', f);
		data['interview_place']=getChild(par, 'interview_place', f);
		
		var func=function(msg) {
		}
		ajax('recruitment_summaryAjax.php', data, func);
		
	}
</script>
