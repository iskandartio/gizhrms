<?php
	require_once("pages/startup.php");
	
function get_table_string($con, $tbl, $type, $next_vacancy_progress_id='') {

	
	$vacancy_progress_val=shared::get_table_data('vacancy_progress', $next_vacancy_progress_id);
	if ($vacancy_progress_val=='Closing') {
		$sql="select a.user_id, b.first_name, b.last_name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist, c.job_title, c.start_date, c.end_date, c.salary from $tbl a
	left join applicants b on a.user_id=b.user_id
	left join contract_history c on a.user_id=c.user_id and c.end_date>now()";
		$res=db::DoQuery($sql, array(), $con);
	
		$result="<table class='tbl'><tr><th>User Id</th><th>First Name</th><th>Last Name</th><th>Job Title</th><th>Contract Duration</th><th>Salary</th><th></th></tr>";
		foreach ($res as $row) {
			$btn=array();
			if ($_SESSION['role_name']=='employee') {
				
			} else if ($type!='shortlist' && $row['vacancy_shortlist']==0) {
				array_push($btn, 'accept');
				array_push($btn, 'reject');
			} else {
				if ($row['vacancy_shortlist']==1) {
					
					array_push($btn, 'delete');
				} else {
					array_push($btn, 'restart');
				}
			}
			$result.="<tr><td>".$row['user_id']."</td><td>".$row['first_name']."</td><td>".$row['last_name']."</td>";
			$result.="<td><input type='text' id='job_title' placeholder='Job Title' value='".$row['job_title']."'/></td>";
			$result.="<td><input type='text' id='start_date' class='start_date' placeholder='Start Date' size='8' value='".formatDate($row['start_date'])."'/> 
			<input type='text' id='end_date'  class='end_date' placeholder='End Date' size='8' value='".formatDate($row['end_date'])."'/></td>";
			$result.="<td><input type='text' id='salary' placeholder='Salary' value='".$row['salary']."'/></td>";
			$result.="<td>".getImageTags($btn)."</td>";
			$result.="</tr>";
		}
		$result.="</table>";
	
	} else {
		$sql="select a.user_id, b.first_name, b.last_name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist from $tbl a
	left join applicants b on a.user_id=b.user_id";
		$res=db::DoQuery($sql, array(), $con);
		
		$sql="drop table temp_rank";
		db::ExecMe($sql, array(), $con);
		$sql="create temporary table temp_rank
	select b.vacancy_employee_id, b.employee_id, a.user_id, a.ranking_id, a.user_comment, concat(d.first_name,' ', d.last_name) as name, e.ranking_val from user_ranking a
	left join vacancy_employee b on a.vacancy_employee_id=b.vacancy_employee_id 
	inner join $tbl c on c.user_id=a.user_id and c.vacancy_id=b.vacancy_id and c.vacancy_progress_id=b.vacancy_progress_id
	left join applicants d on d.user_id=b.employee_id
	left join ranking e on e.ranking_id=a.ranking_id
	where  a.ranking_id is not null";
		db::ExecMe($sql, array(), $con);
		$sql="create temporary table temp_rank2
	select b.vacancy_employee_id, b.employee_id, a.user_id, a.ranking_id, a.user_comment, concat(d.first_name,' ', d.last_name) as name, e.ranking_val from user_ranking a
	left join vacancy_employee b on a.vacancy_employee_id=b.vacancy_employee_id 
	inner join $tbl c on c.user_id=a.user_id and c.vacancy_id=b.vacancy_id
	left join applicants d on d.user_id=b.employee_id
	left join ranking e on e.ranking_id=a.ranking_id
	inner join vacancy f on f.vacancy_id=b.vacancy_id and f.vacancy_progress_id=b.vacancy_progress_id 
	left join temp_rank g on g.vacancy_employee_id=b.vacancy_employee_id and a.user_id=g.user_id";
		db::ExecMe($sql, array(), $con);

		$res_ranking=db::DoQuery("select * from temp_rank2 union all select * from temp_rank", array(), $con);
		
		$ranking=array();
		foreach ($res_ranking as $row) {
			$ranking[$row['user_id']][$row['employee_id']]['employee_id']=$row['employee_id'];
			$ranking[$row['user_id']][$row['employee_id']]['name']=$row['name'];
			$ranking[$row['user_id']][$row['employee_id']]['ranking_id']=$row['ranking_id'];
			$ranking[$row['user_id']][$row['employee_id']]['ranking_val']=$row['ranking_val'];
			$ranking[$row['user_id']][$row['employee_id']]['user_comment']=$row['user_comment'];
		}
		
		

		$combo_ranking=db::select('ranking', 'ranking_id, ranking_val');
		
		$result="<table class='tbl' id='tbl_filter_applicant'>";
		$result.="<thead><tr><th>User Id</th><th>First Name</th><th>Last Name</th><th></th><th>Ranking</th><th>Comment</th><th></th></thead></tr><tbody>";
		foreach ($res as $row) {

			$row['ranking_id']='';
			$row['user_comment']='';
			$eval='';
			if (isset($ranking[$row['user_id']])) {
				if (isset($ranking[$row['user_id']][$_SESSION['uid']])) {
					$row['ranking_id']=$ranking[$row['user_id']][$_SESSION['uid']]['ranking_id'];
					$row['user_comment']=$ranking[$row['user_id']][$_SESSION['uid']]['user_comment'];
				}
				foreach ($ranking[$row['user_id']] as $key=>$val) {	
					uasort($ranking[$row['user_id']], 'cmp');
				}
				$eval="<table class='tbl_inside'><thead><tr><th></th><th>User Name</th><th>Ranking</th><th>Comment</th></tr><tbody>";
				foreach ($ranking[$row['user_id']] as $key=>$val) {
					if ($val['employee_id']==$_SESSION['uid']) continue;
					
					$eval.="<tr><td></td><td>".$val['name']."</td><td>".$val['ranking_val']."</td><td>".$val['user_comment']."</td></tr>";
				}
				$eval.="</body></table>";
			}
			$btn=array('save');
			if ($_SESSION['role_name']=='employee') {
				
			} else if ($type!='shortlist' && $row['vacancy_shortlist']==0) {
				array_push($btn, 'interview');
				array_push($btn, 'reject');
			} else {
				if ($row['vacancy_shortlist']==1) {
					array_push($btn, 'delete');
				} else {
					array_push($btn, 'restart');
				}
			}
			
			$result.="<tr><td>".$row['user_id']."</td><td>".$row['first_name']."</td><td>".$row['last_name']."</td>
			<td>".getImageTags(array('detail'))."</td>
			<td>".get_combo_ranking($combo_ranking, $row['ranking_id'])."</td>
			<td><textarea id='user_comment' class='user_comment'>".$row['user_comment']."</textarea></td>
			<td>".getImageTags($btn)."</td></tr>";
			if ($eval!='') {
				$result.="<tr><td></td><td colspan='9'>".$eval."</td></tr>";
			}
		}
		$result.="</tbody></table>";
	}
	if ($type=='shortlist' && count($res)>0) {
		$row=db::select_one('vacancy_progress','vacancy_progress_val, process_name','vacancy_progress_id=?','',array($next_vacancy_progress_id), $con);
		if ($row['vacancy_progress_val']=='Closing') {
			$result.="<button class='button_link' id='closing'>".$row['process_name']."</button>";
		} else {
			$result.="<button class='button_link' id='interview_all'>".$row['process_name']."</button>";
		}
		
	}
	return $result;
}

