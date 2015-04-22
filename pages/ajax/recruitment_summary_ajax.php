<?php
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

?>