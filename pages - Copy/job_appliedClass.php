<?php
Class job_applied {
	static function get_accepted($contract_history_id, $role_name) {
		$res=db::DoQuery("select concat(d.first_name,' ',d.last_name) name, d.address, e.vacancy_type, e.allowance, c.* from job_applied a
		left join vacancy_progress b on a.vacancy_progress_id=b.vacancy_progress_id
		left join applicants d on d.user_id=a.user_id 
		left join contract_history c on c.user_id=a.user_id ".shared::joinContractHistory('c','d')."
		left join vacancy e on e.vacancy_id=a.vacancy_id
		where vacancy_progress_val='Closing' and c.contract_history_id=? and 'admin'=?", array($contract_history_id, $role_name));
		if (count($res)>0) return $res[0];
		return null;
	}

	
}
?>