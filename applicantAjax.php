<?php
require "pages/startup.php";
	foreach ($_POST as $key=>$value) {
		$$key=$value;
	}
	if ($type=='save') {
		
		if ($date_of_birth=='') $date_of_birth=null;
		$res=db::select_one('applicants','user_id','user_id=?','', array($_SESSION['uid']));
		if (count($res)==0) {
			db::insert('applicants','user_id, first_name, last_name, place_of_birth, date_of_birth, gender, nationality, address, country, province, city, post_code, phone1, phone2', array($_SESSION['uid'], $first_name, $last_name, $place_of_birth, $date_of_birth, $gender, $nationality, $address, $country, $province, $city, $post_code, $phone1, $phone2));
		} else {
			db::update('applicants','first_name,last_name, place_of_birth, date_of_birth, gender, nationality, address, country, province, city, post_code, phone1, phone2', 'user_id=?', array($first_name, $last_name, $place_of_birth, $date_of_birth, $gender, $nationality, $address, $country, $province, $city, $post_code, $phone1, $phone2, $user_id));
		}

		die;
	}
	if ($type=='change_question') {
		$res= db::DoQuery('select a.question_id, b.question, d.choice_id from vacation_question a left join question b on a.question_id=b.question_id
		left join job_applied c on c.vacation_id=a.vacation_id and c.user_id=?
		left join applicants_answer d on d.job_applied_id=c.job_applied_id and d.question_id=a.question_id
		where a.vacation_id=?', array($_SESSION['uid'], $vacation_id));
		if (count($res)==0)	die;
		
		$r='<table class="tbl" id="tbl_question"><tr><th>Question ID</th><th>Question</th><th>Answer</th></tr>';
		foreach ($res as $row) {
			$r.="<tr><td class='question_id'>".$row['question_id']."</td><td>".$row['question']."</td><td class='answer'>".get_choice($row['question_id'], $row['choice_id'])."</td></tr>";
		}
		$r.="</table>";
		
		die ($r);
	}
	if ($type=='apply') {
		$con=db::beginTrans();
		$insert=false;
		$job_applied_id=db::select_single('job_applied','job_applied_id v','vacation_id=? and user_id=?','',array($vacation_id, $_SESSION['uid']));
		if (!isset($job_applied_id)) {
			$job_applied_id=db::insert('job_applied','vacation_id, user_id, date_applied',array($vacation_id, $_SESSION['uid'], date('Y-m-d H:i:s')));
			$insert=true;
		}
		
		for ($i=0;$i<count($question);$i++) {
			$res=db::select_one('applicants_answer','job_applied_id','job_applied_id=? and question_id=?','', array($job_applied_id, $question[$i]), $con);
			if (count($res)>0) {
				db::update('applicants_answer','choice_id','job_applied_id=? and question_id=?', array($answer[$i], $job_applied_id, $question[$i]), $con);
			} else {
				db::insert('applicants_answer','job_applied_id, question_id, choice_id', array($job_applied_id, $question[$i], $answer[$i]), $con);
			}
		}
		$vacation_name=db::select_single('vacation','vacation_name v','vacation_id=?','', array($vacation_id));
		db::commitTrans($con);
		if ($insert) {
			_p("<tr><td>$vacation_id</td><td>$vacation_name</td><td><img src='images/edit.png' class='btn_edit'/></td></tr>");
		}
		die;
	}
	function get_choice($question_id, $choice_id) {
		$res=db::select('choice','choice_id, choice', 'question_id=?', 'sort_id', array($question_id));
		$r="<select id='choice".$question_id."' class='cls_choice'><option value=0> - Choose Your Answer  - </option>";
		foreach ($res as $row) {
			$r.="<option value=".$row['choice_id']." ".($choice_id==$row['choice_id'] ? 'selected' : '').">".$row['choice']."</option>";
		}
		$r.="</select>";
		return $r;
	}
?>