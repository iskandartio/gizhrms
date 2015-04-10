<?php
class Employee {
	static function getResponsibleSuperiorCombo($applicant) {
		
		$sql="select a.user_id as responsible_superior, concat(b.first_name,' ',b.last_name) full_name from contract_history a
inner join employee b on coalesce(b.am2_end_date, b.contract2_end_date, b.am1_end_date, b.contract1_end_date)=a.end_date and b.user_id=a.user_id 
and ifnull(b.contract_state,'')!='Terminate'
where a.job_title='Senior Advisor' and a.project_name=?";
		
		$res=db::DoQuery($sql, array($applicant['project_name']));
		
		
		foreach ($res as $rs) {
			$exists[$rs['responsible_superior']]=1;
		}
		if (!isset($exists[$applicant['financial_controller']])) {
			array_push($res, array("responsible_superior"=>$applicant['financial_controller'], "full_name"=>_name($applicant['financial_controller'])));
			$exists[$applicant['financial_controller']]=1;
		}
		if (!isset($exists[$applicant['principal_advisor']])) {
			array_push($res, array("responsible_superior"=>$applicant['principal_advisor'], "full_name"=>_name($applicant['principal_advisor'])));
			$exists[$applicant['principal_advisor']]=1;
		}
		if (!isset($exists[$applicant['team_leader']])) {
			array_push($res, array("responsible_superior"=>$applicant['team_leader'], "full_name"=>_name($applicant['team_leader'])));
			$exists[$applicant['team_leader']]=1;
		}
		if (!isset($exists[$applicant['office_manager']])) {
			array_push($res, array("responsible_superior"=>$applicant['office_manager'], "full_name"=>_name($applicant['office_manager'])));
			$exists[$applicant['office_manager']]=1;
		}
		$combo_responsible_superior="";
		$combo_responsible_superior.=shared::select_combo_complete($res, 'responsible_superior', '-Responsible Superior', 'full_name', $applicant['responsible_superior']);
		return $combo_responsible_superior;
	}
	
	static function get_active_employee_simple_one($filter="", $params=array()) {
		
		$res=Employee::get_active_employee_simple($filter, $params);
		
		if (count($res)>0) {
			//$_SESSION['user_id']=$res[0]['user_id'];
			return $res[0];
		}
		return null;
	}
	
	static function get_active_employee_simple($filter="", $params=array()) {
		if ($filter!='') $filter=" and $filter";
		$sql="select a.*, contract1_start_date start_date
			, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date, b.user_name from employee a
			left join m_user b on a.user_id=b.user_id";
		if (isset($_SESSION['project_location'])) {
			$sql.=" inner join contract_history c on c.project_location in (".$_SESSION['in_project_location'].") 
				and coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)=c.end_date and c.user_id=a.user_id";
			$params=array_merge($_SESSION['project_location'], $params );
		}
		$sql.=" where ifnull(contract_state,'')!='Terminate'".$filter."
			order by a.first_name, a.last_name";
		$res=db::DoQuery($sql, $params);
		
		return $res;
	}

	static function get_active_employee($filter="", $params=array()) {
		if ($filter!='') $filter=" and $filter";
		$sql="select a.*, c.*, b.user_name
from employee a
left join m_user b on b.user_id=a.user_id
inner join contract_history c on c.user_id=a.user_id ".shared::joinContractHistory("c","a");
		if (isset($_SESSION['project_location'])) {
			$sql.=" and c.project_location in (".$_SESSION['in_project_location'].")";
			$params=array_merge($_SESSION['project_location'], $params);
		}
		$sql.=" where ifnull(a.contract_state,'')!='Terminate'".$filter;
		$sql.=" order by a.first_name, a.last_name";
		
		$res=db::DoQuery($sql, $params);
		$res=shared::fixSalary($res);
		$res=shared::fixSalary($res,'adj_salary');
		
		return $res;
	}
	static function get_active_employee_by_year($y, $filter="", $params=array()) {
		if ($filter!='') $filter=" and $filter";
		$sql="select a.*, contract1_start_date start_date
			, coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) end_date from employee a
