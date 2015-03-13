
<?php
	require_once("libs/MPDF57/mpdf.php");
	require_once("pages/startup.php");
	if (isset($_SESSION['role_name'])) {
		echo $_SESSION['role_name'];
		die;
	} else{
	echo 'sdassa';
		die;
	}
	$res=db::DoQuery("select concat(d.first_name,' ',d.last_name) name, c.job_title, c.start_date, c.end_date, c.salary  from job_applied a
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id
left join contract_history c on c.user_id=a.user_id and c.contract_status=0
left join applicants d on d.user_id=a.user_id 
where vacancy_progress_val='Closing' and a.vacancy_id=?", array($_GET['vacancy_id']));
	$result="<link rel='stylesheet' href='css/default.css'/>";
	$result.="<table><tr><td><img class='logoimg' src='images/logo.png' alt='PAKLIM' height='50px'></td><td><img class='logoimg' src='images/logo_web.jpg' height='50px'></td></tr></table><p>";
	$result.="<table class='tbl' style='margin:0 auto'><tr><th>Name</th><th>Job Title</th><th>Contract Duration</th><th>Salary(IDR)</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['name']."</td><td>".$row['job_title']."</td><td>".formatDateName($row['start_date'])." to ".formatDateName($row['end_date'])."</td>";
		$result.="<td>".formatNumber($row['salary'])."</td></tr>";
	}
	$result.="</table><p>";
	$result.="<table width='80%' style='margin:0 auto'><tr><td style='text-align:center'>Processed by</td><td style='text-align:center'>Approved by</td></tr>";
	$result.="<tr><td height='200px' style='text-align:center'>admin</td><td style='text-align:center'>dasfds fdsfds</td></tr></table>";
?>
<?php _p($result);

$mpdf=new mPDF(); 

$mpdf->WriteHTML($result);
$mpdf->Output();

?>