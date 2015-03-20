<?php
	if ($type=='load') {
		$user_id=$_SESSION['user_id'];
		$applicant=db::select_one('applicants','spouse_name, marry_date, spouse_entitled','user_id=?','',array($user_id));
		$res=Employee::get_dependent_res($user_id);
		$result=Employee::get_dependent_table($res, $applicant['spouse_name'], $applicant['marry_date'], $applicant['spouse_entitled']);
		$result.="<script src='js/dependents.js'></script>";
		$data['result']=$result;
		die(json_encode($data));
	}
?>