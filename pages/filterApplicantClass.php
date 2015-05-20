<?php
Class FilterApplicant {


static function get_call_interview_table($res, $vacancy_progress_val, $resRejected,  $resUnknown) {
	$result="";
	if ($vacancy_progress_val=='Shortlist') {
		//return (json_encode($res));
		//shared::setId('call_interview_table', $id_real, &$res)
		$result="<table class='tbl' id='tbl_call_interview'><thead><tr><th>Id</th><th>First Name</th><th>Last Name</th><th></th></tr></thead><tbody>";
		foreach ($res as $key=>$rs) {
			$new_key=shared::random(12);
			$_SESSION['call_interview_table'][$new_key]=$key;
			$result.="<tr><td>".$new_key."</td><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td><td>".getImageTags(['cancel'])."</td></tr>";
		}
		$result.="</table>";
	} else if ($vacancy_progress_val=='Closing') {
		$result.="<h1>Accept</h1>";
		$result.="<table class='tbl' id='tbl_call_interview'><thead><tr><th></th><th>Name</th>
			<th>Job Title</th><th>Project Name</th><th>Project Number</th><th>Project Location</th>
			<th>Responsible Superior</th><th>Salary</th><th>Duration</th><th></th>
			</tr></thead>";
		foreach ($res as $job_applied_id=>$rs) {
			$new_key=shared::random(12);
			$_SESSION['call_interview_table'][$new_key]=$job_applied_id;
			foreach ($rs as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$new_key</td><td valign='top'>".$rs['name']."</td><td><u><b>Job Title</b></u><br>$job_title<br>
			<u><b>Position</b></u><br>$job_position
			</td>";
			$result.="<td>
			<u><b>Project Name</b></u><br>$project_name
			<br><u><b>Principal Advisor</b></u><br>"._name($principal_advisor)."
			<br><u><b>Financial Controller</b></u><br>"._name($financial_controller)."
			</td>";
			$result.="<td>
			<u><b>Project Number</b></u><br>$project_number
			<br><u><b>Team Leader</b></u><br>"._name($team_leader)."
			</td>";
			$result.="<td>
			<u><b>Project Location</b></u><br>$project_location
			<br><u><b>Office Manager</b></u><br>"._name($office_manager)."
			</td>";
			$result.="<td>
			<u><b>Responsible Superior</b></u><br>"._name($responsible_superior)."
			<br><u><b>SAP No</b></u><br>$SAP_No
			</td>";
			$result.="<td>
			<u><b>Salary</b></u><br>".formatNumber($salary)."
			<br><u><b>Salary Band</b></u><br>$salary_band
			<br><u><b>Working Time</b></u><br>$working_time %
			</td>";
			$result.="<td>
			<u><b>Start Date</b></u><br>".formatDate($contract1_start_date)."
			<br><u><b>End Date</b></u><br>".formatDate($contract1_end_date)."
			</td>";
			$result.="<td>".getImageTags(['cancel'])."</td>";
			$result.="</tr>";

		}
		$result.="</tbody></table>";
	} else {
		$result.="<h1>Interview</h1>";
		$result.="<table class='tbl' id='tbl_call_interview'><thead><tr><th></th><th>First Name</th><th>Last Name</th><th>Interview Place</th><th>Interview Date</th><th></th></tr></thead>";
		
		foreach ($res as $job_applied_id=>$rs) {
			foreach ($rs as $key=>$val) {
				$$key=$val;
			}
			$new_key=shared::random(12);
			$_SESSION['call_interview_table'][$new_key]=$job_applied_id;
			$result.="<tr><td>$new_key</td><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td>
				<td>$interview_place</td><td>".formatDate($interview_date)." / "."$interview_time</td><td>".getImageTags(['cancel'])."</td>
			</tr>";
			
			if (isset($ranking)) {
				$result.="<tr><td></td><td colspan='5'>
					<table class='tbl'>
						<thead><tr><th>User</th><th>Ranking</th><th>Comment</th></tr></thead>";
				
				foreach ($ranking as $rs2) {
					$result.="<td>".$rs2['first_name']." ".$rs2['last_name']."</td><td>".$rs2['ranking_val']."</td><td>".$rs2['user_comment']."</td></tr>";
				}
				$result.="</table>";
				$result.="</td></tr>";
			}
		}
		$result.="</tbody></table>";	
	}
	if (count($resRejected)>0) {
		$result.="<h1>Rejected</h1>";
		$result.="<table class='tbl' id='tbl_rejected'><thead><tr><th>First Name</th><th>Last Name</th><th>Progress</th></tr></thead><tbody>";
		foreach ($resRejected as $rs) {
			$result.="<tr><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td><td>".shared::get_table_data("vacancy_progress", $rs['vacancy_progress_id'])."</td></tr>";
		}
		$result.="</tbody></table>";
	}
	if (count($resUnknown)>0) {
		$result.="<h1>Unknown</h1>";
		$result.="<table class='tbl' id='tbl_rejected'><thead><tr><th>First Name</th><th>Last Name</th><th>Progress</th></tr></thead><tbody>";
		foreach ($resUnknown as $rs) {
			$result.="<tr><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td><td>".shared::get_table_data("vacancy_progress", $rs['vacancy_progress_id'])."</td></tr>";
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
		$job_title_def=shared::select_combo_complete(db::select('job_title','*','','sort_id'), 'job_title','-Job Title-','job_title');
		$position_def=shared::select_combo_complete(db::select('job_position','*','','sort_id'), 'job_position','-Position-','job_position');
		$sql="select a.user_id, b.first_name, b.last_name, a.vacancy_id, a.vacancy_progress_id, a.vacancy_shortlist
		, b.contract1_start_date, b.contract1_end_date, b.job_title, b.job_position
		, b.salary_band, b.salary
		, b.project_name, b.principal_advisor, b.financial_controller
		, b.project_number, b.team_leader
		, b.project_location, b.office_manager
		, b.responsible_superior, b.SAP_No
		, ifnull(b.working_time,100) working_time from $tbl a
		left join applicants b on a.user_id=b.user_id";
		$res=db::DoQuery($sql, array(), $con);
		

		
		$result="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>Name</th><th>Job</th><th>Contract Duration/Salary</th>
		<th></th></tr></thead><tbody>";
		foreach ($res as $row) {
			$responsible_superior_option=Employee::getResponsibleSuperiorCombo($row);
			$job_title_option=shared::set_selected($row['job_title'], $job_title_def);
			$position_option=shared::set_selected($row['job_position'], $position_def);
			$row['salary']=shared::decrypt($row['salary']);
			$res_salary_sharing=db::select('applicants_salary_sharing','*','user_id=?','',array($row['user_id']));
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
			
			$project_location=db::select('project_location','*','','project_location');
			$combo_project_location_def=shared::select_combo_complete($project_location, 'project_location', '-Project Location-', 'project_location','','110px');
			$project_location_option=shared::set_selected($row['project_location'], $combo_project_location_def);
			
			$team_leader=$row['team_leader'];
			$office_manager=$row['office_manager'];
			$result.="<tr><td>".$row['user_id']."</td><td style='vertical-align:top'>".$row['first_name']." ".$row['last_name']."</td>";
			$result.="
			<td style='vertical-align:top'>
				<div class='div_project'>
				<div class='row'><div class='label120'>Job Title</div><div class='float200'>".$job_title_option."</div></div>
				<div class='row'><div class='label120'>Position</div><div class='float200'>".$position_option."</div></div>
				<div class='row'><div class='label120'>Project Name</div><div class='float200'>".$project_name_option."</div></div>
				<span class='principal_advisor hidden'>".$principal_advisor."</span>
				<div class='row'><div class='label120'>Principal Advisor</div><div class='label120'><span class='principal_advisor_name'>"._name($principal_advisor)."</span></div></div>
				 <span class='financial_controller hidden'>".$financial_controller."</span>
				<div class='row'><div class='label120'>Financial Controller</div><div><span class='financial_controller_name'>"._name($financial_controller)."</span></div></div>
				<div class='row'><div class='label120'>Project Number</div><div class='float200'>".$project_number_option."</div><span class='team_leader hidden'>".$team_leader."</span></div>
				<div class='row'><div class='label120'>Team Leader</div><div class='label120'><span class='team_leader_name'>"._name($team_leader)."</span></div></div>
				<div class='row'><div class='label120'>Project Location</div><div class='float200'>".$project_location_option."<span class='office_manager hidden'>".$office_manager."</span></div></div>
				<div class='row'><div class='label120'>Office Manager</div><div class='label120'><span class='office_manager_name'>"._name($office_manager)."</span></div></div>
				<div class='row'><div class='label120'>Responsible Superior</div><div class='float200'>".$responsible_superior_option."</div></div>
				<div class='row'><div class='label120'>SAP No</div><div class='float200'>"._t2("SAP_No", $row['SAP_No'],'20')."</div></div>
				</div>
			</td>";
			$result.="<td>Contract Duration:<br><input type='text' id='contract1_start_date".$row['user_id']."' title='Start Date' class='contract1_start_date' placeholder='Start Date' size='10' value='".formatDate($row['contract1_start_date'])."'/> 
			<input type='text' id='contract1_end_date".$row['user_id']."' title='End Date'  class='contract1_end_date' placeholder='End Date' size='10' value='".formatDate($row['contract1_end_date'])."'/><br><br>
			<div class='row'><div class='label'>Salary</div>"._t2("salary", formatNumber($row['salary']))."</div>
			<div class='row'><div class='label'>Salary Band</div>".$salary_band_option."</div>
			<div class='row'><div class='label'>Working Time</div><div class='textbox'>"._t2("working_time", $row['working_time'], "1","text","","")." %</div></div>";
			$result.=Employee::getApplicantsSalarySharingView($row, $combo_project_name_def);
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
	left join employee d on d.user_id=b.employee_id
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