function cmp($a, $b) {
	
	return strcmp($a['name'], $b['name']);
}
function get_combo_ranking($res, $selected) {
	$combo_ranking="<select id='ranking_id' title='Rank'><option value=''> - Rank -</option>";
	foreach ($res as $row) {
		$combo_ranking.="<option value='".$row['ranking_id']."' ".($selected==$row['ranking_id'] ? 'selected' : '').">".$row['ranking_val']."</option>";
	}
	$combo_ranking.="</select>";
	return $combo_ranking;
}

while (true) { 
	if ($type=='search') {
		$filter='';

		$res_ranking=db::select('ranking','ranking_id, ranking_val','','ranking_id');
		
		
		$con=db::beginTrans();
		if ($filter_rejected=='true') {
			$sql="create temporary table filter select distinct a.user_id, ? vacancy_id, ? vacancy_progress_id
			, a.vacancy_shortlist from job_applied a 
			left join job_applied b on a.user_id=b.user_id and b.vacancy_id=? and b.vacancy_shortlist!=-1
			where b.job_applied_id is null and a.vacancy_shortlist=-1";
			db::ExecMe($sql, array($vacancy_id, $next_vacancy_progress_id,$vacancy_id), $con);
		} else if ($_SESSION['role_name']=='employee') {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else 0 end vacancy_shortlist from job_applied a
			left join vacancy_employee  b on a.vacancy_id=b.vacancy_id and b.vacancy_progress_id=?
			where ifnull(a.vacancy_progress_id,'')=? and ?!='' and a.vacancy_id=? and b.employee_id=? and a.vacancy_shortlist!=-1";
			
			db::ExecMe($sql, array($next_vacancy_progress_id, $next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $next_vacancy_progress_id, $vacancy_id, $_SESSION['uid']), $con);
		} else {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else 0 end vacancy_shortlist from job_applied a
			where ifnull(a.vacancy_progress_id,'')=? and ?!='' and a.vacancy_id=? and a.vacancy_shortlist!=-1";
			db::ExecMe($sql, array($next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $next_vacancy_progress_id, $vacancy_id), $con);
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
		foreach ($filter_answer as $filter) {
			foreach ($filter as $key=>$val) {
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
		
		$result=get_table_string($con, $tbl, $type, $next_vacancy_progress_id);
		
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
		
		$vacancy_employee_id=db::select_single('vacancy_employee','vacancy_employee_id v', 'vacancy_id=? and employee_id=? and vacancy_progress_id=?','' , array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id));
		if ($_SESSION['role_name']=='admin' and !isset($vacancy_employee_id)) {
			$vacancy_employee_id=db::insert('vacancy_employee', 'vacancy_id, employee_id, vacancy_progress_id', array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id));
		}
		if (db::select_with_count('user_ranking','vacancy_employee_id=? and  user_id=?', array($vacancy_employee_id, $user_id))==0) {
			db::insert('user_ranking', 'vacancy_employee_id, user_id, ranking_id, user_comment', array($vacancy_employee_id, $user_id, $ranking_id, $user_comment));
		} else {
			db::update('user_ranking','ranking_id, user_comment','vacancy_employee_id=? and  user_id=?', array($ranking_id, $user_comment, $vacancy_employee_id, $user_id));
		}
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
		$tbl='filter';
		$sql="create temporary table filter select a.user_id, a.vacancy_id, a.next_vacancy_progress_id vacancy_progress_id, a.vacancy_shortlist from job_applied a
where a.vacancy_id=? and ifnull(a.next_vacancy_progress_id,'')=? and a.vacancy_shortlist=1";
		db::ExecMe($sql, array($vacancy_id, $next_vacancy_progress_id), $con);
		$result=get_table_string($con, $tbl, $type, $next_vacancy_progress_id);
		db::commitTrans($con);
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
			$err=substr($err,2)." have not some rank some users on the shortlist!";
			die($err);
		}
	
		$con=db::beginTrans();
		db::ExecMe('update job_applied set vacancy_progress_id=next_vacancy_progress_id, vacancy_shortlist=0, next_vacancy_progress_id=null 
where vacancy_id=? and next_vacancy_progress_id=?', array($vacancy_id, $next_vacancy_progress_id), $con);
		db::ExecMe('update vacancy set vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id), $con);
		db::delete('vacancy_timeline','vacancy_id=? and vacancy_progress_id=?',array($vacancy_id, $next_vacancy_progress_id), $con);
		db::insert('vacancy_timeline','vacancy_id, vacancy_progress_id',array($vacancy_id, $next_vacancy_progress_id), $con);
		db::commitTrans($con);
		die;
	}
	if ($type=='show_detail') {
		$result="";
		$res=db::DoQuery("select a.* from applicants_answer a
left join job_applied b on a.job_applied_id=b.job_applied_id 
inner join vacancy_question c on c.question_id=a.question_id and c.vacancy_id=b.vacancy_id 
where b.vacancy_id=?", array($vacancy_id));
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
		$contract_history_id=db::select_single('contract_history', 'contract_history_id v','end_date>now() and user_id=?','start_date desc',array($user_id), $con);
		if ($contract_history_id) {
			db::update('contract_history','start_date, end_date, salary, job_title','contract_history_id=?', array($start_date, $end_date, $salary, $job_title, $contract_history_id), $con);
		} else {
			db::insert('contract_history','user_id, start_date, end_date, salary, job_title', array($user_id, $start_date, $end_date, $salary, $job_title), $con);
		}
		db::ExecMe('update job_applied set vacancy_shortlist=1, next_vacancy_progress_id=? where vacancy_id=? and user_id=?', array($next_vacancy_progress_id, $vacancy_id, $user_id), $con);		
		db::commitTrans($con);
		die;
		
	}
	if ($type=='closing') {
		$con=db::beginTrans();
		
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
