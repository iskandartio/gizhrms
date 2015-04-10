<?php
Class VacancyEmployee {
	static function byEmployeeId($employee_id) {
		$res=db::DoQuery("select a.vacancy_id, a.vacancy_progress_id, concat(c.vacancy_name,' (',c.vacancy_code,'-',c.vacancy_code2,')') vacancy
, d.vacancy_progress_val, count(*) applicant_count  from vacancy_employee a
left join job_applied b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.next_vacancy_progress_id
inner join vacancy c on c.vacancy_id=a.vacancy_id 
left join vacancy_progress d on ifnull(a.vacancy_progress_id,0)=d.vacancy_progress_id  
 where a.employee_id=? and b.vacancy_shortlist=1 group by 
 a.vacancy_id, a.vacancy_progress_id, concat(c.vacancy_name,' (',c.vacancy_code,'-',c.vacancy_code2,')')
, d.vacancy_progress_val", array($employee_id));
		return $res;
	}
	static function getUserRankingByVacancyProgress($vacancy_id, $vacancy_progress_id) {
		$res=db::DoQuery("select a.*, b.employee_id from user_ranking a
left join vacancy_employee b on a.vacancy_employee_id=b.vacancy_employee_id 
where b.vacancy_id =? and b.vacancy_progress_id =?", array($vacancy_id, $vacancy_progress_id));
		return $res;
	}
	static function search($filter, $params) {
		$res=db::DoQuery("select a.vacancy_id, a.vacancy_employee_id, concat(f.vacancy_name,' (',f.vacancy_code,'-',f.vacancy_code2,')') vacancy
,b.user_id, c.first_name, c.last_name, d.ranking_id, e.ranking_val, d.user_comment from vacancy_employee a
left join job_applied b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.next_vacancy_progress_id
left join applicants c on c.user_id=b.user_id
left join user_ranking d on d.vacancy_employee_id=a.vacancy_employee_id and d.user_id=b.user_id
left join ranking e on e.ranking_id=d.ranking_id
inner join vacancy f on f.vacancy_id=a.vacancy_id 
 where $filter and b.vacancy_shortlist=1", $params);
		return $res;
	}
}
?>