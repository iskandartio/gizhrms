<?php
if ($type=='cancel_interview'||$type=='shortlist') {
	include("pages/ajax/filter_applicant_ajax.php");
	die;
}
if ($type=='interviewall') {
	$con=db::beginTrans();
	$res_vacancy=db::select_one('vacancy','*','vacancy_id=?','', array($vacancy_id), $con);
	$attachment="pages/vacancy/".$res_vacancy['vacancy_code']."_".$vacancy_id.".pdf";
	$vacancy_progress_val=db::select_single('vacancy_progress','vacancy_progress_val v','vacancy_progress_id=?', '', array($next_vacancy_progress_id), $con);
	if ($vacancy_progress_val!='Shortlist') {
		$err="";
		$res=db::DoQuery("select c.first_name, c.last_name, b.interview_place, b.interview_date, b.interview_time from job_applied a 
			left join vacancy_interview b on a.next_vacancy_progress_id=b.vacancy_progress_id and a.vacancy_id=b.vacancy_id and a.user_id=b.user_id
			left join applicants c on c.user_id=a.user_id
			where a.vacancy_shortlist=1 and a.vacancy_id=? and a.next_vacancy_progress_id=?", array($vacancy_id, $next_vacancy_progress_id));
		foreach ($res as $row) {
			if ($row['interview_place']==null || $row['interview_place']=='') {
				$err.="Interview location for ".$row['first_name']." ".$row['last_name']." is not set yet\n";
			}
			if ($row['interview_date']==null || $row['interview_date']=='') {
				$err.="Interview date for ".$row['first_name']." ".$row['last_name']." is not set yet\n";
			}
			if ($row['interview_time']==null || $row['interview_time']=='') {
				$err.="Interview time for ".$row['first_name']." ".$row['last_name']." is not set yet\n";
			}
			
		}
		$res=db::DoQuery("select distinct b.employee_id, concat(d.first_name,' ',d.last_name) name from job_applied a
			left join vacancy_employee b on a.vacancy_id=b.vacancy_id and b.vacancy_progress_id=?
			left join user_ranking c on c.vacancy_employee_id=b.vacancy_employee_id and c.user_id=a.user_id
			left join employee d on d.user_id=b.employee_id 
			 where vacancy_shortlist=1 and c.user_ranking_id  is null and  a.vacancy_id=?", array($next_vacancy_progress_id, $vacancy_id));
		$err2="";
		foreach ($res as $row) {
			$err2.=", ".$row['name'];
		}
		if ($err2!='') {
			$err2=trim(substr($err2,2))." have not rank some users on the shortlist!";
			
		}
		$err=$err.$err2;
		if ($err!='') {
			die($err);
		}
	}
	
	
	db::ExecMe('update job_applied set vacancy_progress_id=next_vacancy_progress_id, vacancy_shortlist=0, next_vacancy_progress_id=null 
		where vacancy_id=? and next_vacancy_progress_id=? and vacancy_shortlist=1', array($vacancy_id, $next_vacancy_progress_id), $con);
	
	db::ExecMe('update vacancy set vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id), $con);
	
	db::delete('vacancy_timeline','vacancy_id=? and vacancy_progress_id=?',array($vacancy_id, $next_vacancy_progress_id), $con);
	
	db::insert('vacancy_timeline','vacancy_id, vacancy_progress_id'
	,array($vacancy_id, $next_vacancy_progress_id), $con);
	
	$list="<table border=1 cellpadding=3 cellspacing=0>";
	$list.="<tr><th>Name</th><th>Location</th><th>Date</th><th>Time</th></tr>";
	
	$res=db::select('job_applied a
	left join m_user b on a.user_id=b.user_id 
	left join vacancy c on c.vacancy_id=a.vacancy_id
	left join vacancy_interview d on d.vacancy_id=a.vacancy_id and d.vacancy_progress_id=a.vacancy_progress_id and d.user_id=a.user_id
	left join applicants e on e.user_id=a.user_id
	', 'c.vacancy_id, a.user_id, b.user_name, c.vacancy_name, c.vacancy_code, c.vacancy_code2, d.interview_date, d.interview_time, d.interview_place, e.title, e.first_name, e.last_name'
	, 'a.vacancy_id=? and a.vacancy_progress_id=? and a.vacancy_shortlist=0','', array($vacancy_id, $next_vacancy_progress_id), $con);
	$interviewer_list=array();
	foreach ($res as $row) {
		$param=array();
		
		//@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer
		$param['applicant_email']=$row['user_name'];
		$param['vacancy_name']=$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")";
		$param['applicant_name']=$row['title']." ".$row['first_name']." ".$row['last_name'];
		$param['interview_date']=date('l, F d, Y', strtotime($row['interview_date']));
		$param['interview_time']=date('h:i a', strtotime($row['interview_time']));
		$param['interview_location']=db::select_single('location', 'location_val v', 'location_code=?','', array($row['interview_place']), $con);
		$interviewer_list=db::select("vacancy_employee a
		left join employee b on a.employee_id=b.user_id
		left join contract_history c on c.user_id=b.user_id and c.end_date=b.contract1_end_date
		left join m_user d on d.user_id=b.user_id",
		"a.employee_id, b.title, b.first_name, b.last_name, c.*, d.user_name"
		, "a.vacancy_id=? and a.vacancy_progress_id=?"
		, "", array($vacancy_id, $next_vacancy_progress_id), $con);
		$interviewers="";
		foreach ($interviewer_list as $interviewer) {
			if ($interviewers!="") $interviewers.=" and ";
			if ($interviewer['employee_id']==$_SESSION['uid']) {
				$interviewers.=" me";
			} else {
				$interviewers.=$interviewer['title'].' '.$interviewer['first_name'].' '.$interviewer['last_name'].' , the '.$interviewer['job_title'];
			}
		}
		
		
		$list.="<tr><td>".$param['applicant_name']."</td><td>".$row['interview_place']."</td>
				<td>".$param['interview_date']."</td><td>".$param['interview_time']."</td></tr>";
		$param['interviewer']=$interviewers;
		$param['attachment']=$attachment;
		shared::email("invitation_".$next_vacancy_progress_id, $param, $con);
	}
	$list.="</table>";
	foreach ($interviewer_list as $interviewer) {
		$param=array();
		//@interviewer_email, @interviewer_name, @list
		$param['interviewer_email']=$interviewer['user_name'];
		$param['interviewer_name']=$interviewer['first_name'].' '.$interviewer['last_name'];
		$param['list']=$list;
		$param['attachment']=$attachment;
		shared::email("interviewer_".$next_vacancy_progress_id, $param, $con);
	}
	$res=db::select("job_applied a
	left join m_user b on a.user_id=b.user_id
	left join vacancy c on c.vacancy_id=a.vacancy_id
	left join applicants d on d.user_id=a.user_id
	","d.title, d.gender, b.user_name, c.vacancy_name, c.vacancy_code, c.vacancy_code2, d.first_name, d.last_name, a.vacancy_progress_id", "a.vacancy_shortlist=-1 and a.vacancy_id=?", ""
	, array($vacancy_id), $con);
	db::update('job_applied', 'vacancy_shortlist', 'vacancy_shortlist=? and vacancy_id=?', array(-2, -1, $vacancy_id), $con);
	foreach ($res as $row) {
		$param=array();
		$param['applicant_email']=$row['user_name'];
		$param['vacancy_name']=$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")";
		$param['applicant_name']=$row['title']." ".$row['first_name']." ".$row['last_name'];
		$param['attachment']=$attachment;
		shared::email("rejection_".$row['vacancy_progress_id'], $param, $con);
	}
	if ($ask_reference) {
		$res=db::select('job_applied a
		left join applicants_reference b on a.user_id=b.user_id 
		left join vacancy c on c.vacancy_id=a.vacancy_id
		left join applicants e on e.user_id=a.user_id
		', 'c.vacancy_name, c.vacancy_code, c.vacancy_code2, e.gender, b.title, b.reference_name, b.email, e.first_name, e.last_name, c.vacancy_criteria'
		, 'a.vacancy_id=? and a.vacancy_progress_id=? and a.vacancy_shortlist=0','', array($vacancy_id, $next_vacancy_progress_id), $con);
		foreach ($res as $row) {
			$param=array();
			//@reference_name, @reference_email, @applicant_name, @vacancy_criteria
			$param['reference_name']=$row['title']." ".$row['reference_name'];
			$param['reference_email']=$row['email'];
			$param['applicant_name']=$row['first_name']." ".$row['last_name'];
			$param['vacancy_criteria']=$row['vacancy_criteria'];
			$param['vacancy_name']=$row['vacancy_name'];
			$param['he']='he';
			$param['his']='his';
			$param['him']='him';
			if ($row['gender']=='Female') {
				$param['he']='she';
				$param['his']='her';
				$param['him']='her';
			}
			$param['attachment']=$attachment;
			
			shared::email("reference_".$next_vacancy_progress_id, $param, $con);
		}
	}
	db::commitTrans($con);
	
	die;
}
?>