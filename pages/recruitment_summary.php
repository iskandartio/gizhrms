<?php
	require_once("libs/MPDF57/mpdf.php");
	$res=db::DoQuery("select a.vacancy_id, c.vacancy_code, c.vacancy_code2, c.vacancy_name, d.update_time from job_applied a
	left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id
	left join vacancy c on c.vacancy_id=a.vacancy_id
	left join vacancy_timeline d on d.vacancy_id=a.vacancy_id and a.vacancy_progress_id=d.vacancy_progress_id 
	where b.vacancy_progress_val='Closing'");
	$result="<table class='tbl' id='tbl'><thead><tr><th>Vacancy Id</th><th>Vacancy</th><th>Closing Date</th><th></th></tr></thead>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['vacancy_id']."</td><td>".$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")</td><td>".formatDate($row['update_time'])."</td>";
		$result.="<td>".getImageTags(array('print'))."</td></tr>";
	}
	$result.="</table>";
	/*
	$res=db::DoQuery("select concat(d.first_name,' ',d.last_name) name, c.job_title, c.start_date, c.end_date, c.salary  from job_applied a
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id
left join contract_history c on c.user_id=a.user_id and c.contract_status=0
left join applicants d on d.user_id=a.user_id 
where vacancy_progress_val='Closing'");
	$result="<table class='tbl'><tr><th>Name</th><th>Job Title</th><th>Contract Duration</th><th>Salary</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['name']."</td><td>".$row['job_title']."</td><td>".formatDateName($row['start_date'])." to ".formatDateName($row['end_date'])."</td>";
		$result.="<td>".formatNumber($row['salary'])."</td></tr>";
	}
	$result.="</table> <button class='button_link' id='print'>Print</button>";
	*/
?>
<?php _p($result);

?>
<script>
	$(function() {
		$('.btn_print').bind("click",Print);
		hideColumns('tbl');
	});
	function Print() {
		
		window.open("print_recruitment_summary.php?vacancy_id="+$(this).closest("tr").children("td:eq(0)").html(),"_blank");
	}
	
</script>