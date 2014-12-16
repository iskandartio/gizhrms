<?php
	require_once("pages/startup.php");
	if ($_GET['type']=='export') {
		header( 'Content-Type: text/csv' );
        header( 'Content-Disposition: attachment;filename=accepted.csv');
		ob_start();
        $fp = fopen('php://output', 'w');
        $res=job_applied::get_accepted($_GET['vacancy_id'], $_SESSION['role_name']);
		fputcsv($fp, array_keys($res[0]));
        foreach($res as $row) {
		    fputcsv($fp, $row);
        }
		
		$str=ob_get_contents();
		$str=substr($str,0,strlen($str)-1);
		ob_end_clean();
		echo $str;
        fclose($fp);
		die;
	}
?>