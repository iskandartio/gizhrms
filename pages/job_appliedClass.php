<?php
Class job_applied {
	static function get_accepted($contract_history_id) {
		$res=db::DoQuery("select concat(a.first_name,' ',a.last_name) name, a.address, b.* from employee a
		left join contract_history b on b.user_id=a.user_id
		where b.contract_history_id=?", array($contract_history_id));
		if (count($res)>0) return $res[0];
		return null;
	}

	
}
?>