<?php
	require_once("pages/startup.php");

while (true) { 
	if ($type=='search') {
		function cmp($a, $b) {	
			return strcmp($a['name'], $b['name']);
		}
		$res_ranking=db::select('ranking','ranking_id, ranking_val','','ranking_id');
		
		$con=db::beginTrans();
		$arr_filter=array();
		$filter='';
		if ($salary_expectation_start!='') {
			$filter.=" and a.salary_expectation>=?";
			array_push($arr_filter, $salary_expectation_start);
		}
		if ($salary_expectation_end!='') {
			$filter.=" and a.salary_expectation<=?";
			array_push($arr_filter, $salary_expectation_end);
		}
		
		if ($filter_rejected=='true') {
			$sql="create temporary table filter select distinct a.user_id, ? vacancy_id, ? vacancy_progress_id
			, a.vacancy_shortlist from job_applied a 
			left join job_applied b on a.user_id=b.user_id and b.vacancy_id=? and b.vacancy_shortlist!=-1
			where b.job_applied_id is null and a.vacancy_shortlist=-1".$filter;
			db::ExecMe($sql, array_merge(array($vacancy_id, $next_vacancy_progress_id,$vacancy_id), $arr_filter), $con);
		} else if ($_SESSION['role_name']=='employee') {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else 0 end vacancy_shortlist from job_applied a
			left join vacancy_employee  b on a.vacancy_id=b.vacancy_id and b.vacancy_progress_id=?
			where ifnull(a.vacancy_progress_id,'')=? and ?!='' and a.vacancy_id=? and b.employee_id=? and a.vacancy_shortlist!=-1".$filter;
			
			db::ExecMe($sql, array_merge(array($next_vacancy_progress_id, $next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $next_vacancy_progress_id, $vacancy_id, $_SESSION['uid']), $arr_filter), $con);
		} else {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else 0 end vacancy_shortlist from job_applied a
			where ifnull(a.vacancy_progress_id,'')=? and ?!='' and a.vacancy_id=? and a.vacancy_shortlist!=-1".$filter;
			db::ExecMe($sql, array_merge(
				array($next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $next_vacancy_progress_id, $vacancy_id), $arr_filter), $con);
		}

		$params=array();
		$filter='';
		if ($filter_name!='') {
			$filter.=" and (b.first_name like ? or b.last_name like ?)";
			array_push($params, "%$filter_name%");
			array_push($params, "%$filter_name%");
		}
		if ($filter_city!='') {
			$filter.=" and c.city_val like ?";
			array_push($params, "%$filter_city%");
		}
		if ($filter_computer_skill!='') {
			$filter.=" and b.computer_skills like ?";
			array_push($params, "%$filter_computer_skill%");
		}
		if ($filter_professional_skill!='') {
			$filter.=" and b.professional_skills like ?";
			array_push($params, "%$filter_professional_skill%");
		}
		if ($age_start!='') {
			$filter.=" and date_add(date_of_birth, interval ? year)<curdate()";
			array_push($params, $age_start);
		}
		if ($age_end!='') {
			$filter.=" and date_add(date_of_birth, interval ? year)>curdate()";
			array_push($params, $age_end);
		}
		$tbl='filter';
		$tbl2='filter2';
		if ($filter!='') {
			db::ExecMe("drop table if exists $tbl2",array(),  $con);
			$sql="create temporary table $tbl2 select a.user_id, a.vacancy_id, a.vacancy_progress_id, vacancy_shortlist from $tbl a
			inner join applicants b on a.user_id=b.user_id
			left join city c on b.city=c.city_id
			where 1=1".$filter;
			$temp=$tbl;
			$tbl=$tbl2;
			$tbl2=$temp;
			db::ExecMe($sql, $params, $con);
			unset($params);
			$params=array();
		}
		if ($filter_business!='') {
			db::ExecMe("drop table if exists $tbl2", array(), $con);
			$sql="create temporary table $tbl2 select a.user_id, a.vacancy_id, a.vacancy_progress, vacancy_shortlist from $tbl a
			inner join applicants_working b on a.user_id=b.user_id
			where b.business_id=?";
			array_push($params, $filter_business);
			db::ExecMe($sql, $params, $con);
			$temp=$tbl;
			$tbl=$tbl2;
			$tbl2=$temp;
			unset($params);
			$params=array();
		}
		if (isset($filter_answer)) {
		
			foreach ($filter_answer as $f) {
				
				foreach ($f as $key=>$val) {
					
					if ($val!='') {
						db::ExecMe("drop table if exists $tbl2", array(), $con);
						$sql="create temporary table $tbl2 select c.* from applicants_answer a
		left join job_applied b on a.job_applied_id=b.job_applied_id 
		inner join $tbl c on c.user_id=b.user_id and c.vacancy_id=b.vacancy_id
		where a.question_id=? and a.choice_id=? and b.vacancy_id=?";
						db::ExecMe($sql,array($key, $val, $vacancy_id), $con);
						
						$temp=$tbl;
						$tbl=$tbl2;
						$tbl2=$temp;

					}
				}
			}
		}
		
		db::ExecMe("drop table if exists $tbl2", array(), $con);
		$sql="";
		$result=FilterApplicant::get_table_string($con, $tbl, $type, $next_vacancy_progress_id);
		
		db::commitTrans($con);
		
		die($result);
		
	}
	if ($type=='get_question') {
		$res=db::DoQuery("select a.question_id, a.choice_id, a.choice_val from choice a
left join vacancy_question b on a.question_id=b.question_id where b.vacancy_id=?", array($vacancy_id));
		$choice=array();
		foreach ($res as $row) {
			$choice[$row['question_id']][$row['choice_id']]=$row['choice_val'];
		}
		$res=db::DoQuery("select a.question_id, b.question_val from vacancy_question a
left join question b on a.question_id=b.question_id
where a.vacancy_id=?", array($vacancy_id));
		$result="";
		$i=0;
		foreach ($res as $row) {
			$row['choice']="<select title='".$row['question_val']."' id='filter_answer_".$row['question_id']."'>";
			$row['choice'].="<option value=''>".$row['question_val']."</option>";
			foreach ($choice[$row['question_id']] as $key=>$val) {
				$row['choice'].="<option value='".$key."'>".$val."</option>";
			}
			$row['choice'].="</select> ";
			$result.=$row['choice'];
			$i++;
			
		}
		$result.="</tr></table>";
		die($result);
	}
	if ($type=='save') {
		$con=db::beginTrans();
		$vacancy_employee_id=db::select_single('vacancy_employee','vacancy_employee_id v', 'vacancy_id=? and employee_id=? and vacancy_progress_id=?','' , array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id), $con);
		if ($_SESSION['role_name']=='admin' and !isset($vacancy_employee_id)) {
			$vacancy_employee_id=db::insert('vacancy_employee', 'vacancy_id, employee_id, vacancy_progress_id', array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id), $con);
		}
		if (db::select_with_count('user_ranking','vacancy_employee_id=? and  user_id=?', array($vacancy_employee_id, $user_id), $con)==0) {
			db::insert('user_ranking', 'vacancy_employee_id, user_id, ranking_id, user_comment', array($vacancy_employee_id, $user_id, $ranking_id, $user_comment), $con);
		} else {
			db::update('user_ranking','ranking_id, user_comment','vacancy_employee_id=? and user_id=?', array($ranking_id, $user_comment, $vacancy_employee_id, $user_id), $con);
		}
		$vacancy_interview_id = db::select_single('vacancy_interview', 'vacancy_interview_id v', 'vacancy_id=? and user_id=? and vacancy_progress_id=?', '', array($vacancy_id, $user_id, $next_vacancy_progress_id), $con);
		if (!isset($vacancy_interview_id)) {
			db::insert('vacancy_interview','vacancy_id, user_id, vacancy_progress_id, interview_place, interview_date, interview_time',array($vacancy_id, $user_id, $next_vacancy_progress_id, $interview_place, $interview_date, $interview_time), $con);	
		} else {
			db::update('vacancy_interview', 'interview_place, interview_date, interview_time', 'vacancy_interview_id=?', array($interview_place, $interview_date, $interview_time, $vacancy_interview_id), $con);
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='add_user') {
		$vacancy_employee_id=db::insert('vacancy_employee', 'vacancy_id, employee_id, vacancy_progress_id', array($vacancy_id, $employee_id, $vacancy_progress_id));
		die($vacancy_employee_id);
	}
	if ($type=='delete_user') {
		db::delete('vacancy_employee', 'vacancy_employee_id=?', array($vacancy_employee_id));
		die;
	}
	if ($type=='delete') {
		$vacancy_progress_val=shared::get_table_data('vacancy_progress', $next_vacancy_progress_id);
		db::ExecMe('update job_applied set vacancy_shortlist=0, next_vacancy_progress_id=null where vacancy_id=? and user_id=?', array($vacancy_id, $user_id));
		die($vacancy_progress_val);
	}
	if ($type=='restart') {
		$vacancy_progress_val=shared::get_table_data('vacancy_progress', $next_vacancy_progress_id);
		$i=db::ExecMe('update job_applied set vacancy_shortlist=0, next_vacancy_progress_id=null where vacancy_id=? and user_id=?', array($vacancy_id, $user_id));
		if ($i==0) {
			db::ExecMe('insert into job_applied(vacancy_id, user_id, date_applied, vacancy_progress_id, vacancy_shortlist) values(?,?,now(),?,0)',array($vacancy_id, $user_id, $vacancy_progress_id));
		}
		die($vacancy_progress_val);
	}
	if ($type=='get_user') {
		
		$res_users=db::DoQuery("select a.user_id, a.first_name, a.last_name from applicants a
left join  m_user_role b on a.user_id=b.user_id 
left join m_role c on c.role_id=b.role_id 
where role_name='employee' order by a.first_name, a.last_name");
		
		$sql="select a.vacancy_employee_id, a.vacancy_id, a.employee_id, concat(b.first_name,' ',b.last_name) as name from vacancy_employee a
left join applicants b on a.employee_id=b.user_id
where a.vacancy_id=? and a.vacancy_progress_id=?";
		$res=db::DoQuery($sql, array($vacancy_id, $next_vacancy_progress_id));
		$result="";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['vacancy_employee_id']."</td><td><span style='display:none'>".$row['employee_id']."</span>".$row['name']."</td>";
			if ($_SESSION['role_name']=='admin') {
				$result.="<td><img src='images/delete.png' class='btn_delete_user'></td></tr>";
			}
		}
		die ($result);
	}
	if ($type=='interview') {		
	
		$res=db::DoQuery("select concat(c.first_name,' ',c.last_name) name from vacancy_employee a
left join user_ranking b on b.vacancy_employee_id=a.vacancy_employee_id and b.user_id=?
left join applicants c on c.user_id = a.employee_id 
where a.vacancy_id=? and b.user_ranking_id is null and a.vacancy_progress_id=?", array($user_id, $vacancy_id, $next_vacancy_progress_id));
		$err="";
		foreach ($res as $row) {
			$err.=", ".$row['name'];
		}
		if ($err!='') {
			$err=substr($err,2)." have not rank this user!";
			die($err);
		}
		
		db::ExecMe('update job_applied set vacancy_shortlist=1, next_vacancy_progress_id=? where vacancy_id=? and user_id=?', array($next_vacancy_progress_id, $vacancy_id, $user_id));
		$type='save';
		
	}
	if ($type=='reject') {		
		db::ExecMe('update job_applied set vacancy_shortlist=-1, next_vacancy_progress_id=? where vacancy_id=? and user_id=?', array($next_vacancy_progress_id, $vacancy_id, $user_id));
		die;
	}
	if ($type=='shortlist') {
		
		$con=db::beginTrans();
		if (!isset($vacancy_progress_val)) {
			$vacancy_progress_val=db::select_single('vacancy_progress','vacancy_progress_val v','vacancy_progress_id=?','',array($next_vacancy_progress_id), $con);
		} else {
			$next_vacancy_progress_id=db::select_single('vacancy_progress','vacancy_progress_id v',"vacancy_progress_val='Closing'",'',array(), $con);
		}
		$sql="create temporary table filter select a.user_id, a.vacancy_id, a.next_vacancy_progress_id vacancy_progress_id, a.vacancy_shortlist from job_applied a
where a.vacancy_id=? and ifnull(a.next_vacancy_progress_id,'')=? and a.vacancy_shortlist=1";
		db::ExecMe($sql, array($vacancy_id, $next_vacancy_progress_id), $con);
		if ($vacancy_progress_val=='Shortlist') {
			$sql="select a.user_id, a.first_name, a.last_name, c.interview_date, c.interview_time, c.interview_place from applicants a inner join filter b on a.user_id=b.user_id";
			$rsApplicants=db::DoQuery($sql, array(), $con);
			$res=array();
			foreach ($rsApplicants as  $rs) {
				$res[$rs['user_id']]=array("first_name"=>$rs['first_name'], "last_name"=>$rs['last_name']);
			}
		} else if ($vacancy_progress_val=='Closing') {
			$sql="select a.user_id, b.first_name, b.last_name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist
				, c.start_date, c.end_date, c.salary, c.salary_band, c.job_title
				, c.contract_status, c.salary_band, c.project_name, c.project_number, c.principal_advisor
				, c.team_leader, c.project_location, c.responsible_superior, c.SAP_No
				, c.position from filter a
				left join applicants b on a.user_id=b.user_id
				left join contract_history c on a.user_id=c.user_id and c.end_date>curdate()";
			$rsApplicants=db::DoQuery($sql, array(), $con);
			$res=array();
			foreach ($rsApplicants as  $rs) {
				$res[$rs['user_id']]=$rs;
			}
		}  else {
			$sql="select a.user_id, a.first_name, a.last_name, c.interview_date, c.interview_time, c.interview_place from applicants a inner join filter b on a.user_id=b.user_id
			inner join vacancy_interview c on b.vacancy_id=c.vacancy_id and b.vacancy_progress_id=c.vacancy_progress_id and b.user_id=c.user_id";
			$rsApplicants=db::DoQuery($sql, array(), $con);
			$res=array();
			foreach ($rsApplicants as  $rs) {
				$res[$rs['user_id']]=array("first_name"=>$rs['first_name'], "last_name"=>$rs['last_name']
				, "interview_date"=>$rs['interview_date'], "interview_time"=>$rs['interview_time'], "interview_place"=>$rs['interview_place']);
			}
		}
		$sql="select c.user_id, d.ranking_val, c.user_comment, e.first_name, e.last_name from filter a inner join vacancy_employee b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.vacancy_progress_id
			inner join user_ranking c on c.vacancy_employee_id=b.vacancy_employee_id and a.user_id=c.user_id
			left join ranking d on d.ranking_id=c.ranking_id
			left join applicants e on e.user_id=b.employee_id";
		$rsRanking=db::DoQuery($sql, array(), $con);
		foreach ($rsRanking as $rs) {
			if (!isset($res[$rs['user_id']]['ranking'])) {
				$res[$rs['user_id']]['ranking']=array();
			}
			array_push($res[$rs['user_id']]['ranking'],array("first_name"=>$rs['first_name'], "last_name"=>$rs['last_name'], "ranking_val"=>$rs['ranking_val'], "user_comment"=>$rs['user_comment']));
		}
		
		
		db::commitTrans($con);
		
		$result=FilterApplicant::get_call_interview_table($res, $vacancy_progress_val);
		die($result);
	}
	if ($type=='interviewall') {
		$res=db::DoQuery("select distinct b.employee_id, concat(d.first_name,' ',d.last_name) name from job_applied a
left join vacancy_employee b on a.vacancy_id=b.vacancy_id and b.vacancy_progress_id=?
left join user_ranking c on c.vacancy_employee_id=b.vacancy_employee_id 
left join applicants d on d.user_id=b.employee_id 
 where vacancy_shortlist=1 and c.user_ranking_id  is null and  a.vacancy_id=?", array($next_vacancy_progress_id, $vacancy_id));
		$err="";
		foreach ($res as $row) {
			$err.=", ".$row['name'];
		}
		if ($err!='') {
			$err=trim(substr($err,2))." have not rank some users on the shortlist!";
			die($err);
		}
		
		$con=db::beginTrans();

		
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
		', 'a.user_id, b.user_name, c.vacancy_name, c.vacancy_code, c.vacancy_code2, d.interview_date, d.interview_time, d.interview_place, e.first_name, e.last_name'
		, 'a.vacancy_id=? and a.vacancy_progress_id=? and a.vacancy_shortlist=0','', array($vacancy_id, $next_vacancy_progress_id), $con);
		$interviewer_list=array();
		foreach ($res as $row) {
			$param=array();
			//@applicant_email, @applicant_name, @vacancy_name, @interview_date, @interview_time, @interview_location, @interviewer
			$param['applicant_email']=$row['user_name'];
			$param['vacancy_name']=$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")";
			$param['applicant_name']=$row['first_name']." ".$row['last_name'];
			$param['interview_date']=date('l, F d, Y', strtotime($row['interview_date']));
			$param['interview_time']=date('h:i a', strtotime($row['interview_time']));
			$param['interview_location']=$row['interview_place'];
			$interviewer_list=db::select("vacancy_employee a
			left join applicants b on a.employee_id=b.user_id
			left join contract_history c on c.user_id=b.user_id and curdate() between c.start_date and c.end_date
			left join m_user d on d.user_id=b.user_id",
			"a.employee_id, b.first_name, b.last_name, c.*, d.user_name"
			, "a.vacancy_id=? and a.vacancy_progress_id=?"
			, "", array($vacancy_id, $next_vacancy_progress_id), $con);
			$interviewers="";
			foreach ($interviewer_list as $interviewer) {
				if ($interviewers!="") $interviewers.=" and ";
				if ($interviewer['employee_id']==$_SESSION['uid']) {
					$interviewers.=" me";
				} else {
					$interviewers.=$interviewer['first_name'].' '.$interviewer['last_name'].' , the '.$interviewer['job_title'];
				}
			}
			
			
			$list.="<tr><td>".$param['applicant_name']."</td><td>".$param['interview_location']."</td>
					<td>".$param['interview_date']."</td><td>".$param['interview_time']."</td></tr>";
			$param['interviewer']=$interviewers;
			
			shared::email("invitation_".$next_vacancy_progress_id, $param, $con);
		}
		$list.="</table>";
		foreach ($interviewer_list as $interviewer) {
			$param=array();
			//@interviewer_email, @interviewer_name, @list
			$param['interviewer_email']=$interviewer['user_name'];
			$param['interviewer_name']=$interviewer['first_name'].' '.$interviewer['last_name'];
			$param['list']=$list;
			shared::email("interviewer_".$next_vacancy_progress_id, $param, $con);
		}
		$res=db::select("job_applied a
		left join m_user b on a.user_id=b.user_id
		left join vacancy c on c.vacancy_id=a.vacancy_id
		left join applicants d on d.user_id=a.user_id
		","b.user_name, c.vacancy_name, c.vacancy_code, c.vacancy_code2, d.first_name, d.last_name", "a.vacancy_shortlist=-1 and a.vacancy_id=? and a.vacancy_progress_id=?", ""
		, array($vacancy_id, $next_vacancy_progress_id), $con);

		foreach ($res as $row) {
			$param=array();
			$param['applicant_email']=$row['user_name'];
			$param['vacancy_name']=$row['vacancy_name']." (".$row['vacancy_code']."-".$row['vacancy_code2'].")";
			$param['applicant_name']=$row['first_name']." ".$row['last_name'];
			shared::email("rejection_".$next_vacancy_progress_id, $param, $con);
		}
		if ($ask_reference) {
			$res=db::select('job_applied a
			left join applicants_reference b on a.user_id=b.user_id 
			left join vacancy c on c.vacancy_id=a.vacancy_id
			left join applicants e on e.user_id=a.user_id
			', 'b.reference_name, b.email, e.first_name, e.last_name, c.vacancy_criteria'
			, 'a.vacancy_id=? and a.vacancy_progress_id=? and a.vacancy_shortlist=0','', array($vacancy_id, $next_vacancy_progress_id), $con);
			foreach ($res as $row) {
				$param=array();
				//@reference_name, @reference_email, @applicant_name, @vacancy_criteria
				$param['reference_name']=$row['reference_name'];
				$param['reference_email']=$row['email'];
				$param['applicant_name']=$row['first_name']." ".$row['last_name'];
				$param['vacancy_criteria']=$row['vacancy_criteria'];
				shared::email("reference_".$next_vacancy_progress_id, $param, $con);
			}
		}
		db::commitTrans($con);
		
		die;
	}
	if ($type=='show_detail') {
		$result="";
		
		
		$res=db::DoQuery("select concat(b.vacancy_name,' (',b.vacancy_code,'-',b.vacancy_code2,')') vacancy, a.salary_expectation, a.negotiable from job_applied a
left join vacancy b on a.vacancy_id=b.vacancy_id
where a.vacancy_id=? and a.user_id=?", array($vacancy_id, $user_id));
		foreach ($res as $row) {
			$result.="<h1>".$row['vacancy']."</h1>";
			$result.="<p>Salary Expectation = ".formatNumber($row['salary_expectation']).($row['negotiable'] ? " negotiable": "");
		}
		$res=db::DoQuery("select a.* from applicants_answer a
left join job_applied b on a.job_applied_id=b.job_applied_id 
inner join vacancy_question c on c.question_id=a.question_id and c.vacancy_id=b.vacancy_id 
where b.vacancy_id=? and b.user_id=?", array($vacancy_id, $user_id));
		$result.="<h1>Question</h1>";
		$result.="<table class='tbl'><tr><th>Question</th><th>Answer</th></tr>";
		foreach ($res as $row) {
			$result.="<tr><td>".shared::get_table_data('question', $row['question_id'])."</td>";
			$result.="<td>".shared::get_table_data('choice', $row['choice_id'])."</td>";
			$result.="</tr>";
		}
		$result.="</table>";
		$res=db::select_one('applicants','*','user_id=?','', array($user_id));
		foreach ($res as $key=>$val) {
			$$key=$val;
			
		}
		
		if ($letter!=null) {
			$result.="<a class='button_link' href='uploadajax?type=letter&user_id=$user_id'>Download Letter</a> ";
		}
		if ($cv!=null) {
			$result.="<a class='button_link' href='uploadajax?type=cv&user_id=$user_id'>Download CV</a> ";
		}
		
		$nationality=shared::get_table_data('nationality', $nationality);
		if (!$nationality) {
			$nationality=$nationality_val;
		}
		$date_of_birth=formatDate($date_of_birth);
		$country=shared::get_table_data('country', $country);
		if (!$country) {
			$country=$country_name;
		}
		$province=shared::get_table_data('province', $province);
		$city=shared::get_table_data('city', $city);
		$result.="<h1>Personal Data</h1>";
		$result.="<table>
	<tr><td>First Name </td><td>:</td><td>$first_name</td></tr>
	<tr><td>Last Name</td><td>:</td><td>$last_name</td></tr>
	<tr><td>Place of Birth</td><td>:</td><td>$place_of_birth</td></tr>
	<tr><td>Date of Birth</td><td>:</td><td>$date_of_birth</td></tr>
	<tr><td>Gender</td><td>:</td><td>$gender</td></tr>
	<tr><td>Nationality</td><td>:</td><td>$nationality</td></tr>
	<tr><td>Address</td><td>:</td><td>$address</td></tr>
	<tr><td>Country</td><td>:</td><td>$country</td></tr>
	<tr><td>Province</td><td>:</td><td>$province</td></tr>
	<tr><td>City</td><td>:</td><td>$city</td></tr>
	<tr><td>Post Code</td><td>:</td><td>$post_code</td></tr>
	<tr><td>Phone1</td><td>:</td><td>$phone1</td></tr>
	<tr><td>Phone2</td><td>:</td><td>$phone2</td></tr>
	<tr><td>Computer Skills</td><td>:</td><td>$computer_skills</td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td>$professional_skills</td></tr>";
	$result.="</table>";
	
	$result.="<h1>Working Experience</h1>";
	$res=db::select('applicants_working','*', 'user_id=?',' year_from, month_from', array($user_id));
	$result.="<table class='tbl'><tr><th>From</th><th>To</th><th>Company</th><th>Job Title</th><th>Nature of Business</th><th>Contact</th><th>Leave Reason</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".get_month_name($row['month_from'])." ".$row['year_from']."</td><td>".get_month_name($row['month_to'])." ".$row['year_to']."</td>";
		$result.="<td>".$row['employer']."</td>";
		$result.="<td>".$row['job_title']."</td>";
		$result.="<td>".shared::get_table_data('business', $row['business_id'])."</td>";
		$result.="<td>".($row['may_contact']==0 ? " " : $row['email']." ".$row['phone'])."</td>";
		$result.="<td>".$row['leave_reason']."</td></tr>";
	}
	$result.="</table>";
	
	$result.="<h1>Education</h1>";
	$res=db::select('applicants_education','*','user_id=?','year_from', array($user_id));
	$result.="<table class='tbl'><tr><th>From</th><th>To</th><th>Education Level</th><th>Institution</th><th>Major</th><th>Country</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['year_from']."</td>";
		$result.="<td>".$row['year_to']."</td>";
		$result.="<td>".shared::get_table_data('education', $row['education_id'])."</td>";
		$result.="<td>".$row['place']."</td>";
		$result.="<td>".$row['major']."</td>";
		$result.="<td>".$row['country']."</td></tr>";
	}
	$result.="</table>";
	
	$result.="<h1>Language</h1>";
	$res=db::select('applicants_language','*','user_id=?','', array($user_id));
	$result.="<table class='tbl'><tr><th>Language</th><th>Skill Level</th></tr>";
	foreach ($res as $row) {
		$language=shared::get_table_data('language', $row['language_id']);
		if (!$language) {
			$language=$row['language_val'];
		}
		$result.="<tr><td>".$language."</td>";
		$result.="<td>".shared::get_table_data('language_skill', $row['language_skill_id'])."</td></tr>";
	}
	$result.="</table>";
	
	$result.="<h1>Other Language</h1>";
	$res=db::select('applicants_other_language','*','user_id=?','', array($user_id));
	$result.="<table class='tbl'><tr><th>Language</th><th>Skill Level</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['language_val']."</td>";
		$result.="<td>".shared::get_table_data('language_skill', $row['language_skill_id'])."</td></tr>";
	}
	$result.="</table>";
	$result.="<h1>Reference</h1>";
	$res=db::select('applicants_reference','*','user_id=?','', array($user_id));
	$result.="<table class='tbl'><tr><th>Job Title</th><th>Name</th><th>Company</th><th>Email</th><th>Phone</th><th>Description</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['job_title']."</td>";
		$result.="<td>".$row['reference_name']."</td>";
		$result.="<td>".$row['company_name']."</td>";
		$result.="<td>".$row['email']."</td>";
		$result.="<td>".$row['phone']."</td>";
		$result.="<td>".$row['description']."</td>";
		$result.="</tr>";
	}
	$result.="</table>";
	
	$result.="<h1>Other Reference</h1>";
	$res=db::select('applicants_other_reference','*','user_id=?','', array($user_id));
	$result.="<table class='tbl'><tr><th>Job Title</th><th>Name</th><th>Company</th><th>Email</th><th>Phone</th><th>Description</th></tr>";
	foreach ($res as $row) {
		$result.="<tr><td>".$row['job_title']."</td>";
		$result.="<td>".$row['reference_name']."</td>";
		$result.="<td>".$row['company_name']."</td>";
		$result.="<td>".$row['email']."</td>";
		$result.="<td>".$row['phone']."</td>";
		$result.="<td>".$row['description']."</td>";
		$result.="</tr>";
	}
	$result.="</table>";
		
	die($result);
	}
	if ($type=='accept') {
		$con=db::beginTrans();
		
		if ($contract_history_id!='') {
			db::update('contract_history','start_date, end_date, salary, job_title, position
			, project_name, project_number, principal_advisor, team_leader, project_location, responsible_superior, SAP_No
			, salary_band','contract_history_id=?', array($start_date, $end_date, $salary, $job_title, $position
			, $project_name, $project_number, $principal_advisor, $team_leader, $project_location, $responsible_superior, $SAP_No
			, $salary_band,$contract_history_id), $con);
			
		} else {
			db::insert('contract_history','user_id, start_date, end_date, salary, job_title, position
			, project_name, project_number, principal_advisor, team_leader, project_location, responsible_superior, SAP_No
			, salary_band', array($user_id, $start_date, $end_date, $salary, $job_title, $position
			, $project_name, $project_number, $principal_advisor, $team_leader, $project_location, $responsible_superior, $SAP_No
			, $salary_band), $con);
		}
		db::update('applicants','contract0_start_date, contract0_end_date','user_id=?',array($start_date, $end_date, $user_id), $con);
		db::ExecMe('update job_applied set vacancy_shortlist=1, next_vacancy_progress_id=? where vacancy_id=? and user_id=?', array($next_vacancy_progress_id, $vacancy_id, $user_id), $con);		
		db::commitTrans($con);
		die;
		
	}
	if ($type=='closing') {
		$con=db::beginTrans();
		$next_vacancy_progress_id=db::select_single('vacancy_progress','vacancy_progress_id v',"vacancy_progress_val='Closing'",'',array(), $con);
		db::ExecMe('update m_user_role a inner join job_applied b on a.user_id=b.user_id set role_id=3
where vacancy_id=? and next_vacancy_progress_id=?', array($vacancy_id, $next_vacancy_progress_id), $con);
		db::ExecMe('update job_applied set vacancy_progress_id=next_vacancy_progress_id, vacancy_shortlist=0, next_vacancy_progress_id=null 
where vacancy_id=? and next_vacancy_progress_id=?', array($vacancy_id, $next_vacancy_progress_id), $con);
		db::ExecMe('update vacancy set vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id), $con);
		db::delete('vacancy_timeline','vacancy_id=? and vacancy_progress_id=?',array($vacancy_id, $next_vacancy_progress_id), $con);
		db::insert('vacancy_timeline','vacancy_id, vacancy_progress_id',array($vacancy_id, $next_vacancy_progress_id), $con);
		
		db::commitTrans($con);
		die;
		
	}
}
?>
