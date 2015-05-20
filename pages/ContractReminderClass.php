<?php
class ContractReminder {
	static function getData() {
		$res=db::DoQuery("select a.user_id, c.job_title, a.end_date, d.team_leader, c.project_name, c.project_number from (
select user_id, max(end_date) end_date from contract_history a
left join settings b on b.setting_name='Contract Reminder'
where DATE_ADD(curdate(),INTERVAL b.setting_val DAY)>=end_date and contract_reminder_email is null
group by user_id) a
left join contract_history c on c.user_id=a.user_id and c.end_date=a.end_date
left join project_number d on d.project_number=c.project_number
");
		return $res;
	}
	static function forAdmin($res,  $params)  {
		$list="<table border=1 cellpadding=3 cellspacing=0>";
		$list.="<tr><th>Name</th><th>Job Title</th><th>End Date</th></tr>";
		foreach ($res as $rs) {
			$list.="<tr><td>"._t_name($rs['user_id'])."</td><td>".$rs['job_title']."</td><td>".formatDate($rs['end_date'])."</td></tr>";
		}
		$list.="</table>";
		
		$res=db::DoQuery("select c.user_name from m_role a
			inner join m_user_role b on a.role_id=b.role_id and a.role_name='admin'
			inner join m_user c on c.user_id=b.user_id");
		$admins=array();
		foreach ($res as $rs) {
			array_push($admins, $rs['user_name']);
		}
		$params['admin']=implode(";",$admins);
		$params['list']=$list;
		
		shared::email("contract_reminder", $params);
	}

	static function forTeamLeader($resAll, $params)  {
		$res=array();
		foreach ($resAll as $rs) {
			shared::setArr($res[$rs['project_name']][$rs['project_number']][$rs['team_leader']], $rs);
		}
		
		$list_def="<table border=1 cellpadding=3 cellspacing=0>";
		$list_def.="<tr><th>Name</th><th>Job Title</th><th>End Date</th></tr>";
		
		foreach ($res as $project_name=>$val_project_name) {
			foreach ($val_project_name as $project_number=>$val_project_number) {
				foreach ($val_project_number as $team_leader=>$val_team_leader) {
					$list=$list_def;
					foreach ($val_team_leader as $rs) {
						$list.="<tr><td>"._t_name($rs['user_id'])."</td><td>".$rs['job_title']."</td><td>".formatDate($rs['end_date'])."</td></tr>";
					}
					$list.="</table>";
					//@team_leader_email, @team_leader_name, @project_name, @project_number, @list, @signature, @days
					$team_leader_email=db::select_single("m_user", 'user_name v', 'user_id=?','', array($team_leader));
					$team_leader_name=_t_name($team_leader);
					$params['team_leader_email']=$team_leader_email;
					$params['team_leader_name']=$team_leader_name;
					$params['project_name']=$project_name;
					$params['project_number']=$project_number;
					$params['list']=$list;
					
					shared::email("contract_reminder_team_leader", $params);	
				}
			}
		}
		
	}
	static function forEmployee($res, $params)  {
		//@employee_email, @name, @end, @signature, @days
		
		foreach ($res as $rs) {
			$params['employee_email']=db::select_single("m_user", 'user_name v', 'user_id=?','', array($rs['user_id']));
			$params['name']=_t_name($rs['user_id']);
			$params['end']=formatDate($rs['end_date']);
			
			shared::email("contract_reminder_employee", $params);	
		}
		
	}

}
?>