<?php
	if (isset($_POST)) {
		
		if ($type=='search') {
			$res=db::select('vacancy','vacancy_id,vacancy_code,vacancy_code2,vacancy_name,vacancy_description, vacancy_criteria, vacancy_startdate, vacancy_enddate, vacancy_type, allowance, vacancy_closedate','? between vacancy_startdate and vacancy_enddate'
			,'vacancy_code, vacancy_code2', array($date_filter));
			$r='<table id="tbl_vacancy" class="tbl">';
			$r.="<thead><tr><th>Vacancy ID</th><th>Vacancy Code</th><th>Vacancy Code2</th><th>Vacancy Name</th>
			<th style='display:none'>Vacancy Description</th>
			<th style='display:none'>Vacancy Criteria</th>
			<th>Start</th><th>End</th><th>Vacancy Type</th><th>Allowance</th><th></th></tr></thead>";
			foreach ($res as $row) {
				$r.="<tr><td>".$row['vacancy_id']."</td><td>".$row['vacancy_code']."</td><td>".$row['vacancy_code2']."</td><td>".$row['vacancy_name']."</td>
				<td style='display:none'>".$row['vacancy_description']."</td>
				<td style='display:none'>".$row['vacancy_criteria']."</td>
				<td>".formatDate($row['vacancy_startdate'])."</td><td>".formatDate($row['vacancy_enddate'])."</td>
				<td><span style='display:none'>".$row['vacancy_type']."</span>".$row['vacancy_type']."</td><td>".formatNumber($row['allowance'])."</td>";
				$r.="<td>".getImageTags(array('edit','delete'))."</td></tr>";
			}
			$r.="</table>";
			die($r);
		}
		if ($type=='get_questions') {
			$sql="select a.question_id, b.question_val from vacancy_question a left join question b on a.question_id=b.question_id where a.vacancy_id=?";
			$res=db::DoQuery($sql, array($vacancy_id));
			$r=array();
			
			foreach($res as $row) {
				array_push($r, $row['question_id']);
				
			}
			die(json_encode($r));
		}
		if ($type=='delete_question') {
			$res=db::delete('vacancy_question','vacancy_id=? and question_id=?', array($vacancy_id,$question_id));
			die;
		}
		if ($type=='save') {
			$res=db::select_one('vacancy','vacancy_id, vacancy_description','vacancy_id=?','', array($vacancy_id));
			if (count($res)==0 || $res['vacancy_description']!=$vacancy_description) {
				include("pages/MPDF/mpdf.php");
				$mpdf=new mPDF('c'); 
				$mpdf->SetDisplayMode('fullpage');
				$mpdf->WriteHTML($vacancy_description);
				//mkdir('pages/vacancy', 0755, true);
				$mpdf->Output("pages/vacancy/".$vacancy_code."_".$vacancy_id.".pdf");
			}
			$con=db::beginTrans();
			if (count($res)==0) {
				$vacancy_id=db::insertEasy('vacancy', $_POST, $con);
			} else {
				db::updateEasy('vacancy', $_POST, $con);
			}
			$i=0;
			$res=db::select('vacancy_question','question_id','vacancy_id=?','',array($vacancy_id));
			$questions=array();
			foreach ($res as $row) {
				$questions[$row['question_id']]=1;
				
			}
			
			//$question_id=$_POST['question_id'];
			if (isset($question_id)) {
				foreach ($_POST['question_id'] as $q) {
					if (isset($questions[$q])) {
						unset($questions[$q]);
					} else {
						db::insert('vacancy_question','question_id, vacancy_id', array($q, $vacancy_id), $con);
					}
				}
			}
			
			
			foreach ($questions as $key=>$val) {
				
				db::delete('vacancy_question','question_id=? and vacancy_id=?',array($key, $vacancy_id));
			}
			db::commitTrans($con);
			die($vacancy_id);
		}
		if ($type=='delete') {
			$con=db::beginTrans();
			db::delete('vacancy','vacancy_id=?',array($vacancy_id), $con);
			db::delete('vacancy_question','vacancy_id=?',array($vacancy_id), $con);
			db::commitTrans($con);
		}
	}
?>