<?php
if ($type=='load') {
	$user_id=$_SESSION['user_id'];
	$language_choice=language::getChoice();
	$language_skill_choice=shared::select_combo_complete(language_skill::getAll(), 'language_skill_id','-Skill-','language_skill_val');
	$language=db::select('applicants_language a
		left join language b on a.language_id=b.language_id
		left join language_skill c on c.language_skill_id=a.language_skill_id'
		,'ifnull(a.language_val, b.language_val) language_val, a.language_id, a.language_skill_id, c.language_skill_val, a.applicants_language_id'
		,'user_id=?','language_val', array($user_id));
	$result="";
	$result.="<script src='js/language.js'></script>";
	$result.="<button id='btn_add_language' class='button_link'>Add</button>
	<table class='tbl' id='tbl_language'>
	<thead>
	<tr><th>ID<th>Language</th><th>Skill Level</th><th></th></tr>
	</thead>
	<tbody>";
	foreach($language as $row) {
		$result.='<tr><td>'.$row['applicants_language_id'].'</td>';
		$result.='<td><span style="display:none">'.$row['language_id'].'</span> '.$row['language_val'].'</td>';
		$result.='<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>';
		$result.="<td>".getImageTags(array('edit','delete'))."</td>";
		$result.="</tr>";
		
	}
	$result.="</tbody>	</table>";
	$data['result']=$result;
	$data['language_choice']=$language_choice;
	$data['language_skill_choice']=$language_skill_choice;
	die(json_encode($data));

}
if ($type=='save') {
	$language_skill_id=db::select_single('language_skill','language_skill_id v','language_skill_id=?','', array($language_skill_id));
	if ($applicants_language_id=='') {
		if ($language_skill_id!=null) {
			$applicants_language_id=db::insert('applicants_language','user_id, language_id, language_skill_id', array($_SESSION['uid'], $language_id, $language_skill_id));
		}
	} else {
		if ($language_skill_id==null) {
			db::delete('applicants_language','applicants_language_id=?', array($applicants_language_id));
		} else {
			db::update('applicants_language','language_id, language_skill_id', 'applicants_language_id=?', array($language_id, $language_skill_id, $applicants_language_id));
		}
	}
	die($applicants_language_id);
}
if ($type=='save_other') {
	if ($applicants_other_language_id=='') {
		$applicants_other_language_id=db::insert('applicants_other_language','user_id, language_val, language_skill_id', array($_SESSION['uid'], $language_val, $language_skill_id));
	} else {
		db::update('applicants_other_language','language_val, language_skill_id', 'applicants_other_language_id=?', array($language_val, $language_skill_id, $applicants_other_language_id));
	}
	die($applicants_other_language_id);
}
if ($type=='delete') {
	db::delete('applicants_language','applicants_language_id=?',array($applicants_language_id));
	die;
}
if ($type=='delete_other') {
	db::delete('applicants_other_language','applicants_other_language_id=?',array($applicants_other_language_id));
	die;
}

?>