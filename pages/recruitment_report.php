<?php
	$res=db::DoQuery("select distinct concat(b.vacancy_name,' (',b.vacancy_code,'-',b.vacancy_code2,')') vacancy, c.process_name from vacancy_employee a
left join vacancy b on a.vacancy_id=b.vacancy_id
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where c.vacancy_progress_val !='Closing' and a.employee_id=?", array($_SESSION['uid']));
	$result="<table class='tbl'>";
	$result.="<tr><th>Vacancy</th><th>Process Name</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['vacancy']."</td><td>".$row['process_name']."</td></tr>";
	}
	$result.="</table>";
	_p($result);
?>
