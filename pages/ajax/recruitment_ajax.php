<?php
	if ($type=='getAll') {
		$res=VacancyEmployee::byEmployeeId($_SESSION['uid']);
		$result=Recruitment::tbl($res);
		die($result);
	}
	if ($type=='search') {
		$filter='a.vacancy_id=? and a.vacancy_progress_id=? and a.employee_id=?';
		$params=array($vacancy_id, $vacancy_progress_id, $_SESSION['uid']);
		$res=VacancyEmployee::search($filter, $params);
		$res_ranking=VacancyEmployee::getUserRankingByVacancyProgress($vacancy_id, $vacancy_progress_id);
		$result=Recruitment::tbl_detail($res, $res_ranking);
		die($result);
	}
	if ($type=='save') {
		$i=db::update('user_ranking','ranking_id, user_comment','user_id=? and vacancy_employee_id=?', array($ranking_id, $user_comment, $user_id, $vacancy_employee_id));
		if ($i==0) {
			db::insert('user_ranking','ranking_id, user_comment, user_id, vacancy_employee_id', array($ranking_id, $user_comment, $user_id, $vacancy_employee_id));
		}
		die;
	}
	if ($type=='show_detail') {
		require_once("pages/ajax/filter_applicant_ajax.php");
	}
?>