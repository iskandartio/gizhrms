<?php
Class Vacancy {
	static function getCurrentVacancy() {
		$res=db::DoQuery("select a.vacancy_id, a.next_vacancy_progress_id, c.process_name, concat(b.vacancy_name, ' (', b.vacancy_code, '-', b.vacancy_code2, ')') vacancy from job_applied a
left join vacancy b on a.vacancy_id=b.vacancy_id
left join vacancy_progress c on c.vacancy_progress_id=a.next_vacancy_progress_id
where a.vacancy_shortlist=1 and ifnull(c.vacancy_progress_val,'')!='Closing'");
		return $res;
	}
	static function getAcceptEmployee() {
			$res=db::DoQuery("select distinct a.vacancy_id, a.next_vacancy_progress_id, c.process_name, concat(b.vacancy_name, ' (', b.vacancy_code, '-', b.vacancy_code2, ')') vacancy from job_applied a
left join vacancy b on a.vacancy_id=b.vacancy_id
left join vacancy_progress c on c.vacancy_progress_id=a.next_vacancy_progress_id
where a.vacancy_shortlist=1 and ifnull(c.vacancy_progress_val,'')='Closing'");
		return $res;
	}
}
?>