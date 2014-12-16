<?php
	require_once("pages/startup.php");
	
	if (!isset($_SESSION['role_name'])) {
		die ("can't print!");
	}
	
	$res=job_applied::get_accepted($_GET['vacancy_id'], $_SESSION['role_name']);
	
	$result="<link rel='stylesheet' href='css/default.css'/>";
	$result.="<table><tr><td><img class='logoimg' src='images/logo.png' alt='PAKLIM' height='50px'></td><td><img class='logoimg' src='images/logo_web.jpg' height='50px'></td></tr></table><p>";
	$result.="<table class='tbl' style='margin:0 auto'><tr><th>Name</th><th>Job Title</th><th>Contract Duration</th><th>Salary(IDR)</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['name']."</td><td>".$row['job_title']."</td><td>".formatDateName($row['start_date'])." to ".formatDateName($row['end_date'])."</td>";
		$result.="<td>".formatNumber($row['salary'])."</td></tr>";
	}
	$result.="</table><p>";
	$admin_name="(".db::select_single('applicants', "concat(first_name,' ',last_name) v", 'user_id=?', '', array($_SESSION['uid'])).")";
	$nego_names=db::DoQuery("select concat(c.first_name,' ',c.last_name) name from vacancy_employee a
left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id 
left join applicants c on c.user_id=a.employee_id 
where b.vacancy_progress_val='Negotiation' and a.employee_id !=? and a.vacancy_id=?", array($_SESSION['uid'], $_GET['vacancy_id']));
	$nego_names_string="";
	foreach ($nego_names as $row) {
		$nego_names_string.=" (".$row['name'].") ";
	}
	$result.="<table width='80%' style='margin:0 auto'><tr><td style='text-align:center'>Processed by</td><td style='text-align:center'>Approved by</td></tr>";
	$result.="<tr><td height='200px' style='text-align:center'>$admin_name</td><td style='text-align:center'>$nego_names_string</td></tr></table>";



require_once("libs/MPDF57/mpdf.php");
	
$mpdf=new mPDF(); 

$mpdf->WriteHTML($result);
$mpdf->Output();
exit;