where contract1_start_date<='".date("$y-12-31")."' and coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date)>='".date("$y-01-01")."'".$filter."
order by a.first_name, a.last_name";
		$res=db::DoQuery($sql, $params);
		return $res;
	}
	static function get_active_employee_one($filter="", $params=array()) {
		$res=Employee::get_active_employee($filter, $params);
		if (count($res)==0){
			$_SESSION['user_id']=0;
			return null;
		}
		$_SESSION['user_id']=$res[0]['user_id'];
		$_SESSION['contract_history_id']=$res[0]['contract_history_id'];
		return $res[0];
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
		$res=Employee::get_active_employee("a.adj_salary is not null");
		return $res;
	}
	
	static function processSalaryAdjustment($start_date) {
		$end_date=shared::addDate($start_date,-1);
		
		$con=db::beginTrans();
		$sql="create temporary table a
		select b.user_id, ? start_date, coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date) end_date
, b.job_title, b.position, b.project_name, b.principal_advisor, b.financial_controller
, b.project_number, b.team_leader, b.project_location, b.responsible_superior, b.SAP_No
, a.adj_salary, a.adj_salary_band, a.adj_reason from employee a
left join contract_history b on b.user_id=a.user_id ".shared::joinContractHistory("b","a")."
where a.adj_salary is not null";
		db::ExecMe($sql, array($start_date),$con);
		
		$sql="update employee a
