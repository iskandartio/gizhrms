<?php
function cmp($a, $b) {	
	return strcmp($a['name'], $b['name']);
}
while (true) { 
	if ($type=='search') {
		
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
			left join job_applied b on a.user_id=b.user_id and b.vacancy_id=? and b.vacancy_shortlist>=0
			where b.job_applied_id is null and a.vacancy_shortlist<0".$filter;
			db::ExecMe($sql, array_merge(array($vacancy_id, $next_vacancy_progress_id,$vacancy_id), $arr_filter), $con);
		} else {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else 0 end vacancy_shortlist from job_applied a
			where ifnull(a.vacancy_progress_id,'')=? and a.vacancy_id=? and a.vacancy_shortlist>=0".$filter;
			db::ExecMe($sql, array_merge(
				array($next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $vacancy_id), $arr_filter), $con);
		}

		$params=array();
		$filter='';
		if ($filter_name!='') {
			$filter.=" and concat(b.first_name,' ',b.last_name) like ?";
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
		if ($filter_choice_val=='Name' && $filter_name=='') {
			$filter.=" and concat(b.first_name,' ',b.last_name) like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Place of Birth') {
			$filter.=" and b.place_of_birth like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Gender') {
			$filter.=" and b.gender like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Marital Status') {
			$filter.=" and b.marital_status like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Nationality') {
			$filter.=" and ifnull(d.nationality_val,b.nationality_val) like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Address') {
			$filter.=" and b.address like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Country') {
			$filter.=" and ifnull(e.country_val, b.country_name) like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Province') {
			$filter.=" and f.province_val like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='City' && $filter_city=='') {
			$filter.=" and c.city_val like ?";
			array_push($params, "%$filter_choice_value%");
		}
		if ($filter_choice_val=='Post Code') {
			$filter.=" and b.post_code like ?";
			array_push($params, "%$filter_choice_value%");
		}
		$tbl='filter';
		$tbl2='filter2';
		
		if ($filter!='') {
			
			db::ExecMe("drop table if exists $tbl2",array(),  $con);
			$sql="create temporary table $tbl2 select a.user_id, a.vacancy_id, a.vacancy_progress_id, vacancy_shortlist from $tbl a
			inner join applicants b on a.user_id=b.user_id
			left join city c on b.city_id=c.city_id
			left join nationality d on d.nationality_id=b.nationality_id
			left join country e on e.country_id=b.country_id
			left join province f on f.province_id=b.province_id
			where 1=1".$filter;
			$temp=$tbl;
			$tbl=$tbl2;
			$tbl2=$temp;
			db::ExecMe($sql, $params, $con);
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
		$res=db::select('applicants a 
			inner  join job_applied b on a.user_id=b.user_id
			inner join '.$tbl.' c on c.user_id=b.user_id and c.vacancy_id=b.vacancy_id
			left join nationality d on d.nationality_id=a.nationality_id
			left join country e on e.country_id=a.country_id
			left join province f on f.province_id=a.province_id
			left join city g on g.city_id=a.city_id
			', 'a.*, ifnull(d.nationality_val, a.nationality_val) nationality
			, ifnull(e.country_val, a.country_name) country
			, f.province_val province
			, g.city_val city','','',array(), $con);
		$result="";
		$result.="<script src='js/excellentexport.js'></script>";
		$dataTable=shared::setDataTable($res, ['first_name','last_name','place_of_birth','date_of_birth','gender','marital_status'
		, 'nationality','address', 'country', 'province', 'city', 'post_code','phone1','phone2','computer_skills','professional_skills']);
		$result.=$dataTable;
		if ($dataTable!='No Data') {
			$result.=" <a download='applicants_raw_data.csv' id='btn_export_data' class='button_link' onclick=\"return ExcellentExport.csv(this, 'data_table');\">Export to Excel</a>";		
		}
		
		$result.=FilterApplicant::get_table_string($con, $tbl, $type, $next_vacancy_progress_id);
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
		$vacancy_progress_val=db::select_single('vacancy_progress','vacancy_progress_val v','vacancy_progress_id=?', '', array($next_vacancy_progress_id), $con);
		$vacancy_employee_id=db::select_single('vacancy_employee','vacancy_employee_id v', 'vacancy_id=? and employee_id=? and vacancy_progress_id=?','' , array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id), $con);
		if ($vacancy_progress_val!='Shortlist' && !isset($vacancy_employee_id)) {
			$vacancy_employee_id=db::insert('vacancy_employee', 'vacancy_id, employee_id, vacancy_progress_id', array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id), $con);
		}
		
		if ($vacancy_progress_val!='Shortlist') {
			
			if (db::select_with_count('user_ranking','vacancy_employee_id=? and  user_id=?', array($vacancy_employee_id, $user_id), $con)==0) {
				db::insert('user_ranking', 'vacancy_employee_id, user_id, ranking_id, user_comment', array($vacancy_employee_id, $user_id, $ranking_id, $user_comment), $con);
			} else {
				db::update('user_ranking','ranking_id, user_comment','vacancy_employee_id=? and user_id=?', array($ranking_id, $user_comment, $vacancy_employee_id, $user_id), $con);
			}
		}
		db::update('job_applied','next_vacancy_progress_id','vacancy_id=? and user_id=?',array($next_vacancy_progress_id, $vacancy_id, $user_id), $con);
		
		if ($vacancy_progress_val!='Shortlist') {
			$vacancy_interview_id = db::select_single('vacancy_interview', 'vacancy_interview_id v', 'vacancy_id=? and user_id=? and vacancy_progress_id=?', '', array($vacancy_id, $user_id, $next_vacancy_progress_id), $con);
			if (!isset($vacancy_interview_id)) {
				db::insert('vacancy_interview','vacancy_id, user_id, vacancy_progress_id, interview_place, interview_date, interview_time',array($vacancy_id, $user_id, $next_vacancy_progress_id, $interview_place, $interview_date, $interview_time), $con);	
			} else {
				db::update('vacancy_interview', 'interview_place, interview_date, interview_time', 'vacancy_interview_id=?', array($interview_place, $interview_date, $interview_time, $vacancy_interview_id), $con);
			}
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='add_user') {
		$employee_id=shared::getId('employee_choice', $employee_id);
		$vacancy_employee_id=db::insert('vacancy_employee', 'vacancy_id, employee_id, vacancy_progress_id', array($vacancy_id, $employee_id, $vacancy_progress_id));
		$key=shared::random(12);
		$_SESSION['vacancy_employee_id'][$key]=$vacancy_employee_id;
		die($key);
	}
	if ($type=='delete_user') {
		$vacancy_employee_id=shared::getId('vacancy_employee_id', $vacancy_employee_id);
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

		$sql="select a.vacancy_employee_id, a.vacancy_id, a.employee_id, concat(b.first_name,' ',b.last_name) as name from vacancy_employee a
left join employee b on a.employee_id=b.user_id
where a.vacancy_id=? and a.vacancy_progress_id=?";
		$res=db::DoQuery($sql, array($vacancy_id, $next_vacancy_progress_id));
		shared::setId('vacancy_employee_id', 'vacancy_employee_id', $res);
		$result="";
		foreach ($res as $row) {
			
			$result.="<tr><td>".$row['id']."</td><td><span style='display:none'>".shared::getKeyFromValue($_SESSION['employee_choice'], $row['employee_id'])."</span>".$row['name']."</td>";
			$result.="<td><img src='images/delete.png' class='btn_delete_user'></td></tr>";
		}
		die ($result);
	}
	if ($type=='interview') {		
		db::ExecMe('update job_applied set vacancy_shortlist=1 where vacancy_id=? and user_id=?', array($vacancy_id, $user_id));
		db::ExecMe('update vacancy set next_vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id));
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
			$next_vacancy_progress_id=db::select_single('vacancy_progress','vacancy_progress_id v',"ifnull(vacancy_progress_val,'')='Closing'",'',array(), $con);
		}
		
		$sql="create temporary table filter select a.job_applied_id, a.user_id, a.vacancy_id, a.next_vacancy_progress_id vacancy_progress_id, a.vacancy_shortlist from job_applied a
where a.vacancy_id=? and ifnull(a.next_vacancy_progress_id,'')=? and a.vacancy_shortlist=1";
		db::ExecMe($sql, array($vacancy_id, $next_vacancy_progress_id), $con);
		if ($vacancy_progress_val=='Shortlist') {
			$sql="select b.job_applied_id, a.user_id, a.first_name, a.last_name from applicants a inner join filter b on a.user_id=b.user_id";
			$rsApplicants=db::DoQuery($sql, array(), $con);
			$res=array();
			foreach ($rsApplicants as  $rs) {
				$res[$rs['job_applied_id']]=array("first_name"=>$rs['first_name'], "last_name"=>$rs['last_name']);
			}
		} else if ($vacancy_progress_val=='Closing') {
			$sql="select a.job_applied_id, a.user_id, concat(b.first_name,' ', b.last_name) name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist
				, b.contract1_start_date, b.contract1_end_date
				, b.salary, b.salary_band, b.working_time
				, b.job_title, b.job_position
				, b.project_name, b.principal_advisor, b.financial_controller
				, b.project_number, b.team_leader
				, b.project_location, b.office_manager
				, b.responsible_superior, b.SAP_No
				from filter a
				left join applicants b on a.user_id=b.user_id";
			$rsApplicants=db::DoQuery($sql, array(), $con);
			$res=array();
			
			
			foreach ($rsApplicants as  $key=>$rs) {
				$rs['salary']=shared::decrypt($rs['salary']);
				$res[$rs['job_applied_id']]=$rs;
				
			}
			uasort($res, 'cmp');
			
		}  else {
			$sql="select b.job_applied_id, a.user_id, a.first_name, a.last_name, c.interview_date, c.interview_time, c.interview_place from applicants a inner join filter b on a.user_id=b.user_id
			inner join vacancy_interview c on b.vacancy_id=c.vacancy_id and b.vacancy_progress_id=c.vacancy_progress_id and b.user_id=c.user_id";
			
			$rsApplicants=db::DoQuery($sql, array(), $con);
			$res=array();
			foreach ($rsApplicants as  $rs) {
				$res[$rs['job_applied_id']]=array("first_name"=>$rs['first_name'], "last_name"=>$rs['last_name']
				, "interview_date"=>$rs['interview_date'], "interview_time"=>$rs['interview_time'], "interview_place"=>$rs['interview_place']);
			}
		}
		$sql="select a.job_applied_id, c.user_id, d.ranking_val, c.user_comment, e.first_name, e.last_name from filter a inner join vacancy_employee b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.vacancy_progress_id
			inner join user_ranking c on c.vacancy_employee_id=b.vacancy_employee_id and a.user_id=c.user_id
			left join ranking d on d.ranking_id=c.ranking_id
			left join employee e on e.user_id=b.employee_id";
		$rsRanking=db::DoQuery($sql, array(), $con);
		foreach ($rsRanking as $rs) {
			shared::setArr($res[$rs['job_applied_id']]['ranking'], 
				array("first_name"=>$rs['first_name'], "last_name"=>$rs['last_name'], "ranking_val"=>$rs['ranking_val'], "user_comment"=>$rs['user_comment']));

		}
			
		$resRejected=db::select('job_applied a left join applicants b on a.user_id=b.user_id','a.*, b.first_name, b.last_name','a.vacancy_shortlist=-1 and a.vacancy_id=?', '' ,array($vacancy_id), $con);
		$closing_vacancy_progress_id=db::select_single('vacancy_progress','vacancy_progress_id v',"ifnull(vacancy_progress_val,'')='Closing'",'',array(), $con);
		$resUnknown=db::select('job_applied a left join applicants b on a.user_id=b.user_id','a.*, b.first_name, b.last_name',"a.vacancy_shortlist=0 and a.vacancy_id=? and ifnull(a.vacancy_progress_id,'')!=?", '' ,array($vacancy_id, $closing_vacancy_progress_id), $con);
		db::commitTrans($con);
		$result=FilterApplicant::get_call_interview_table($res, $vacancy_progress_val, $resRejected, $resUnknown);
		
		die($result);
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
			$result.="<a class='button_link' href='downloadcv?type=letter&user_id=$user_id'>Download Letter</a> ";
		}
		if ($cv!=null) {
			$result.="<a class='button_link' href='downloadcv?type=cv&user_id=$user_id'>Download CV</a> ";
		}
		
		$nationality=shared::get_table_data('nationality', $nationality_id);
		if (!$nationality) {
			$nationality=$nationality_val;
		}
		$date_of_birth=formatDate($date_of_birth);
		$country=shared::get_table_data('country', $country_id);
		if (!$country) {
			$country=$country_name;
		}
		$province=shared::get_table_data('province', $province_id);
		$city=shared::get_table_data('city', $city_id);
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
		$result.="<td>".$row['countries_id']."</td></tr>";
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
		$_POST['salary']=shared::encrypt($salary);
		
		unset($_POST['vacancy_id']);
		unset($_POST['next_vacancy_progress_id']);
		db::updateShort('applicants', 'user_id', $_POST, $con);
		
		db::delete('applicants_salary_sharing','user_id=?', array($user_id), $con);

		db::update('job_applied', 'vacancy_shortlist, next_vacancy_progress_id', 'vacancy_id=? and user_id=?', array(1, $next_vacancy_progress_id, $vacancy_id, $user_id), $con);
		if (isset($salary_sharing_project_name)) {
			foreach ($salary_sharing_project_name as $key=>$val) {
				db::insert('applicants_salary_sharing','user_id, project_name, project_number, percentage', array($user_id, $val, $salary_sharing_project_number[$key], $salary_sharing_percentage[$key]), $con);
			}
		}
		db::ExecMe('update vacancy set next_vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id));
		db::commitTrans($con);
		die;
		
	}
	if ($type=='cancel_interview') {
		$id_real=$_SESSION['call_interview_table'][$id];
		unset($_SESSION['call_interview_table'][$id]);
		db::update('job_applied', 'vacancy_shortlist', 'job_applied_id=?', array(0, $id_real));
		die;
	}
	
	//project_ajax link
	if ($type=='getProjectClass'||$type=='getProjectLocationClass') {
		require("pages/ajax/project_ajax.php");
	}
}
?>
