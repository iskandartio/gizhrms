<?php
class employee {
	static function get_active_employee_simple($filter="", $params=array()) {
		$sql="select a.user_id, a.first_name, a.last_name from applicants a
where coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)>=curdate()".$filter."
order by a.first_name, a.last_name";
		$res=db::DoQuery($sql, $params);
		return $res;
	}
	static function get_active_employee($filter="", $params=array()) {
		$sql="select a.user_id, a.first_name, a.last_name
, a.contract1_start_date, a.contract1_end_date 
, a.am1_start_date, a.am1_end_date
, a.contract2_start_date, a.contract2_end_date
, a.am2_start_date, a.am2_end_date
, a.adj_salary, a.adj_salary_band, a.adj_reason
, e.start_date, e.end_date
, e.salary, e.salary_band, e.reason
, e.project_name, e.project_number, e.project_location
, e.principal_advisor, e.team_leader, e.responsible_superior, e.SAP_No
, e.job_title, e.position 
from applicants a
left join m_user_role b on a.user_id=b.user_id
left join m_role c on c.role_id=b.role_id
inner join (select user_id, max(end_date) end_date from contract_history group by user_id) d on d.user_id=a.user_id
inner join contract_history e on e.user_id=a.user_id and e.end_date=d.end_date
where c.role_name='employee' and ifnull(a.contract_state,'')!='Terminate'".$filter;
		$sql.=" order by a.first_name, a.last_name";
		
		$res=db::DoQuery($sql, $params);
		return $res;
	}
	static function get_process_salary_table($start_date, $res) {
		if (count($res)==0) {
			return "No Data";
		}
		$result="Salary Adjustment Start Date : ".formatDate($start_date)."<p>
<table class='tbl' id='tbl_data'>
<thead><tr><th>First Name</th><th>Last Name</th><th>Job Title</th>
<th>Adjusted Salary</th><th>Adjusted<br>Salary Band</th><th>Reason</th></tr></thead><tbody>";
		foreach ($res as $rs) {
			foreach ($rs as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$first_name</td><td>$last_name</td><td>$job_title</td>
			<td>".formatNumber($adj_salary)."</td><td>$adj_salary_band</td><td>$adj_reason</td></tr>";

		}
		$result.="</tbody></table>";
		$result.="<button class='button_link' id='process_salary'>Process Salary</button>";
		return $result;
	}
	static function get_process_salary_data() {
		$res=db::select('applicants a
		left join m_user_role b on a.user_id=b.user_id
		left join m_role c on c.role_id=b.role_id
		inner join contract_history d on a.user_id=d.user_id and curdate() between d.start_date and d.end_date'
		,'a.user_id, a.first_name, a.last_name, d.job_title, d.salary, d.salary_band, a.adj_salary, a.adj_salary_band, a.adj_reason'
		, "c.role_name='employee' and a.adj_salary is not null");
		return $res;
	}
	static function processSalaryAdjustment($start_date) {
		$end_date=shared::addDate($start_date,-1);
		
		$con=db::beginTrans();
		$sql="create temporary table a
		select b.user_id, ? start_date, coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date) end_date
, a.adj_salary, b.job_title, a.adj_salary_band
, b.project_name, b.project_number, b.principal_advisor
, b.team_leader, b.project_location, b.responsible_superior
, b.SAP_No, b.position, a.adj_reason from applicants a
left join contract_history b on b.user_id=a.user_id and curdate() between b.start_date and b.end_date
where a.adj_salary!=b.salary";
		db::ExecMe($sql, array($start_date),$con);
		$sql="delete from contract_history where start_date>curdate()";
		db::ExecMe($sql, array(),$con);
		$sql="update applicants a
inner join contract_history c on c.user_id=a.user_id and curdate() between c.start_date and c.end_date
set c.end_date=?
where a.adj_salary!=c.salary";
		db::ExecMe($sql, array($end_date),$con);
		
		$sql="insert into contract_history(user_id, start_date, end_date, 
salary, job_title, salary_band, project_name, project_number, principal_advisor
, team_leader, project_location, responsible_superior, SAP_No, position, reason)
select * from a";
		db::ExecMe($sql, array(),$con);
		$sql="drop table a";
		db::ExecMe($sql, array(),$con);
		$sql="update applicants set adj_salary=null, adj_salary_band=null, adj_reason=null";
		db::ExecMe($sql, array(),$con);
		$sql="delete from contract_history where end_date<start_date";
		db::ExecMe($sql, array(),$con);
		
		db::commitTrans($con);
	}
	static function get_expiring_table($res) {
		$result="<table id='tbl' class='tbl'>
<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>First Contract</th><th>First Amendment</th>
<th>Extension Contract</th><th>Second Amendment</th><th></th></tr><thead>
<tbody>";
		foreach ($res as $rs) {
			foreach ($rs as $key=>$val) {
				$$key=$val;
			}
			
			$result.= "<tr><td>$user_id</td><td>$first_name</td><td>$last_name</td>
				<td>".formatDate($contract1_start_date)." - ".formatDate($contract1_end_date)."</td>
				<td>".formatDate($am1_start_date)." - ".formatDate($am1_end_date)."</td>
				<td>".formatDate($contract2_start_date)." - ".formatDate($contract2_end_date)."</td>
				<td>".formatDate($am2_start_date)." - ".formatDate($am2_end_date)."</td>
				<td><button class='btn_terminate'>Terminate Contract</button><button class='btn_recontract'>Re-Contract</button></td>
				</tr>";
		}
		$result.="</table>";
		return $result;
	}
	static function get_expiring_res() {
		$days=db::select_single('settings','setting_val v',"setting_name='Contract Reminder'");
		$res=db::DoQuery("select a.user_id, a.first_name, a.last_name
	, a.contract1_start_date, a.contract1_end_date
	, a.am1_start_date, a.am1_end_date
	, a.contract2_start_date, a.contract2_end_date
	, a.am2_start_date, a.am2_end_date
	 from applicants a
	where a.contract_state!='Terminate' and date_add(curdate(), interval ".$days." day)>coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)
	order by coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)");
		return $res;
	}
	static function get_recontract_table($name, $applicant) {
		foreach ($applicant as $key=>$val) {
			$$key=$val;
		}
		$sql="select salary_band from salary_band order by salary_band";
		$res=db::DoQuery($sql);
		$salary_band_option=shared::select_combo_complete($res, 'salary_band', '-Choose One-', '', $salary_band);
		
		$result="<h1>$name</h1>";
		$result.="<button class='btn_save'>Save</button>";
		$result.="<table>";
		$result.="<tbody>
					<tr><td>Start Date</td><td>:</td><td>"._t2('start_date')."</td></tr>
	<tr><td>End Date</td><td>:</td><td>"._t2("end_date")."</td></tr>
	<tr><td>Project Name</td><td>:</td><td>"._t2("project_name", $applicant)."</td></tr>
	<tr><td>Project Number</td><td>:</td><td>"._t2("project_number", $applicant)."</td></tr>
	<tr><td>Project Location</td><td>:</td><td>"._t2("project_location", $applicant)."</td></tr>
	<tr><td>Principal Advisor</td><td>:</td><td>"._t2("principal_advisor", $applicant)."</td></tr>
	<tr><td>Team Leader</td><td>:</td><td>"._t2("team_leader", $applicant)."</td></tr>
	<tr><td>Responsible Superior</td><td>:</td><td>"._t2("responsible_superior", $applicant)."</td></tr>
	<tr><td>SAP No</td><td>:</td><td>"._t2("SAP_No", $applicant)."</td></tr>
	<tr><td>Position</td><td>:</td><td>"._t2("position", $applicant)."</td></tr>
	<tr><td>Job Title</td><td>:</td><td>"._t2("job_title", $applicant, "60");
		$result.="</tbody></table>";
		$result.="<h1>Salary</h1>
<table>
	<tr><td>Salary</td><td>:</td><td>"._t2("salary", formatNumber($applicant['salary']))."</td></tr>
	<tr><td>Salary Band</td><td>:</td><td>".$salary_band_option."</td></tr>
	<tr><td>Reason</td><td>:</td><td>"._t2("reason", $applicant)."</td></tr>
</table>";
		$result.="<button class='btn_save'>Save</button>";
		return $result;
	}
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
		if ($i1>0) $result.="<td title='".formatDate(shared::addDate($first_end,1))." to ".formatDate(shared::addDate($am1,-1))."' style='height:30px;width:".($i1/2)."px;background-color:darkgrey'></td>";
		if ($d2>0) $result.="<td title='".formatDate($am1)." to ".formatDate($am1_end)."' style='height:30px;width:".($d2/2)."px;background-color:blue'></td>";
		if ($i2>0) $result.="<td title='".formatDate(shared::addDate($am1_end,1))." to ".formatDate($first_limit)."' style='height:30px;width:".($i2/2)."px;background-color:darkgrey'></td>";
		$result.="</tr></table>";
		return $result;
		
	}
	static function getApplicantData($edit_id) {
		$applicant=db::select_one('applicants a
left join contract_history b on a.user_id=b.user_id and curdate() between b.start_date and b.end_date
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
	static  function get_user_name($user_id) {
		return db::select_single('applicants',"concat(first_name,' ',last_name) v", "user_id=?","", array($user_id));
	}
	static function get_dependent_res($user_id) {
		$res=db::select('employee_dependent','*','user_id=?','relation, name', array($user_id));
		return $res;
	}
	static function get_dependent_table($user_name, $res) {
		$result="<h1>$user_name</h1>";
		$result.="<button class='button_link' id='btn_add_dependent'>Add Dependent</button>";
		$result.="<table class='tbl' id='tbl_dependent'>";
		$result.="<thead><tr><th></th><th>Relation</th><th>Name</th><th>DOB</th><th></th></tr></thead><tbody>";
		foreach ($res as $rs) {
			foreach  ($rs as $key=>$val){
				$$key=$val;
			}
			$result.="<tr><td>$employee_dependent_id</td><td>$relation</td><td>$name</td><td>".formatDate($date_of_birth)."</td>
			<td>".getImageTags(['edit','delete'])."</td></tr>";
		}
		$result.="</tbody></table>";
		return $result;
	}
}
?>