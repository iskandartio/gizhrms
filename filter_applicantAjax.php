<?php
	require_once("pages/startup.php");
function get_table_string($con, $tbl, $type, $next_vacancy_progress_id='') {
	$sql="select a.user_id, c.business_val from $tbl a
inner join applicants_working b on a.user_id=b.user_id
left join business c on c.business_id=b.business_id";
	$res_business=db::DoQuery($sql, array(), $con);
	foreach ($res_business as $row) {
		if (!isset($business[$row['user_id']])) $business[$row['user_id']]='';
		$business[$row['user_id']].=$row['business_val']."<br/>";
	}
	
	$sql="select a.user_id, b.first_name, b.last_name, c.city_val, b.computer_skills, b.professional_skills, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist from $tbl a
inner join applicants b on a.user_id=b.user_id
left join city c on c.city_id=b.city";
	$res=db::DoQuery($sql, array(), $con);
	
	$sql="select b.employee_id, a.user_id, a.ranking_id, a.user_comment, concat(d.first_name,' ', d.last_name) as name, e.ranking_val from user_ranking a
left join vacancy_employee b on a.vacancy_employee_id=b.vacancy_employee_id 
inner join filter c on c.user_id=a.user_id and c.vacancy_id=b.vacancy_id and c.vacancy_progress_id=b.vacancy_progress_id
left join applicants d on d.user_id=b.employee_id
left join ranking e on e.ranking_id=a.ranking_id";
	$res_ranking=db::DoQuery($sql, array(), $con);
	$ranking=array();
	foreach ($res_ranking as $row) {
		$ranking[$row['user_id']][$row['employee_id']]['name']=$row['name'];
		$ranking[$row['user_id']][$row['employee_id']]['ranking_id']=$row['ranking_id'];
		$ranking[$row['user_id']][$row['employee_id']]['ranking_val']=$row['ranking_val'];
		$ranking[$row['user_id']][$row['employee_id']]['user_comment']=$row['user_comment'];
	}
	
	

	$combo_ranking=db::select('ranking', 'ranking_id, ranking_val');
	
	$result="<table class='tbl' id='tbl_filter_applicant'>";
	$result.="<thead><tr><th>User Id</th><th>First Name</th><th>Last Name</th><th>City</th><th>Business</th><th>Computer Skills</th><th>Professional Skills</th>
	<th>Ranking</th><th>Evaluation</th><th></th></thead></tr><tbody>";
	foreach ($res as $row) {
		$row['business_val']='';
		if (isset($business[$row['user_id']])) {
			$row['business_val']=$business[$row['user_id']];
		}
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
			$eval="<table class='tbl_inside'><thead><tr><th></th><th>User Name</th><th>Ranking</th><th>Evaluation</th></tr><tbody>";
			foreach ($ranking[$row['user_id']] as $key=>$val) {
				$eval.="<tr><td></td><td>".$val['name']."</td><td>".$val['ranking_val']."</td><td>".$val['user_comment']."</td></tr>";
			}
			$eval.="</body></table>";
		}
		
		
		

		
		$result.="<tr><td>".$row['user_id']."</td><td>".$row['first_name']."</td><td>".$row['last_name']."</td><td>".$row['city_val']."</td><td>".$row['business_val']."</td>
		<td>".$row['computer_skills']."</td><td>".$row['professional_skills']."</td><td>".get_combo_ranking($combo_ranking, $row['ranking_id'])."</td>
		<td><textarea id='user_comment' class='user_comment'>".$row['user_comment']."</textarea></td>
		<td>".getImageTags(array('save', ($type!='shortlist' && !$row['vacancy_shortlist'] ? 'interview' : 'delete')))."</td>";
		
		$result.="</tr>";
		if ($eval!='') {
			$result.="<tr><td></td><td colspan='9'>".$eval."</td></tr>";
		}
	}
	$result.="</tbody></table>";
	if ($type=='shortlist' && count($res)>0) {
		$status_val=db::select_single('vacancy_progress','status_val v','vacancy_progress_id=?','',array($next_vacancy_progress_id), $con);
		if ($status_val=='Closing') {
			$result.="<button class='button_link' id='closing'>Accept Applicant</button>";
		} else {
			$result.="<button class='button_link' id='interview_all'>Interview All</button>";
		}
		
	}
	return $result;
}
function cmp($a, $b) {
	
	return strcmp($a['name'], $b['name']);
}
function get_combo_ranking($res, $selected) {
	$combo_ranking="<select id='ranking_id'><option value=''> - Rank -</option>";
	foreach ($res as $row) {
		$combo_ranking.="<option value='".$row['ranking_id']."' ".($selected==$row['ranking_id'] ? 'selected' : '').">".$row['ranking_val']."</option>";
	}
	$combo_ranking.="</select>";
	return $combo_ranking;
}
	if ($type=='search') {
		$filter='';

		$res_ranking=db::select('ranking','ranking_id, ranking_val','','ranking_id');
		
		
		$con=db::beginTrans();
		if ($_SESSION['role_name']=='employee') {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else null end vacancy_shortlist from job_applied a
			left join vacancy_employee  b on a.vacancy_id=b.vacancy_id and b.vacancy_progress_id=?
			where ifnull(a.vacancy_progress_id,0)=? and a.vacancy_id=? and b.employee_id=?";
			
			db::ExecMe($sql, array($next_vacancy_progress_id, $next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $vacancy_id, $_SESSION['uid']), $con);
		} else {
			$sql="create temporary table filter select a.user_id, a.vacancy_id, ? vacancy_progress_id
			, case when a.next_vacancy_progress_id=? then a.vacancy_shortlist else null end vacancy_shortlist from job_applied a
			where ifnull(a.vacancy_progress_id,0)=? and a.vacancy_id=?";
			
			db::ExecMe($sql, array($next_vacancy_progress_id, $next_vacancy_progress_id, $vacancy_progress_id, $vacancy_id), $con);
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
		if ($filter!='') {
			$sql="create temporary table $tbl"."2 select a.user_id, a.vacancy_id, a.vacancy_progress_id, vacancy_shortlist from filter a
			inner join applicants b on a.user_id=b.user_id
			left join city c on b.city=c.city_id
			where 1=1".$filter;
			$tbl='filter2';
			db::ExecMe($sql, $params, $con);
			unset($params);
			$params=array();
		}
		if ($filter_business!='') {
			db::ExecMe('drop table if exists filter');
			$sql="create temporary table filter select a.user_id, a.vacancy_id, a.vacancy_progress, vacancy_shortlist from $tbl a
			inner join applicants_working b on a.user_id=b.user_id
			where b.business_id=?";
			array_push($params, $filter_business);
			db::ExecMe($sql, $params, $con);
			$tbl="filter";
			unset($params);
			$params=array();
		}
		$result=get_table_string($con, $tbl, $type);

		db::commitTrans($con);
		die($result);
		
	}
	if ($type=='save') {
		$vacancy_employee_id=db::select_single('vacancy_employee','vacancy_employee_id v', 'vacancy_id=? and employee_id=? and vacancy_progress_id=?',''
		, array($vacancy_id, $_SESSION['uid'], $next_vacancy_progress_id));
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
		db::ExecMe('update job_applied set vacancy_shortlist=false, next_vacancy_progress_id=null where vacancy_id=? and user_id=?', array($vacancy_id, $user_id));
		die;
	}
	if ($type=='get_user') {
		$res_users=db::DoQuery("select a.user_id, a.first_name, a.last_name from applicants a
left join  m_user_role b on a.user_id=b.user_id 
left join m_role c on c.role_id=b.role_id 
where role_name='employee' order by a.first_name, a.last_name");
		
		$sql="select a.vacancy_employee_id, a.vacancy_id, a.employee_id, concat(b.first_name,' ',b.last_name) as name from vacancy_employee a
left join applicants b on a.employee_id=b.user_id
where a.vacancy_id=? and a.vacancy_progress_id=?";
		$res=db::DoQuery($sql, array($vacancy_id, $vacancy_progress_id));
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
		db::ExecMe('update job_applied set vacancy_shortlist=true, next_vacancy_progress_id=? where vacancy_id=? and user_id=?', array($next_vacancy_progress_id, $vacancy_id, $user_id));
		die;
	}
	if ($type=='shortlist') {
		
		$con=db::beginTrans();
		$tbl='filter';
		$sql="create temporary table filter select a.user_id, a.vacancy_id, a.next_vacancy_progress_id vacancy_progress_id, a.vacancy_shortlist from job_applied a
where a.vacancy_id=? and ifnull(a.next_vacancy_progress_id,'')=? and a.vacancy_shortlist=true";
		db::ExecMe($sql, array($vacancy_id, $next_vacancy_progress_id), $con);
		$result=get_table_string($con, $tbl, $type, $next_vacancy_progress_id);
		db::commitTrans($con);
		die($result);
	}
	if ($type=='interviewall') {
		$con=db::beginTrans();
		db::ExecMe('update job_applied set vacancy_progress_id=next_vacancy_progress_id, vacancy_shortlist=null, next_vacancy_progress_id=null 
where vacancy_id=? and next_vacancy_progress_id=?', array($vacancy_id, $next_vacancy_progress_id), $con);
		db::ExecMe('update vacancy set vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id), $con);
		db::commitTrans($con);
		die;
	}
	if ($type=='closing') {
		$con=db::beginTrans();
		
		db::ExecMe('update m_user_role a inner join job_applied b on a.user_id=b.user_id set role_id=3
where vacancy_id=? and next_vacancy_progress_id=?', array($vacancy_id, $next_vacancy_progress_id), $con);
		db::ExecMe('update job_applied set vacancy_progress_id=next_vacancy_progress_id, vacancy_shortlist=null, next_vacancy_progress_id=null 
where vacancy_id=? and next_vacancy_progress_id=?', array($vacancy_id, $next_vacancy_progress_id), $con);
		db::ExecMe('update vacancy set vacancy_progress_id=? where vacancy_id=?', array($next_vacancy_progress_id, $vacancy_id), $con);
		
		db::commitTrans($con);
		die;
	}
?>
