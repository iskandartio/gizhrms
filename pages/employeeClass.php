<?php
class employee {
	static function get_choice($question_id, $choice_id) {
		$res=db::select('choice','choice_id, choice_val', 'question_id=?', 'sort_id', array($question_id));
		$r="<select id='choice".$question_id."' class='cls_choice' title='Choose Your Answer'><option value=0> - Choose Your Answer  - </option>";
		foreach ($res as $row) {
			$r.="<option value=".$row['choice_id']." ".($choice_id==$row['choice_id'] ? 'selected' : '').">".$row['choice_val']."</option>";
		}
		$r.="</select>";
		return $r;
	}
	static function get_salary_history_tbl($salary_history) {
		if ($salary_history=='') return;
		$result="";
		foreach ($salary_history as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr>
			<td>$contract_history_id</td>
			<td>
			<table class='top'>
			<tr><td><b>Start Date</b></td><td>:</td><td>".formatDate($start_date)."</td></tr>
			<tr><td><b>End Date</b></td><td>:</td><td>".formatDate($end_date)."</td></tr>
			
			</table>
			</td>
			<td>
			<table class='top'>
			<tr><td><b>Project Name</b></td><td>:</td><td>$project_name</td></tr>
			<tr><td><b>Project Number</b></td><td>:</td><td>$project_number</td></tr>
			<tr><td><b>Project Location</b></td><td>:</td><td>$project_location</td></tr>
			</table>
			</td>
			<td>
			<table class='top'>
			<tr><td><b>Principal Advisor</b></td><td>:</td><td>$principal_advisor</td></tr>
			<tr><td><b>Team Leader</b></td><td>:</td><td>$team_leader</td></tr>
			<tr><td><b>Responsible Superior</b></td><td>:</td><td>$responsible_superior</td></tr>
			<tr><td><b>SAP No</b></td><td>:</td><td>$SAP_No</td></tr>
			</table>
			</td>
			<td width='200px'>
			<table class='top'>
			<tr><td><b>Position</b>:<br>$position</td></tr>
			<tr><td><b>Job Title</b>:<br>$job_title</td></tr>
			</table>
			</td>
			<td>
			<table class='top'>
			<tr><td><b>Salary</b></td><td>:</td><td>".formatNumber($salary)."</td></tr>
			<tr><td><b>Salary Band</b></td><td>:</td><td>$salary_band</td></tr>
			<tr><td><b>Reason</b></td><td>:</td><td>$reason</td></tr>
			
			</table>
			</td><td>".getImageTags(array("edit"))."</td>
			</tr>";
			
		}
		echo $result;
	}	
	static function get_graph($first, $first_end, $am1, $am1_end, $first_limit) {
		$d1=shared::dateDiff($first, $first_end);
		$i1=shared::dateDiff($first_end, $am1)-1;
		
		if ($am1==''||$am1_end==''){
			$d2=0;
			$am1_end=$first_end;
			
		} else {
			$d2=shared::dateDiff($am1, $am1_end);
		}
		
		$i2=shared::dateDiff($am1_end, $first_limit)-1;
		$result="<table style='border-collapse:collapse'><tr>";
		if ($d1>0) $result.="<td title='".formatDate($first)." to ".formatDate($first_end)."' style='height:30px;width:".($d1/2)."px;background-color:yellow'></td>";
		if ($i1>0) $result.="<td title='".formatDate($first)." to ".formatDate($first_end)."' style='height:30px;width:".($i1/2)."px;background-color:darkgrey'></td>";
		if ($d2>0) $result.="<td title='".formatDate($am1)." to ".formatDate($am1_end)."' style='height:30px;width:".($d2/2)."px;background-color:blue'></td>";
		if ($i2>0) $result.="<td title='".formatDate(shared::addDate($am1_end,1))." to ".formatDate($first_limit)."' style='height:30px;width:".($i2/2)."px;background-color:darkgrey'></td>";
		$result.="</tr></table>";
		return $result;
		
	}
	static function getApplicantData($edit_id) {
		$applicant=db::select_one('applicants a
left join contract_history b on a.user_id=b.user_id and now() between b.start_date and b.end_date
left join m_user c on c.user_id=a.user_id'
,'*, (datediff(contract1_end_date, contract1_start_date)+1)/365+ 
ifnull((datediff(am1_end_date, am1_start_date)+1)/365,0)+
ifnull((datediff(contract2_end_date, contract2_start_date)+1)/365,0)+
ifnull((datediff(am2_end_date, am2_start_date)+1)/365,0)
 count_years','a.user_id=?','', array($edit_id));
		if ($applicant!=null) {
			$_SESSION['contract_history_id']=$applicant['contract_history_id'];
			$salary_history=db::select('contract_history','*','user_id=?', '',array($edit_id));
			$count_year=$applicant['count_years'];
			$service=0;
			if ($count_year<1) {
				$severance=$applicant['salary'];
			} else if ($count_year<2) {
				$severance=2*$applicant['salary'];
			} else if ($count_year<3) {
				$severance=3*$applicant['salary'];
			} else {
				$severance=4*$applicant['salary'];
				$service=2*$applicant['salary']+0.15*$severance;
				
			}
			
			$applicant['projected_severance']=formatNumber($severance);
			$applicant['projected_service']=formatNumber($service);
			$salary_band=$applicant['salary_band'];
		} else {
			$salary_history="";
			$service="";
			$severance="";
			$salary_band="";
		}
		$data['salary_history']=$salary_history;
		$data['service']=$service;
		$data['severance']=$severance;
		$data['salary_band']=$salary_band;
		$data['applicant']=$applicant;
		return $data;
	}
}
?>