<?php
class employee {
	static function get_active_employee_simple_one($filter="", $params=array()) {
		
		$res=self::get_active_employee_simple($filter, $params);
		if (count($res)>0) return $res[0];
		return null;
	}
	static function get_active_employee_simple($filter="", $params=array()) {
		if ($filter!='') $filter=" and $filter";
		$sql="select a.*, contract1_start_date start_date
			, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date from applicants a
	inner join m_user_role b on a.user_id=b.user_id
	inner join m_role c on c.role_name='employee' and c.role_id=b.role_id
where ifnull(contract_state,'')!='Terminate'".$filter."
order by a.first_name, a.last_name";
		$res=db::DoQuery($sql, $params);
		return $res;
	}
	static function get_active_employee_by_year($y, $filter="", $params=array()) {
		if ($filter!='') $filter=" and $filter";
		$sql="select a.*, contract1_start_date start_date
			, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date from applicants a
	inner join m_user_role b on a.user_id=b.user_id
	inner join m_role c on c.role_name='employee' and c.role_id=b.role_id
where contract1_start_date<='".date("$y-12-31")."' and coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date)>='".date("$y-01-01")."'".$filter."
order by a.first_name, a.last_name";
		$res=db::DoQuery($sql, $params);
		return $res;
	}
	static function get_active_employee($filter="", $params=array()) {
		$sql="select a.*, e.*
from applicants a
left join m_user_role b on a.user_id=b.user_id
left join m_role c on c.role_id=b.role_id
inner join contract_history e on e.user_id=a.user_id ".shared::joinContractHistory("e","a")."
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
		inner join contract_history d on a.user_id=d.user_id '.shared::joinContractHistory("d","a")
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
, b.project_name, b.project_number, b.principle_advisor
, b.team_leader, b.project_location, b.responsible_superior
, b.SAP_No, b.position, a.adj_reason from applicants a
left join contract_history b on b.user_id=a.user_id ".shared::joinContractHistory("b","a")."
where a.adj_salary!=b.salary";
		db::ExecMe($sql, array($start_date),$con);
		$sql="delete from contract_history where start_date>curdate()";
		db::ExecMe($sql, array(),$con);
		$sql="update applicants a
inner join contract_history c on c.user_id=a.user_id ".shared::joinContractHistory("c","a")."
set c.end_date=?
where a.adj_salary!=c.salary";
		db::ExecMe($sql, array($end_date),$con);
		
		$sql="insert into contract_history(user_id, start_date, end_date, 
salary, job_title, salary_band, project_name, project_number, principle_advisor
, team_leader, project_location, responsible_superior, SAP_No, position, reason)
select * from a";
		db::ExecMe($sql, array(),$con);
		$sql="drop table if exists a";
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
				<td><button class='btn_terminate'>Terminate Contract</button><button class='btn_recontract'>New Cycle</button></td>
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
	where ifnull(a.contract_state,'')!='Terminate' and date_add(curdate(), interval ".$days." day)>coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)
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
	<tr><td>Principle Advisor</td><td>:</td><td>"._t2("principle_advisor", $applicant)."</td></tr>
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
			<td style='min-width:80px'>
			<div class='row'><b>Start Date</b></div>
			<div class='row'>".formatDate($start_date)."</div>
			<div class='row'><b>End Date</b></div>
			<div class='row'>".formatDate($end_date)."</div>
			
			</td>
			<td>
			<table class='top'>
			<tr><td><b>Proj Name</b></td><td>:</td><td>$project_name</td></tr>
			<tr><td><b>Proj Number</b></td><td>:</td><td>$project_number</td></tr>
			<tr><td><b>Proj Location</b></td><td>:</td><td>$project_location</td></tr>
			</table>
			</td>
			<td>
			<table class='top'>
			<tr><td><b>Principle Advisor</b></td><td>:</td><td>$principle_advisor</td></tr>
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
			</td><td>".getImageTags(array("print"))."</td>
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
		$applicant=db::select_one("applicants a
left join contract_history b on a.user_id=b.user_id ".shared::joinContractHistory('b','a')."
left join m_user c on c.user_id=a.user_id"
,'a.*, b.*, c.*, (datediff(contract1_end_date, contract1_start_date)+1)/365+ 
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
	static function get_dependent_table($res, $spouse, $marry_date) {
		$result="";
		$result.="<div class='row'>
			<div class='label'>Spouse Name</div><div class='textbox'>"._t2("spouse_name", $spouse)."</div>
			<div class='label'>Marry Date</div><div class='textbox'>"._t2("marry_date", $marry_date)."</div> "._t2("save_spouse","Save","","button","button_link")."</div><p>";
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
	static function get_working_res($user_id) {
		$res=db::select('applicants_working a
		left join business b on a.business_id=b.business_id','*, b.business_val','user_id=?','year_from, month_from', array($user_id));
		return $res;
	}
	static function get_working_table($res) {
		
		$month_options=month_options();
		$business_id=db::select('business','business_id, business_val','','sort_id');
		$combo_business=shared::select_combo($business_id,'business_id', 'business_val');
		$result="";
		$result.="<table class='tbl' id='tbl_working'>
		<thead><tr><th>ID<th colspan='2'>From</th><th colspan='2'>To</th><th>Employer</th><th>Job Title</th><th>Nature of Business</th><th>Contact</th><th>Leave Reason</th><th></th></tr></thead>
		<tbody>";
		foreach($res as $row) {
			$result.='<tr><td>'.$row['applicants_working_id'].'</td>';
			$result.='<td style="border-right:0 !important"><span style="display:none">'.$row['month_from'].'</span>'.get_month_name($row['month_from']).'</td>';
			$result.='<td style="border-left:0 !important">'.$row['year_from'].'</td>';
			$result.='<td style="border-right:0 !important"><span style="display:none">'.$row['month_to'].'</span>'.get_month_name($row['month_to']).'</td>';
			$result.='<td style="border-left:0 !important">'.$row['year_to'].'</td>';
			$result.='<td>'.$row['employer'].'</td>';
			$result.='<td>'.$row['job_title'].'</td>';
			$result.='<td><span style="display:none">'.$row['business_id'].'</span>'.$row['business_val'];
			$result.='<td>'.($row['may_contact']==0 ? 'None' : '<span id="_email">'.$row['email'].'</span> <span id="_phone">'.$row['phone']).'</span></td>';
			$result.='<td>'.$row['leave_reason'].'</td>';
			$result.="<td>".getImageTags(array('edit','delete'))."</td>";
			$result.="</tr>";
		}
		$result.="</tbody></table>";
		$result.="<button class='button_link' id='btn_add'>Add New</button>";
		$result.="<table>
<tr style='display:none'><td>Applicants Working ID</td><td>:</td><td>"._t2("applicants_working_id")."</td></tr>
<tr><td>From *</td><td>:</td><td><select id='month_from' class='month_from'>
<option value='' selected disabled>-Month-</option>".$month_options."</select> "._t2("year_from","",3)."</td></tr>
<tr><td>To *</td><td>:</td><td><select id='month_to' class='month_to'><option value='' selected disabled>-Month-</option>".$month_options."</select> "._t2("year_to","",3)."</td></tr>
<tr><td>Employer *</td><td>:</td><td>"._t2("employer","",50)."</td></tr>
<tr><td>Job Title *</td><td>:</td><td>"._t2("job_title","",50)."</td></tr>
<tr><td>Nature of Business *</td><td>:</td><td><select id='business_id' class='business_id' title='Nature of Business'><option value='' selected disabled>-Nature of Business-</option>
".$combo_business."</select></td></tr>
<tr><td>May Contact</td><td>:</td><td><input type='checkbox' id='may_contact'><label for='may_contact'>May we contact your employer?</label>
<span id='reference_contact'>"._t2("email")." "._t2("phone")."</span></td></tr>
<tr><td>Leave Reason</td><td>:</td><td><textarea id='leave_reason' class='leave_reason' cols='50'></textarea></td></tr>
</table>
<button class='button_link' id='btn_save'>Save as New</button>";
		return $result;
	}

	static function getProjectView($applicant, $combo_project_name_def='') {
		$sql="select salary_band from salary_band order by salary_band";
		$res=db::DoQuery($sql);
		$salary_band_option=shared::select_combo_complete($res, 'salary_band', '-Choose One-', '', $applicant['salary_band']);

		$project_name=Project::getProjectName();
		if ($combo_project_name_def=='') {
			$combo_project_name_def=shared::select_combo_complete($project_name, 'project_name', '-Project Name-');
		}
		$project_name_option=shared::set_selected($applicant['project_name'], $combo_project_name_def);
		
		$combo_project_number=shared::select_combo_complete(Project::getProjectNumberByProjectName($applicant['project_name']), 'project_number', '-Project Number-', 'project_number', $applicant['project_number']);
		$result="<h1>Project</h1><table>";
		if (startsWith($applicant['start_date'],'1900')||!isset($applicant)) {
			$result.="<tr><td>Start Date</td><td>:</td><td>"._t2("start_date")."</td></tr>
					<tr><td>End Date</td><td>:</td><td>"._t2("end_date")."</td></tr>";
		}
		$result.="<tr><td>Project Name</td><td>:</td><td>".$project_name_option."</td></tr>
			<tr><td>Team Leader</td><td>:</td><td><span class='team_leader'>"._lbl("team_leader", $applicant)."</span></td></tr>
	<tr><td>Project Number</td><td>:</td><td>".$combo_project_number."</td></tr>
	<tr><td>Principle Advisor</td><td>:</td><td><span class='principle_advisor'>"._lbl("principle_advisor", $applicant)."</span></td></tr>
	<tr><td>Project Location</td><td>:</td><td>"._t2("project_location", $applicant)."</td></tr>
	<tr><td>Responsible Superior</td><td>:</td><td>"._t2("responsible_superior", $applicant)."</td></tr>
	<tr><td>SAP No</td><td>:</td><td>"._t2("SAP_No", $applicant)."</td></tr>
	<tr><td>Position</td><td>:</td><td>"._t2("position", $applicant)."</td></tr>
	<tr><td>Job Title</td><td>:</td><td>"._t2("job_title", $applicant, "60")."</td></tr>
	<tr><td>Salary</td><td>:</td><td>"._t2("salary", formatNumber($applicant['salary']))."</td></tr>
	<tr><td>Salary Band</td><td>:</td><td>".$salary_band_option."</td></tr>
	<tr><td>Reason</td><td>:</td><td>"._t2("reason", $applicant)."</td></tr>
	<tr><td>Working Time</td><td>:</td><td>"._t2("working_time", $applicant,"1")." %</td></tr>
</table>";
		$result.=employee::getSalarySharingView($applicant, $combo_project_name_def);
		$result.="<button class='button_link' id='btn_save_project'>Change Project</button>";
		return $result;
	}
	static function getSalarySharingView($row, $combo_project_name_def='') {
		$result="
<div class='row'><div class='label'>Salary Sharing</div><div class='label'>".getImageTags(['add'])."</div></div>
<div class='div_salary_sharing'>";

		$res_salary_sharing=db::select('salary_sharing','*','contract_history_id=?','',array($row['contract_history_id']));
		if ($combo_project_name_def=='') {
			$combo_project_name_def=shared::select_combo_complete($project_name, 'project_name', '-Project Name-');
			
		}
		foreach ($res_salary_sharing as $rs)  {
			
			$project_name_option=shared::set_selected($rs['project_name'], $combo_project_name_def);
			$project_number_option=shared::select_combo_complete(Project::getProjectNumberByProjectName($rs['project_name']), 'project_number', '-Project Number-', 'project_number', $rs['project_number']);
			$result.="<div class='row'><div class='label width120'>".$project_name_option."</div>
				<div class='label width120'>".$project_number_option."</div>
				<div class='label width80'>"._t2("percentage", $rs,"1")." % ".getImageTags(['delete'],'SalarySharing')."</div></div>";
		}
		$result.="</div>";
		return $result;
	}
	static function getShowTerminate($terminate_date) {
		$result="<h1>Severance Data</h1>";
		$d=employee::getApplicantData($_SESSION['user_id']);
		foreach ($d as $key=>$val) {
			$$key=$val;
		}
		foreach ($applicant as $key=>$val) {
			$$key=$val;
		}
		if ($terminate_date!='') {
			if ($terminate_date<$contract1_end_date) {
				$contract1_end_date=$terminate_date;
			}
			if ($am1_end_date!=null) {
				if ($terminate_date<$am1_end_date) {
					$am1_end_date=$terminate_date;	
				}
			}
			if ($contract2_end_date!=null) {
				if ($terminate_date<$contract2_end_date) {
					$contract2_end_date=$terminate_date;	
				}
			}
			if ($am2_end_date!=null) {
				if ($terminate_date<$am2_end_date) {
					$am2_end_date=$terminate_date;	
				}
			}
		}
		$numDays=array();
		array_push($numDays, shared::dateDiff($contract1_start_date, $contract1_end_date));
		$result.="<div class='row b'>$first_name $last_name</div>";
		$result.="<div class='row b'><div class='label width140'>Salary</div><div class='label2'>".formatNumber($salary)."</div></div>";
		
		$result.="<div class='row b'><div class='label width140'>First Contract </div><div class='label2'>".formatDate($contract1_start_date)." to ".formatDate($contract1_end_date)." (".$numDays[count($numDays)-1]." days)</div></div>";
		if ($am1_end_date!=null)  {
			array_push($numDays, shared::dateDiff($am1_start_date, $am1_end_date));
			$result.="<div class='row b'><div class='label width140'>First Amendment </div><div class='label2'> ".formatDate($am1_start_date).' to '.formatDate($am1_end_date)." (".$numDays[count($numDays)-1]." days)</div></div>";
		}
		if ($contract2_end_date!=null)  {
			array_push($numDays, shared::dateDiff($contract2_start_date, $contract2_end_date));
			$result.="<div class='row b'><div class='label width140'>Extension Contract </div><div class='label2'>".formatDate($contract2_start_date).' to '.formatDate($contract2_end_date)." (".$numDays[count($numDays)-1]." days)</div>";
		}
		if ($am2_end_date!=null)  {
			array_push($numDays, shared::dateDiff($am2_start_date, $am2_end_date));
			$result.="<div class='row b'><div class='label width140'>Second Amendment </div><div class='label2'>".formatDate($am2_start_date).' to '.formatDate($am2_end_date)." (".$numDays[count($numDays)-1]." days)</div>";
		}
		$sumDays= array_sum($numDays);
		$severance=0;
		$service=0;
		if (shared::dateDiff($contract1_start_date, shared::addYearOnly($contract1_start_date,1))>$sumDays) {
			$severance=$salary;
		} else if (shared::dateDiff($contract1_start_date, shared::addYearOnly($contract1_start_date,2))>$sumDays) {
			$severance=2*$salary;
		} else if (shared::dateDiff($contract1_start_date, shared::addYearOnly($contract1_start_date,3))>$sumDays) {
			$severance=3*$salary;
		} else {
			$severance=4*$salary;
			$service=2*$salary+0.15*$severance;
		}

		$result.="<div class='row b'><div class='label width140'>Severance </div><div class='label2 severance'>".formatNumber($severance)."</div></div>";
		$result.="<div class='row b'><div class='label width140'>Service </div><div class='label2 service'>".formatNumber($service)."</div></div>";
		$result.="<div class='row b'><div class='label width140'>Total </div><div class='label2'>".formatNumber($service+$severance)."</div></div>";
		$result.="<button class='button_link' id='change_severance'>Change Severance</button>";
		$result.="<button class='button_link' id='terminate'>Terminate</button>";
		$result.="<div id='div_severance' style='display:none'>
		<div class='row'><div class='label'>Reason</div><div class='textbox'><textarea id='reason'></textarea></div></div>
		<div class='row'><div class='label'>Severance</div><div class='textbox'>"._t2("new_severance")."</div></div>
		<button class='button_link' id='cancel_change'>Cancel</button>
		</div>
		";
		
		return $result;
	}
	static function getShowTerminateImmediately() {
		$result="<h1>Terminate Immediately</h1>";
		$result.=_t2("terminate_date", date('Y-m-d'));
		$result.=" <button class='button_link btn_calculate'>Calculate Severance</button>";
		$result.="<div id='div_severance_data'></div>";
		return $result;
	}
	static function terminate($severance, $service, $new_severance, $reason, $terminate_date) {
		$user_id=$_SESSION['user_id'];
		$con=db::beginTrans();
		
		$sql="insert into applicants_history(user_id, contract1_start_date, contract1_end_date, am1_start_date, am1_end_date
		, contract2_start_date, contract2_end_date, am2_start_date, am2_end_date, severance, service, new_severance, reason, terminate_date)
		select user_id, contract1_start_date, contract1_end_date, am1_start_date, am1_end_date
		, contract2_start_date, contract2_end_date, am2_start_date, am2_end_date, ?,?,?,?,? from applicants where user_id=?";
		db::ExecMe($sql, array($severance, $service, $new_severance, $reason, $terminate_date, $user_id), $con);
		db::update('applicants','contract_state','user_id=?', array('Terminate', $user_id), $con);
		db::commitTrans($con);
	}
}
?>