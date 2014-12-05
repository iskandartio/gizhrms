<?php
require "pages/startup.php";
	
	
	if ($type=='save') {
		
		$res=db::select_one('applicants','user_id','user_id=?','', array($_SESSION['uid']));
		if (count($res)==0) {
			//db::insert('applicants','user_id, first_name, last_name, place_of_birth, date_of_birth, gender, nationality, address, country, province, city, post_code, phone1, phone2', array($_SESSION['uid'], $first_name, $last_name, $place_of_birth, $date_of_birth, $gender, $nationality, $address, $country, $province, $city, $post_code, $phone1, $phone2));
			$applicants_id=db::insertEasy('applicants', $_POST);
		} else {
			//db::update('applicants','first_name,last_name, place_of_birth, date_of_birth, gender, nationality, address, country, province, city, post_code, phone1, phone2', 'user_id=?', array($first_name, $last_name, $place_of_birth, $date_of_birth, $gender, $nationality, $address, $country, $province, $city, $post_code, $phone1, $phone2, $user_id));
			db::updateEasy('applicants', $_POST);
		}

		die($applicants_id);
	}
	if ($type=='delete') {
		db::delete('job_applied','job_applied_id=?', array($job_applied_id));
		die;
	}
	if ($type=='show_next') {
		$r="<p>";
		$res=db::DoQuery("select salary_expectation, negotiable from job_applied where  user_id=? and vacancy_id=?", array($_SESSION['uid'], $vacancy_id));
		
		if (count($res)==0) {
			$salary_expectation="";
			$negotiable=false;
		} else {
			$salary_expectation=formatNumber($res[0]['salary_expectation']);
			$negotiable=$res[0]['negotiable'];
		}
		$r.=_t2("salary_expectation", $salary_expectation);
		$r.=" <input type='checkbox' id='negotiable' ".($negotiable ? "checked" : "")."/><label for='negotiable'>Negotiable</label>";
		$res= db::DoQuery('select a.question_id, b.question_val, d.choice_id from vacancy_question a left join question b on a.question_id=b.question_id
		left join job_applied c on c.vacancy_id=a.vacancy_id and c.user_id=?
		left join applicants_answer d on d.job_applied_id=c.job_applied_id and d.question_id=a.question_id
		where a.vacancy_id=?', array($_SESSION['uid'], $vacancy_id));
		if (count($res)==0)	die;
		
		$r.='<table class="tbl" id="tbl_question"><thead><tr><th>Question ID</th><th>Question</th><th>Answer</th></tr></thead><tbody>';
		foreach ($res as $row) {
			$r.="<tr><td class='question_id'>".$row['question_id']."</td><td>".$row['question_val']."</td><td class='answer'>".get_choice($row['question_id'], $row['choice_id'])."</td></tr>";
		}
		$r.="</tbody></table>";
		
		die ($r);
	}
	if ($type=='apply') {
		$con=db::beginTrans();
		$insert=false;
		$job_applied_id=db::select_single('job_applied','job_applied_id v','vacancy_id=? and user_id=?','',array($vacancy_id, $_SESSION['uid']), $con);
		if (!isset($job_applied_id)) {
			$job_applied_id=db::insert('job_applied','vacancy_id, user_id, date_applied, salary_expectation, negotiable'
			,array($vacancy_id, $_SESSION['uid'], date('Y-m-d H:i:s'), $salary_expectation, $negotiable), $con);
			$insert=true;
		} else {
			db::update('job_applied','salary_expectation, negotiable','job_applied_id=?', array($salary_expectation, $negotiable, $job_applied_id), $con);
		}
		
		for ($i=0;$i<count($question);$i++) {
			$res=db::select_one('applicants_answer','job_applied_id','job_applied_id=? and question_id=?','', array($job_applied_id, $question[$i]), $con);
			if (count($res)>0) {
				db::update('applicants_answer','choice_id','job_applied_id=? and question_id=?', array($answer[$i], $job_applied_id, $question[$i]), $con);
			} else {
				db::insert('applicants_answer','job_applied_id, question_id, choice_id', array($job_applied_id, $question[$i], $answer[$i]), $con);
			}
		}
		$vacancy_name=db::select_single('vacancy','vacancy_name v','vacancy_id=?','', array($vacancy_id), $con);
		db::commitTrans($con);
		if ($insert) {
			_p("<tr><td>$job_applied_id</td><td><span style='display:none'>$vacancy_id</span>$vacancy_name</td><td>".getImageTags(array('edit','delete'))."</td></tr>");
		}
		die;
	}
	if ($type=='show_job_desc') {
		$vacancy_description=db::select_single('vacancy','vacancy_description v','vacancy_id=?','',array($vacancy_id));
		die ($vacancy_description);
	}
	function get_choice($question_id, $choice_id) {
		$res=db::select('choice','choice_id, choice_val', 'question_id=?', 'sort_id', array($question_id));
		$r="<select id='choice".$question_id."' class='cls_choice' title='Choose Your Answer'><option value=0> - Choose Your Answer  - </option>";
		foreach ($res as $row) {
			$r.="<option value=".$row['choice_id']." ".($choice_id==$row['choice_id'] ? 'selected' : '').">".$row['choice_val']."</option>";
		}
		$r.="</select>";
		return $r;
	}
?>