inner join contract_history c on c.user_id=a.user_id ".shared::joinContractHistory("c","a")."
set c.end_date=?
where a.adj_salary is not null";
		db::ExecMe($sql, array($end_date),$con);
		
		$sql="insert into contract_history(user_id, start_date, end_date
		, job_title, position, project_name, principal_advisor, financial_controller
		, project_number, team_leader, project_location, responsible_superior, SAP_No
		, salary, salary_band, reason)
		select * from a";
		db::ExecMe($sql, array(),$con);
		$sql="drop table if exists a";
		db::ExecMe($sql, array(),$con);
		$sql="update employee set adj_salary=null, adj_salary_band=null, adj_reason=null";
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
				<td><button class='btn_stop'>Stop Contract</button><button class='btn_recontract'>New Cycle</button></td>
				</tr>";
		}
		$result.="</table>";
		return $result;
	}
	static function get_expiring_res() {
		$days=db::select_single('settings','setting_val v',"setting_name='Contract Reminder'");
		$res=Employee::get_active_employee("date_add(curdate(), interval ".$days." day)>coalesce(a.am2_end_date, a.contract2_end_date, a.am1_end_date, a.contract1_end_date)");
		
		return $res;
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
	static function get_salary_history_res($contract_history_id) {
		$salary_history=db::select("contract_history a
inner join contract_history b on a.user_id=b.user_id"
,'b.*','a.contract_history_id=?', 'end_date  desc, start_date desc',array($contract_history_id));
		return shared::fixSalary($salary_history);
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
			<tr><td><b>Financial Controller</b></td><td>:</td><td>"._name($financial_controller)."</td></tr>
			<tr><td><b>Principal Advisor</b></td><td>:</td><td>"._name($principal_advisor)."</td></tr>
			<tr><td><b>Team Leader</b></td><td>:</td><td>"._name($team_leader)."</td></tr>
			<tr><td><b>Responsible Superior</b></td><td>:</td><td>"._name($responsible_superior)."</td></tr>
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
		return $result;
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

	static function get_dependent_res($user_id) {
		$res=db::select('employee_dependent','*','user_id=?','relation, name', array($user_id));
		return $res;
	}
	static function get_dependent_table($res, $spouse, $marry_date, $spouse_entitled) {
		
		$result="";
		$result.="<div class='row'>
			<div class='label'>Spouse Name</div><div class='textbox'>"._t2("spouse_name", $spouse)."</div>
			<div class='label'>Date of Marriage</div><div class='label'>"._t2("marry_date", $marry_date)."</div> 
			<div class='label'><input type='checkbox' ".($spouse_entitled==1 ? "checked" : "")." class='spouse_entitled' id='spouse_entitled'/><label for='spouse_entitled'>Entitled</label></div>
			"._t2("save_spouse","Save","","button","button_link")."</div><p>";
		$result.="<button class='button_link' id='btn_add_dependent'>Add Dependent</button>";
		$result.="<table class='tbl' id='tbl_dependent'>";
		$result.="<thead><tr><th></th><th>Relation</th><th>Name</th><th>DOB</th><th>Entitled</th><th></th></tr></thead><tbody>";
		foreach ($res as $rs) {
			foreach  ($rs as $key=>$val){
				$$key=$val;
			}
			$result.="<tr><td>$employee_dependent_id</td><td>$relation</td><td>$name</td><td>".formatDate($date_of_birth)."</td>
			<td>".($entitled==1 ? "Yes" : "No")."</td>
			<td>".getImageTags(['edit','delete'])."</td></tr>";
		}
		$result.="</tbody></table>";
		
		return $result;
	}
	static function get_working_res($user_id, $tbl) {
		$res=db::select($tbl.'_working a
		left join business b on a.business_id=b.business_id
		left join countries c on c.countries_id=a.countries_id
		','a.*, b.business_val, c.countries_val','user_id=?','year_from, month_from', array($user_id));
		return $res;
	}

	static function get_working_table($res, $tbl) {
		$combo_countries_def=shared::select_combo_complete(db::select('countries','*','','countries_val'), 'countries_id','-Country-','countries_val','','150px');
		$month_options=month_options();
		$business_id=db::select('business','business_id, business_val','','sort_id');
		$combo_business=shared::select_combo($business_id,'business_id', 'business_val');
		
		$combo_countries_def=$combo_countries_def;
		
		$result="";
		$result.="<table class='tbl' id='tbl_working'>
		<thead><tr><th>ID<th colspan='2'>From</th><th colspan='2'>To</th><th>Employer</th><th>Country</th><th>Job Title</th><th>Nature of Business</th><th>Contact</th><th>Leave Reason</th><th></th></tr></thead>
		<tbody>";
		
		foreach($res as $row) {
		
			$result.='<tr><td>'.$row[$tbl.'_working_id'].'</td>';
			$result.='<td style="border-right:0 !important"><span style="display:none">'.$row['month_from'].'</span>'.get_month_name($row['month_from']).'</td>';
			$result.='<td style="border-left:0 !important">'.$row['year_from'].'</td>';
			$result.='<td style="border-right:0 !important"><span style="display:none">'.$row['month_to'].'</span>'.get_month_name($row['month_to']).'</td>';
			$result.='<td style="border-left:0 !important">'.$row['year_to'].'</td>';
			
			$result.='<td>'.$row['employer'].'</td>';
			$result.='<td><span style="display:none">'.$row['countries_id'].'</span>'.$row['countries_val']."</td>";
			$result.='<td>'.$row['job_title'].'</td>';
			$result.='<td><span style="display:none">'.$row['business_id'].'</span>'.$row['business_val']."</td>";
			$result.='<td>'.($row['may_contact']==0 ? 'None' : '<span id="_email">'.$row['email'].'</span> <span id="_phone">'.$row['phone']).'</span></td>';
			$result.='<td>'.$row['leave_reason'].'</td>';
			$result.="<td>".getImageTags(array('edit','delete'))."</td>";
			$result.="</tr>";
			
		}
		$result.="</tbody></table>";
		$result.="<button class='button_link' id='btn_add'>Add New</button>";
		
		$result.="<table>
		<tr style='display:none'><td>_ Working ID</td><td>:</td><td>"._t2($tbl."_working_id")."</td></tr>
		<tr><td>From *</td><td>:</td><td><select id='month_from' class='month_from'>
		<option value='' selected disabled>-Month-</option>".$month_options."</select> "._t2("year_from","",3)."</td></tr>
		<tr><td>To *</td><td>:</td><td><select id='month_to' class='month_to'><option value='' selected disabled>-Month-</option>".$month_options."</select> "._t2("year_to","",3)."</td></tr>
		<tr><td>Employer *</td><td>:</td><td>"._t2("employer","",50)."</td></tr>";
		
		$result.="
		<tr><td>Country *</td><td>:</td><td>".$combo_countries_def."</td></tr>";
		
		$result.="
		<tr><td>Job Title *</td><td>:</td><td>"._t2("job_title","",50)."</td></tr>";

		$result.="
		<tr><td>Nature of Business *</td><td>:</td><td><select id='business_id' class='business_id' title='Nature of Business'><option value='' selected disabled>-Nature of Business-</option>
		".$combo_business."</select></td></tr>";
		
		$result.="
		<tr><td>May Contact</td><td>:</td><td><input type='checkbox' id='may_contact' checked><label for='may_contact'>May we contact your employer?</label>
		<span id='reference_contact'>"._t2("email")." "._t2("phone")."</span></td></tr>
		<tr><td>Leave Reason</td><td>:</td><td><textarea id='leave_reason' class='leave_reason' cols='50'></textarea></td></tr>
		</table>
		<button class='button_link' id='btn_save'>Save as New</button>";
		
		return $result;
	}

	static function getProjectView($applicant, $combo_project_name_def='', $type='') {
		
		if ($_SESSION['role_name']!='admin') {
			$result="<h1>Project</h1><div><table class='row'>
				<tr><td>Start Date</td><td>:</td><td>".formatDate(_lbl("start_date", $applicant))."</td></tr>
				<tr><td>End Date</td><td>:</td><td>".formatDate(_lbl("end_date", $applicant))."</td></tr>";
			$result.="<tr><td>Project Name</td><td>:</td><td>"._lbl("project_name", $applicant)."</td></tr>
				<tr><td>Principal Advisor</td><td>:</td><td>
				<span class='principal_advisor' style='display:none'>"._lbl("principal_advisor", $applicant)."</span>
				<span class='principal_advisor_name'>"._name('principal_advisor', $applicant)."</span>
				</td></tr>
				<tr><td>Financial Controller</td><td>:</td><td>
				<span class='financial_controller' style='display:none'>"._lbl("financial_controller", $applicant)."</span>
				<span class='financial_controller_name'>"._name('financial_controller', $applicant)."</span>
				</td></tr>
				<tr><td>Project Number</td><td>:</td><td>"._lbl('project_number', $applicant)."</td></tr>
				<tr><td>Team Leader</td><td>:</td><td><span class='team_leader' style='display:none'>"._lbl("team_leader", $applicant)."</span>
				<span class='team_leader_name'>"._name('team_leader', $applicant)."</span>
				</td></tr>
				<tr><td>Project Location</td><td>:</td><td>"._lbl('project_location', $applicant)."</td></tr>
				<tr><td>Office Manager</td><td>:</td><td><span class='office_manager' style='display:none'>"._lbl("office_manager", $applicant)."</span>
				<span class='office_manager_name'>"._name('office_manager', $applicant)."</span>
				<tr><td>Responsible Superior</td><td>:</td><td>"._lbl('responsible_superior', $applicant)."</td></tr>
				<tr><td>SAP No</td><td>:</td><td>"._lbl("SAP_No", $applicant)."</td></tr>
				<tr><td>Job Title</td><td>:</td><td>"._lbl('job_title', $applicant)."</td></tr>
				<tr><td>Position</td><td>:</td><td>"._lbl('position', $applicant)."</td></tr>
				<tr><td>Salary</td><td>:</td><td>".formatNumber(_lbl("salary", $applicant))."</td></tr>
				<tr><td>Salary Band</td><td>:</td><td>"._lbl('salary_band',$applicant)."</td></tr>
				<tr><td>Reason</td><td>:</td><td>"._lbl("reason", $applicant)."</td></tr>
				<tr><td>Working Time</td><td>:</td><td>"._lbl("working_time", $applicant)." %</td></tr>
				</table></div>";
			$result.=Employee::getSalarySharingView($applicant, $combo_project_name_def);
			
			return $result;
		}
		
		$sql="select salary_band from salary_band order by salary_band";
		$res=db::DoQuery($sql);
		$salary_band_option=shared::select_combo_complete($res, 'salary_band', '-Choose One-', '', $applicant['salary_band']);
		
		if ($combo_project_name_def=='') {
			$project_name=Project::getProjectName();
			$combo_project_name_def=shared::select_combo_complete($project_name, 'project_name', '-Project Name-');
		}
		$project_name_option=shared::set_selected($applicant['project_name'], $combo_project_name_def);
		
		$combo_project_number=shared::select_combo_complete(Project::getProjectNumberByProjectName($applicant['project_name']), 'project_number', '-Project Number-', 'project_number', $applicant['project_number']);
		$combo_project_location=shared::select_combo_complete(db::select('project_location','*'), 'project_location','-Project Location-','project_location', $applicant['project_location']);
		
		$combo_job_title=shared::select_combo_complete(db::select('job_title','*'), 'job_title','-Job Title-','job_title', $applicant['job_title']);
		$combo_position=shared::select_combo_complete(db::select('job_position','*'), 'position','-Position-','position', $applicant['position']);
		
		$combo_responsible_superior= Employee::getResponsibleSuperiorCombo($applicant);
		
		$result="<h1>Project</h1><div><table class='row'>";
		
		if (startsWith($applicant['start_date'],'1900')||!isset($applicant)||$type=='recontract') {
			$result.="<tr><td>Start Date</td><td>:</td><td>"._t2("start_date")."</td></tr>
					<tr><td>End Date</td><td>:</td><td>"._t2("end_date")."</td></tr>";
		}
		if ($type=='change_project_data') {
			$end_date=db::select_single('employee', 'coalesce(am2_end_date, contract2_end_date, am1_end_date, contract1_end_date) v','user_id=?','',array($applicant['user_id']));
			$result.="<tr><td>Start Date</td><td>:</td><td>"._t2("start_date")."</td></tr>
					<tr><td>End Date</td><td>:</td><td>".formatDate($end_date)."</td></tr>";
		}
		
		$result.="<tr><td>Project Name</td><td>:</td><td>".$project_name_option."</td></tr>
			<tr><td>Principal Advisor</td><td>:</td><td>
			<span class='principal_advisor' style='display:none'>"._lbl("principal_advisor", $applicant)."</span>
			<span class='principal_advisor_name'>"._name('principal_advisor', $applicant)."</span>
			</td></tr>
			<tr><td>Financial Controller</td><td>:</td><td>
			<span class='financial_controller' style='display:none'>"._lbl("financial_controller", $applicant)."</span>
			<span class='financial_controller_name'>"._name('financial_controller', $applicant)."</span>
			</td></tr>
			<tr><td>Project Number</td><td>:</td><td>".$combo_project_number."</td></tr>
			<tr><td>Team Leader</td><td>:</td><td><span class='team_leader' style='display:none'>"._lbl("team_leader", $applicant)."</span>
			<span class='team_leader_name'>"._name('team_leader', $applicant)."</span>
			</td></tr>
			<tr><td>Project Location</td><td>:</td><td>".$combo_project_location."</td></tr>
			<tr><td>Office Manager</td><td>:</td><td><span class='office_manager' style='display:none'>"._lbl("office_manager", $applicant)."</span>
			<span class='office_manager_name'>"._name('office_manager', $applicant)."</span>
			<tr><td>Responsible Superior</td><td>:</td><td>".$combo_responsible_superior."</td></tr>
			<tr><td>SAP No</td><td>:</td><td>"._t2("SAP_No", $applicant)."</td></tr>
			<tr><td>Job Title</td><td>:</td><td>".$combo_job_title."</td></tr>
			<tr><td>Position</td><td>:</td><td>".$combo_position."</td></tr>
			<tr><td>Salary</td><td>:</td><td>"._t2("salary", formatNumber($applicant['salary']))."</td></tr>
			<tr><td>Salary Band</td><td>:</td><td>".$salary_band_option."</td></tr>
			<tr><td>Reason</td><td>:</td><td>"._t2("reason", $applicant)."</td></tr>
			<tr><td>Working Time</td><td>:</td><td>"._t2("working_time", $applicant,"1")." %</td></tr>
			</table></div>";
		$result.=Employee::getSalarySharingView($applicant, $combo_project_name_def);
		$result.="<button class='button_link' id='btn_save_project'>Save</button>";
		
		return $result;
	}
	static function getSalarySharingView($row, $combo_project_name_def='') {
		if ($_SESSION['role_name']!='admin') {
			$result="<h2>Salary Sharing</h2>";
			$result.="<table class='tbl'><tr><th>Project Name</th><th>Project Number</th><th>Percentage</th></tr>";
			$res_salary_sharing=db::select('salary_sharing','*','contract_history_id=?','',array($row['contract_history_id']));

			foreach ($res_salary_sharing as $rs)  {
				$result.="<tr><td>"._lbl('project_name',$rs)."</td>
					<td>"._lbl('project_number',$rs)."</td>
					<td>"._lbl("percentage", $rs)." % </td></tr>";
			}
			$result.="</table>";
					
			return $result;
		}
		$result="
<div class='row'><div class='label'>Salary Sharing</div><div class='label'>".getImageTags(['add'])."</div></div>
<div class='div_salary_sharing'>";

		$res_salary_sharing=db::select('salary_sharing','*','contract_history_id=?','',array($row['contract_history_id']));
		if ($combo_project_name_def=='') {
			$project_name=Project::getProjectName();
			$combo_project_name_def=shared::select_combo_complete($project_name, 'project_name', '-Project Name-');
			
		}
		foreach ($res_salary_sharing as $rs)  {
			
			$project_name_option=shared::set_selected($rs['project_name'], $combo_project_name_def);
			$project_number_option=shared::select_combo_complete(Project::getProjectNumberByProjectName($rs['project_name']), 'project_number', '-Project Number-', 'project_number', $rs['project_number']);
			$result.="<div class='row'><div class='float100-no-padding'>".$project_name_option."</div>
				<div class='float100-no-padding'>".$project_number_option."</div>
				<div class='float100-no-padding'>"._t2("percentage", $rs,"1")." % ".getImageTags(['delete'],'SalarySharing')."</div></div>";
		}
		$result.="</div>";
		
		return $result;
	}
	static function getApplicantsSalarySharingView($row, $combo_project_name_def='') {
		$result="
			<div class='row'><div class='label'>Salary Sharing</div><div class='label'>".getImageTags(['add'])."</div></div>
			<div class='div_salary_sharing'>";

		$res_salary_sharing=db::select('applicants_salary_sharing','*','user_id=?','',array($row['user_id']));
		if ($combo_project_name_def=='') {
			$combo_project_name_def=shared::select_combo_complete($project_name, 'project_name', '-Project Name-');
			
		}
		foreach ($res_salary_sharing as $rs)  {
			
			$project_name_option=shared::set_selected($rs['project_name'], $combo_project_name_def);
			$project_number_option=shared::select_combo_complete(Project::getProjectNumberByProjectName($rs['project_name']), 'project_number', '-Project Number-', 'project_number', $rs['project_number']);
			$result.="<div class='div_project'><div class='row'><div class='float100-no-padding'>".$project_name_option."</div>
				<div class='float100-no-padding'>".$project_number_option."</div>
				<div class='float100-no-padding'>"._t2("percentage", $rs,"1")." % ".getImageTags(['delete'],'SalarySharing')."</div></div></div>";
		}
		$result.="</div>";
		
		return $result;
	}
	static function getShowTerminate($terminate_date, $applicant=null,  $type='') {
		$result="<h1>Severance Data</h1>";
		if ($applicant==null) $applicant=Employee::get_active_employee_one(" a.user_id=?", array($_SESSION['user_id']));
		
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
		$severanceData=shared::calculateSeverance($salary,  $contract1_start_date, $contract1_end_date
		, $am1_start_date, $am1_end_date
		, $contract2_start_date, $contract2_end_date
		, $am2_start_date, $am2_end_date);
		$result.="<div class='row b'><b>$first_name $last_name</b></div>";
		$result.="<div class='row b'><div class='label width140'>Salary</div><div class='label2'>".formatNumber($salary)."</div></div>";
		
		$result.="<div class='row b'><div class='label width140'>First Contract </div><div class='label2'>".formatDate($contract1_start_date)." to ".formatDate($contract1_end_date)." (".$severanceData['numDays'][0]." days)</div></div>";
		if ($am1_end_date!=null)  {
			
			$result.="<div class='row b'><div class='label width140'>First Amendment </div><div class='label2'> ".formatDate($am1_start_date).' to '.formatDate($am1_end_date)." (".$severanceData['numDays'][1]." days)</div></div>";
		}
		if ($contract2_end_date!=null)  {
			
			$result.="<div class='row b'><div class='label width140'>Extension Contract </div><div class='label2'>".formatDate($contract2_start_date).' to '.formatDate($contract2_end_date)." (".$severanceData['numDays'][2]." days)</div></div>";
		}
		if ($am2_end_date!=null)  {
			
			$result.="<div class='row b'><div class='label width140'>Second Amendment </div><div class='label2'>".formatDate($am2_start_date).' to '.formatDate($am2_end_date)." (".$severanceData['numDays'][3]." days)</div></div>";
		}
		$severance=$severanceData['severance'];
		$service=$severanceData['service'];
		$housing=$severanceData['housing'];
		$result.="<div class='row b'><div class='label width140'>Severance </div><div class='label2 severance'>".formatNumber($severance)."</div></div>";
		$result.="<div class='row b'><div class='label width140'>Service </div><div class='label2 service'>".formatNumber($service)."</div></div>";
		
		$result.="<div class='row b'><div class='label width140'>Housing </div><div class='label2 housing'>".formatNumber($housing)."</div></div>";
		$result.="<div class='row b'><div class='label width140'>Total </div><div class='label2'>".formatNumber($service+$severance+$housing)."</div></div>";
		if ($type!='recontract') {
			$result.="<button class='button_link' id='change_severance'>Change Severance</button>";
			$result.="<button class='button_link' id='terminate'>Terminate</button>";
			$result.="<div id='div_severance' style='display:none'>
			<div class='row'><div class='label'>Reason</div><div class='textbox'><textarea id='reason'></textarea></div></div>
			<div class='row'><div class='label'>Severance</div><div class='textbox'>"._t2("new_severance")."</div></div>
			<button class='button_link' id='cancel_change'>Cancel</button>
			</div>
			";
		}
		return $result;
	}
	static function getShowTerminateImmediately() {
		$result="<h1>Terminate Immediately</h1>";
		$result.=_t2("terminate_date", date('Y-m-d'));
		$result.=" <button class='button_link btn_calculate'>Calculate Severance</button>";
		$result.="<div id='div_severance_data'></div>";
		return $result;
	}
	static function terminate($severance, $service, $housing, $new_severance, $reason, $terminate_date) {
		$user_id=$_SESSION['user_id'];
		$con=db::beginTrans();
		
		$sql="insert into employee_history(user_id, contract1_start_date, contract1_end_date, am1_start_date, am1_end_date
		, contract2_start_date, contract2_end_date, am2_start_date, am2_end_date, severance, service, housing, new_severance, reason, terminate_date)
		select user_id, contract1_start_date, contract1_end_date, am1_start_date, am1_end_date
		, contract2_start_date, contract2_end_date, am2_start_date, am2_end_date, ?,?,?,?,?,? from employee where user_id=?";
		db::ExecMe($sql, array($severance, $service, $housing, $new_severance, $reason, $terminate_date, $user_id), $con);
		db::update('employee','contract_state','user_id=?', array('Terminate', $user_id), $con);
		if ($terminate_date!=null) {
			$sql="update employee set contract1_end_date=case when contract1_end_date is null then contract1_end_date else ? end
					, am1_end_date=case when am1_end_date is null then am1_end_date else ? end
					, contract2_end_date=case when contract2_end_date is null then contract2_end_date else ? end
					, am2_end_date=case when am2_end_date is null then am2_end_date else ? end
					where user_id=?";
			db::ExecMe($sql, array($terminate_date, $terminate_date, $terminate_date, $terminate_date, $user_id), $con);
			$sql="update contract_history a inner join (
				select max(end_date) end_date from contract_history where user_id=?) b on a.user_id=? and a.end_date=b.end_date
				set a.end_date=?";
			db::ExecMe($sql, array($user_id, $user_id, $terminate_date), $con);
		}
		db::commitTrans($con);
	}
	static function getComboEmployee($d=null) {
		if ($d==null) $d=date('Y-m-d');
		$res=Employee::get_active_employee_simple("contract1_start_date<=?", array($d));
		
		$combo_user="";
		$arr=array();
		foreach ($res as $row) {
			if ($combo_user!="") $combo_user.=",";
			$combo_user.="'".$row['first_name']." ".$row['last_name']."'";
			array_push($arr,array('label'=>$row['first_name']." ".$row['last_name'], 'value'=>$row['user_id']));
		}
		
		$combo_user=json_encode($arr);
		return $combo_user;
	}
	static function getEmployeeHash() {
		$res=db::select('employee','*');
		$hash=array();
		foreach ($res as $rs) {
			$hash[$rs['user_id']][$rs['title']]=$rs['first_name']." ".$rs['last_name'];
		}
		return $hash;
	}
	
	static function init_static_var() {
		if (!isset($_SESSION['employee'])) {
			$_SESSION['employee']=self::getEmployeeHash();
		}
	}
	static function getContractDataView($applicant, $severanceData) {
		$result="<h1>Contract Data</h1>
		<table>
		<tr><td>First Contract</td><td>:</td><td>"._t2('contract1_start_date', $applicant, "10","text","","Start Date")." - "._t2('contract1_end_date', $applicant, "10","text","","End Date");
		$result.="</td></tr><tr><td>First Amendment</td><td>:</td><td>";
		$result.=_t2("am1_start_date",$applicant, "10", "text", "", "Start Date")." - "._t2("am1_end_date",$applicant, "10", "text", "", "End Date");
		$result.="</td></tr><tr><td>Extension</td><td>:</td><td>";
		$result.=_t2("contract2_start_date",$applicant, "10", "text", "", "Start Date")." - "._t2("contract2_end_date",$applicant, "10", "text", "", "End Date");
		$result.="</td></tr><tr><td>Second Amendment</td><td>:</td><td>";
		$result.=_t2("am2_start_date",$applicant, "10", "text", "", "Start Date")." - "._t2("am2_end_date",$applicant, "10", "text", "", "End Date");
		$result.="</td></tr>
		<tr><td>Projected Severance</td><td>:</td><td>".formatNumber($severanceData['severance'])."
		</td></tr>
		<tr><td>Projected Service</td><td>:</td><td>".formatNumber($severanceData['service'])."
		</td></tr>
		<tr><td>Projected Housing</td><td>:</td><td>".formatNumber($severanceData['housing'])."
		</td></tr>
		</table>
		<table id='contract_graph'><thead>
		<tr><th>First Contract</th><th>Extension Contract</th></tr></thead><tbody>
		<tr><td>".Employee::get_graph($applicant['contract1_start_date'],$applicant['contract1_end_date']
						, $applicant['am1_start_date'],$applicant['am1_end_date']
						, shared::addYear($applicant['contract1_start_date'], 2))."
		</td><td>".Employee::get_graph($applicant['contract2_start_date'],$applicant['contract2_end_date']
						, $applicant['am2_start_date'],$applicant['am2_end_date']
						, shared::addYear($applicant['contract2_start_date'], 1))."
		</td>
		</tr>
		</tbody>
		</table>
		<button class='button_link' id='btn_save'>Save</button>";
		return $result;
	}
	
	static function validateEmployee($id, $d=null) {
		if ($_SESSION['role_name']=='admin') return 1;
		if ($d==null) $d=date('Y-m-d');
		if (isset($_SESSION['project_location'])) {
			$project_location=$_SESSION['project_location'];
		}
		if ($project_location=='') return 0;
		$rs=Employee::get_active_employee_simple_one('a.user_id=?', array($id));
		if ($rs==null)  return 0;
		if ($rs['start_date']>$d) return 0;
		return 1;
	}
	static function isOfficeManager() {
		if ($_SESSION['role_name']=='admin') return 0;
		unset($_SESSION['project_location']);
		
		$res=db::select('project_location', 'project_location', 'office_manager=?','', array($_SESSION['uid']));
		
		$project_location=array();
		if (count($res)>0) {
			foreach ($res as $rs) {
				array_push($project_location, $rs['project_location']);
			}
		} else {
			return 0;
		}
		
		$in_project_location= implode(',', array_fill(0, count($project_location), '?'));
		
		$count=db::select_with_count('contract_history a ', 'project_location in ('.$in_project_location.') and curdate() between a.start_date and a.end_date', $project_location);
		if ($count==0)  return 0;
		$_SESSION['project_location']=$project_location;
		$_SESSION['in_project_location']=$in_project_location;
		return 1;
	}
}
?>