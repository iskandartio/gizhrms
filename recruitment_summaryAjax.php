<?php
	require_once("pages/startup.php");
	if ($type=='update_interview') {
	
		db::updateEasy('vacancy_interview', $_POST);
		die;
	}
	if ($type=='export') {
        header( 'Content-Type: text/csv' );
        header( 'Content-Disposition: attachment;filename=accepted.csv');
        $fp = fopen('php://output', 'w');
        $res=job_applied::get_accepted($vacancy_id, $_SESSION['role_name']);
        foreach($res as $row) {
            fputcsv($fp, $row);
        }
        fclose($fp);
		die;
    }
/*
    // Using the function
    $sql = "SELECT * FROM table";
    // $db_conn should be a valid db handle

    // output as an attachment
    query_to_csv($db_conn, $sql, "test.csv", true);

		$res=job_applied::get_accepted($vacancy_id, $_SESSION['role_name']);
		$result="<table id='datatable'><tr>
		<th>Project Name</th>
		<th>Project Number</th>
		<th>Project Location</th>
		<th>Principal Advisor</th>
		<th>Team Leader</th>
		<th>Employee Name</th>
		<th>Current Title</th>
		<th>Responsible Superior</th>
		<th>Address</th>
		<th>Position</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Salary</th>
		<th>Salary Band</th></tr>";
		foreach ($res as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr>
					<td>$project_name</td>
					<td>$project_number</td>
					<td>$project_location</td>
					<td>$principal_advisor</td>
					<td>$team_leader</td>
					<td>$name</td>
					<td>$job_title</td>
					<td>$responsible_superior</td>
					<td>$address</td>
					<td>$position</td>
					<td>$start_date</td>
					<td>$end_date</td>
					<td>$salary</td>
					<td>$salary_band</td></tr>";
		}
		$result.="</table>";
		die($result);
	}
*/
?>