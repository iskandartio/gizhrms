<?php
if ($type=='closing') {
	$con=db::beginTrans();
	$next_vacancy_progress_id=db::select_single('vacancy_progress','vacancy_progress_id v',"ifnull(vacancy_progress_val,'')='Closing'",'',array(), $con);
	$sql="select a.user_id
			from job_applied a
			where a.vacancy_id=? and ifnull(a.next_vacancy_progress_id,'')=? and a.vacancy_shortlist=1";
	$rsApplicants=db::DoQuery($sql, array($vacancy_id, $next_vacancy_progress_id), $con);
	;
	foreach ($rsApplicants as $row) {
		$user_id=$row['user_id'];
		$email=db::select_single('m_user','user_name v','user_id=?','', array($user_id));
		$res=db::select('applicants a
		inner join job_applied b on a.user_id=b.user_id and b.next_vacancy_progress_id=?
		inner join vacancy c on c.vacancy_id=b.vacancy_id','a.*, c.vacancy_type, c.allowance','','', array($next_vacancy_progress_id), $con);
		foreach ($res as $rs) {
			$user_id=db::insert('m_user','user_name', array(''), $con);
			$data=array();
			$data['user_id']=$user_id;
			$data['email']=$email;
			$data=shared::copyToData($rs, $data, ['title','contract1_start_date','contract1_end_date'
				,'first_name', 'last_name'
				, 'place_of_birth', 'date_of_birth'
				, 'gender', 'marital_status', 'nationality_id', 'nationality_val'
				, 'address', 'country_id', 'country_name', 'province_id', 'city_id', 'post_code', 'phone1', 'phone2', 'computer_skills', 'professional_skills']);
			db::insertEasy('employee', $data, $con);
			$data=array();
			$data['start_date']=$rs['contract1_start_date'];
			$data['end_date']=$rs['contract1_end_date'];
			$data['user_id']=$user_id;
			$data=shared::copyToData($rs, $data, ['job_title', 'job_position', 'project_name'
			, 'project_number', 'project_location', 'responsible_superior', 'SAP_No', 'salary', 'salary_band', 'working_time'
			, 'vacancy_type', 'allowance']);
			$data['reason']='Initial Salary';
			$contract_history_id=db::insertEasy('contract_history', $data, $con);
			
			$sql="insert into salary_sharing(contract_history_id, project_name, project_number, percentage, updated_by)
				select ?, a.project_name, a.project_number, a.percentage, ? from applicants_salary_sharing a
				inner join job_applied b on a.user_id=b.user_id and b.next_vacancy_progress_id=? and a.user_id=?";
			db::ExecMe($sql, array($contract_history_id, $_SESSION['uid'], $next_vacancy_progress_id, $rs['user_id']), $con);

			$sql="insert into employee_language(user_id, language_id, language_skill_id, language_val, updated_by)
			select ?, a.language_id, a.language_skill_id, a.language_val, ? from applicants_language a
			inner join job_applied b on a.user_id=b.user_id and b.next_vacancy_progress_id=?
			inner join vacancy c on c.vacancy_id=b.vacancy_id where a.user_id=?";
			db::ExecMe($sql, array($user_id, $_SESSION['uid'], $next_vacancy_progress_id, $rs['user_id']), $con);
			
			$sql="insert into employee_education(user_id, education_id, major, place, year_from, year_to, countries_id, updated_by)
				select ?, a.education_id, a.major, a.place, a.year_from, a.year_to, a.countries_id,? from applicants_education a
				inner join job_applied b on a.user_id=b.user_id and b.next_vacancy_progress_id=?
				inner join vacancy c on c.vacancy_id=b.vacancy_id where a.user_id=?";
			db::ExecMe($sql, array($user_id, $_SESSION['uid'], $next_vacancy_progress_id, $rs['user_id']), $con);
			$sql="insert into employee_working(user_id, month_from, month_to, year_from, year_to, employer, job_title, business_id, may_contact, leave_reason, email, phone, countries_id, updated_by)
				select ?, a.month_from, a.month_to, a.year_from, a.year_to, a.employer, a.job_title, a.business_id, a.may_contact, a.leave_reason, a.email, a.phone, a.countries_id, ? from applicants_working a
				inner join job_applied b on a.user_id=b.user_id and b.next_vacancy_progress_id=?
				inner join vacancy c on c.vacancy_id=b.vacancy_id where a.user_id=?";
			db::ExecMe($sql, array($user_id, $_SESSION['uid'], $next_vacancy_progress_id,$rs['user_id']), $con);
			
		}
	}
	db::update('job_applied', 'vacancy_progress_id, vacancy_shortlist, next_vacancy_progress_id',
		'vacancy_id=? and next_vacancy_progress_id=?', array($next_vacancy_progress_id, 0, 1000, $vacancy_id, $next_vacancy_progress_id), $con);
	db::update('vacancy', 'vacancy_progress_id','vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id), $con);
	db::delete('vacancy_timeline','vacancy_id=? and vacancy_progress_id=?',array($vacancy_id, $next_vacancy_progress_id), $con);
	db::insert('vacancy_timeline','vacancy_id, vacancy_progress_id',array($vacancy_id, $next_vacancy_progress_id), $con);
	db::commitTrans($con);
	die;		
}

if ($type=='shortlist' || $type=='cancel_interview') {
	include("pages/ajax/filter_applicant_ajax.php");
	die;
}
?>