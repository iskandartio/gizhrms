<?php
	if ($type=='update_interview') {
	
		db::updateEasy('vacancy_interview', $_POST);
		die;
	}
	if ($type=='export') {
		
        header( 'Content-Type: text/csv' );
        header( 'Content-Disposition: attachment;filename=accepted.csv');
        $fp = fopen('php://output', 'w');
        $res=job_applied::get_accepted($vacancy_id);
        foreach($res as $row) {
            fputcsv($fp, $row);
        }
        fclose($fp);
		die;
    }
	if ($type=='set_contract_history_id') {
		require_once("pages/ajax/employe_detail_ajax.php");
	}
?>