<?php
Class FilterApplicant {

static function get_call_interview_table($res, $vacancy_progress_val) {
	if ($vacancy_progress_val=='Shortlist') {
		//return (json_encode($res));
		$result="<table class='tbl' id='tbl_call_interview'><thead><tr><th>First Name</th><th>Last Name</th></tr></thead><tbody>";
		foreach ($res as $rs) {
			
			$result.="<tr><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td></tr>";
		}
		$result.="</table>";
	} else if ($vacancy_progress_val=='Closing') {
		$result="<table class='tbl' id='tbl_call_interview'><thead><tr><th>First Name</th><th>Last Name</th>
			<th>Job</th><th>Contract Duration</th><th>Salary</th>
			</tr></thead>";
		foreach ($res as $rs) {
			foreach ($rs as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td>
				<td><div class='label'>Job Title</div><div class='label2'>: $job_title</div><br>
				<div class='label'>Position</div><div class='label2'>: $position</div><br>
				<div class='label'>Project Name</div><div class='label2'>: $project_name</div><br>
				<div class='label'>Project Number</div><div class='label2'>: $project_number</div><br>
				<div class='label'>Project Location</div><div class='label2'>: $project_location</div><br>
				<div class='label'>Team Leader</div><div class='label2'>: $team_leader</div><br>
				<div class='label'>Principal Advisor</div><div class='label2'>: $principal_advisor</div><br>
				<div class='label'>Responsible Superior</div><div class='label2'>: $responsible_superior</div><br>
				<div class='label'>SAP No</div><div class='label2'>: $SAP_No</div></td>
				<td><div class='label'>From</div><div class='label2'>: ".formatDate($start_date)."</div><br>
				<div class='label'>To</div><div class='label2'>: ".formatDate($end_date)."</div></td>
				<td><div class='label'>Salary</div><div class='label2'>: ".formatNumber($salary)."</div><br>
				<div class='label'>Salary Band</div><div class='label2'>: $salary_band</div></td>
			</tr>";
		}
		$result.="</tbody></table>";
	} else {
		
		$result="<table class='tbl' id='tbl_call_interview'><thead><tr><th>First Name</th><th>Last Name</th><th>Interview Place</th><th>Interview Date</th></tr></thead>";
		foreach ($res as $rs) {
			foreach ($rs as $key=>$val) {
				$$key=$val;
			}
			
			$result.="<tr><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td>
				<td>$interview_place</td><td>".formatDate($interview_date)." / "."$interview_time</td>
			</tr>";
			$result.="<tr><td colspan='4'>
				<table class='tbl'>
					<thead><tr><th>User</th><th>Ranking</th><th>Comment</th></tr></thead>";
			foreach ($ranking as $rs2) {
				$result.="<td>".$rs2['first_name']." ".$rs2['last_name']."</td><td>".$rs2['ranking_val']."</td><td>".$rs2['user_comment']."</td></tr>";
			}
			$result.="</table>";
			$result.="</td></tr>";
		}
		$result.="</tbody></table>";
		
	}
	return $result;
}
static function get_table_string($con, $tbl, $type, $next_vacancy_progress_id='') {
	$vacancy_progress_val=shared::get_table_data('vacancy_progress', $next_vacancy_progress_id);
	if ($vacancy_progress_val=='Closing') {
		$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-', 'project_name');
		
		$sql="select salary_band from salary_band order by salary_band";
		$res=db::DoQuery($sql, array(), $con);
		$salary_band_option_def=shared::select_combo_complete($res, 'salary_band','-');
		
		$sql="select a.user_id, b.first_name, b.last_name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist
		, c.contract_history_id, c.start_date, c.end_date, c.salary, c.job_title
		, c.contract_status, c.salary_band, c.project_name, c.project_number, c.team_leader
		, c.principal_advisor, c.financial_controller, c.project_location, c.responsible_superior, c.SAP_No
		, c.position, ifnull(c.working_time,100) working_time from $tbl a
		left join applicants b on a.user_id=b.user_id
		left join contract_history c on a.user_id=c.user_id and c.start_date>curdate()";
		$res=db::DoQuery($sql, array(), $con);
		
		$result="<table class='tbl' id='tbl_result'><thead><tr><th>Contract History Id</th><th>User Id</th><th>Name</th><th>Job</th><th>Contract Duration/Salary</th>
		<th></th></tr></thead><tbody>";
		foreach ($res as $row) {
			$row['salary']=shared::decrypt($row['salary']);
			$res_salary_sharing=db::select('salary_sharing','*','contract_history_id=?','',array($row['contract_history_id']));
			$btn=array();
			if ($_SESSION['role_name']=='employee') {
				
			} else if ($type!='shortlist' && $row['vacancy_shortlist']==0) {
				array_push($btn, 'accept');
				array_push($btn, 'reject');
			} else {
				if ($row['vacancy_shortlist']==1) {
					array_push($btn, 'accept');
					array_push($btn, 'delete');
				} else {
					array_push($btn, 'restart');
				}
			}
			$salary_band_option=shared::set_selected($row['salary_band'], $salary_band_option_def);
			
			$project_name_option=shared::set_selected($row['project_name'], $combo_project_name_def);
			$principal_advisor=$row['principal_advisor'];
			$financial_controller=$row['financial_controller'];
			
			$project_number=Project::getProjectNumberByProjectName($row['project_name']);
			
			$combo_project_number_def=shared::select_combo_complete($project_number, 'project_number', '-Project Number-', 'project_number','','110px');
			
			$project_number_option=shared::set_selected($row['project_number'], $combo_project_number_def);
			$team_leader=$row['team_leader'];
			$result.="<tr><td>".$row['contract_history_id']."</td><td>".$row['user_id']."</td><td style='vertical-align:top'>".$row['first_name']." ".$row['last_name']."</td>";
			$result.="
			<td style='vertical-align:top'>"._t2("job_title", $row['job_title'],'40')."<br/>
				"._t2("position", $row['position'],'40')."<br/>
				".$project_name_option."<span class='principal_advisor hidden'>".$principal_advisor."</span>
				<span class='principal_advisor_name'>"._name($principal_advisor)."</span>
				 <span class='financial_controller hidden'>".$financial_controller."</span>
				<span class='financial_controller_name'>"._name($financial_controller)."</span>
				<br/>
				".$project_number_option." <span class='team_leader hidden'>".$team_leader."</span>
				<span class='team_leader_name'>"._name($team_leader)."</span>
				<br/>
				"._t2("project_location", $row['project_location'],'40')."<br/>
				"._t2("responsible_superior", $row['responsible_superior'],'20')." "._t2("SAP_No", $row['SAP_No'],'20')."<br/>
			</td>";
			$result.="<td>Contract Duration:<br><input type='text' id='start_date".$row['user_id']."' title='Start Date' class='start_date' placeholder='Start Date' size='10' value='".formatDate($row['start_date'])."'/> 
			<input type='text' id='end_date".$row['user_id']."' title='End Date'  class='end_date' placeholder='End Date' size='10' value='".formatDate($row['end_date'])."'/><br><br>
			<div class='row'><div class='label'>Salary</div>"._t2("salary", formatNumber($row['salary']))."</div>
			<div class='row'><div class='label'>Salary Band</div>".$salary_band_option."</div>
			<div class='row'><div class='label'>Working Time</div><div class='textbox'>"._t2("working_time", $row['working_time'], "1","text","","")." %</div></div>";
			$result.=Employee::getSalarySharingView($row, $combo_project_name_def);
			$result.="</td>";
			$result.="<td>".getImageTags($btn)."</td>";
			$result.="</tr>";
		}
		$result.="</tbody></table>";
	
	} else {
		$sql="select a.user_id, b.first_name, b.last_name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist, c.interview_place
	,c.interview_date, c.interview_time from $tbl a
	left join applicants b on a.user_id=b.user_id
	left join vacancy_interview c on c.vacancy_id=a.vacancy_id and c.user_id=a.user_id and c.vacancy_progress_id=a.vacancy_progress_id";
		$res=db::DoQuery($sql, array(), $con);
		
		$sql="drop table if exists temp_rank";
		db::ExecMe($sql, array(), $con);
		$sql="create temporary table temp_rank
	select b.vacancy_employee_id, b.employee_id, a.user_id, a.ranking_id, a.user_comment, concat(d.first_name,' ', d.last_name) as name, e.ranking_val
	from user_ranking a
	left join vacancy_employee b on a.vacancy_employee_id=b.vacancy_employee_id 
	inner join $tbl c on c.user_id=a.user_id and c.vacancy_id=b.vacancy_id and c.vacancy_progress_id=b.vacancy_progress_id
	left join applicants d on d.user_id=b.employee_id
	left join ranking e on e.ranking_id=a.ranking_id
	where a.ranking_id is not null";
		db::ExecMe($sql, array(), $con);
		/*
		$sql="create temporary table temp_rank2
	select b.vacancy_employee_id, b.employee_id, a.user_id, a.ranking_id, a.user_comment, concat(d.first_name,' ', d.last_name) as name, e.ranking_val
	from user_ranking a
	left join vacancy_employee b on a.vacancy_employee_id=b.vacancy_employee_id 
	inner join $tbl c on c.user_id=a.user_id and c.vacancy_id=b.vacancy_id
	left join applicants d on d.user_id=b.employee_id
	left join ranking e on e.ranking_id=a.ranking_id
	inner join vacancy f on f.vacancy_id=b.vacancy_id and f.vacancy_progress_id=b.vacancy_progress_id 
	left join temp_rank g on g.vacancy_employee_id=b.vacancy_employee_id and a.user_id=g.user_id";
		db::ExecMe($sql, array(), $con);

		$res_ranking=db::DoQuery("select * from temp_rank2 union all select * from temp_rank", array(), $con);
*/		
		$res_ranking=db::DoQuery("select * from temp_rank", array(), $con);
		$ranking=array();
		foreach ($res_ranking as $row) {
			$ranking[$row['user_id']][$row['employee_id']]['employee_id']=$row['employee_id'];
			$ranking[$row['user_id']][$row['employee_id']]['name']=$row['name'];
			$ranking[$row['user_id']][$row['employee_id']]['ranking_id']=$row['ranking_id'];
			$ranking[$row['user_id']][$row['employee_id']]['ranking_val']=$row['ranking_val'];
			$ranking[$row['user_id']][$row['employee_id']]['user_comment']=$row['user_comment'];
		}
		
		

		$combo_ranking=db::select('ranking', 'ranking_id, ranking_val');
		$combo_location=shared::select_combo_complete(db::select('location','*'), 'location_code', '- Location -');
			
		$result="<table class='tbl' id='tbl_filter_applicant'>";
		$result.="<thead><tr><th>User Id</th><th>First Name</th><th>Last Name</th><th></th><th>Ranking</th><th>Comment</th>";
		$result.="<th>Location</th><th>Interview Date</th><th>Time</th>";
		$result.="<th></th></thead></tr><tbody>";
		foreach ($res as $row) {
			$row['ranking_id']='';
			$row['user_comment']='';
			$eval='';
			if (isset($ranking[$row['user_id']])) {
				if (isset($ranking[$row['user_id']][$_SESSION['uid']])) {
					$row['ranking_id']=$ranking[$row['user_id']][$_SESSION['uid']]['ranking_id'];
					$row['user_comment']=$ranking[$row['user_id']][$_SESSION['uid']]['user_comment'];
				}
				
				uasort($ranking[$row['user_id']], 'cmp');
				
				$eval="<table class='tbl_inside'><thead><tr><th>User Name</th><th>Ranking</th><th>Comment</th></tr><tbody>";
				foreach ($ranking[$row['user_id']] as $key=>$val) {
					if ($val['employee_id']==$_SESSION['uid']) continue;					
					$eval.="<tr><td>".$val['name']."</td><td>".$val['ranking_val']."</td><td>".$val['user_comment']."</td></tr>";
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
			<td>".FilterApplicant::get_combo_ranking($combo_ranking, $row['ranking_id'])."</td>
			<td><textarea id='user_comment' class='user_comment'>".$row['user_comment']."</textarea></td>";
			$result.="<td>".shared::set_selected($row['interview_place'], $combo_location)."</td>
					<td>"._t2("interview_date".$row['user_id'], formatDate($row['interview_date']), 10, 'text', 'interview_date')."</td>
					<td>"._t2("interview_time", $row['interview_time'],3,'','','Time')."</td>";
			$result.="<td>".getImageTags($btn)."</td></tr>";
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
			$result.="<div id='div_shortlist'>";
			$result.="<button class='button_link' id='interview_all'>".$row['process_name']."</button>";
			$result.="</div>";
		}
		
		
	}
	return $result;
}
static function get_combo_ranking($res, $selected) {
	$combo_ranking="<select id='ranking_id' title='Rank'><option value=''> - Rank -</option>";
	foreach ($res as $row) {
		$combo_ranking.="<option value='".$row['ranking_id']."' ".($selected==$row['ranking_id'] ? 'selected' : '').">".$row['ranking_val']."</option>";
	}
	$combo_ranking.="</select>";
	return $combo_ranking;
}

}
?>