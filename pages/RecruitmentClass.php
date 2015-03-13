<?php
Class Recruitment {
	static function tbl($res) {
		$result="";
		$result.="<table class='tbl' id='tbl_recruitment'>
			<thead><tr><th>Vacancy ID</th><th>Vacancy Progress ID</th>
			<th>Vacancy</th><th>Vacancy Progress</th><th>#Applicants</th><th></th></tr></thead>
			<tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['vacancy_id']."</td><td>".$rs['vacancy_progress_id']."</td>
			<td>".$rs['vacancy']."</td><td>".$rs['vacancy_progress_val']."</td><td>".$rs['applicant_count']."</td>
			<td><button class='button_link btn_search'>Search</button></td></tr>";
		}
		$result.="</tbody></table>";
		return $result;
	}
	static function tbl_detail($res) {
		if (count($res)==0) return ""; 
		$combo_ranking_def=shared::select_combo_complete(db::select('ranking','*'), 'ranking_id','-Rank-','ranking_val');
		$result="";
		$result.="<input type='hidden' class='vacancy_id' value='".$res[0]['vacancy_id']."'/>";
		$result.="<input type='hidden' class='vacancy_employee_id' value='".$res[0]['vacancy_employee_id']."'/>";
		$result.="<h1>".$res[0]['vacancy']."</h1>";
		$result.="<table class='tbl' id='tbl_recruitment_detail'>";
		$result.="<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Dtl</th><th>Ranking</th><th>Comment</th><th></th></thead><tbody>";
		foreach($res as $rs) {
			$ranking_option=shared::set_selected($rs['ranking_id'],$combo_ranking_def);
			$result.="<tr><td>".$rs['user_id']."</td><td>".$rs['first_name']."</td><td>".$rs['last_name']."</td>
			<td>".getImageTags(['detail'])."</td><td>".$ranking_option."</td><td>"._t2('user_comment', $rs)."</td>
			<td>".getImageTags(['save'])."
			</tr>";
		}
		$result.="</tbody></table>";
		return $result;
	}
}
?>