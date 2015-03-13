<?php
Class Project {

	static function project_name_td($rs=array()) {
		$s="<tr><td>"._lbl('project_name_id',$rs)."</td><td>"._lbl('project_name',$rs)."</td><td>"._lbl('team_leader',$rs)."</td><td>".getImageTags(['edit','delete'])."</td></tr>";
		return $s;
	}
	static function project_number_td($rs=array()) {
		$s="<tr><td>"._lbl('project_number_id',$rs)."</td><td>"._lbl('project_number',$rs)."</td><td>"._lbl('principle_advisor',$rs)."</td>";
		$s.="<td>"._lbl('project_name', $rs)."</td>";
		$s.="<td>".getImageTags(['edit','delete'],'ProjectNumber')."</td></tr>";
		return $s;
	}
	static function getProjectNumber() {
		return db::select('project_number','*');
	}
	static function getProjectNumberByProjectName($project_name) {
		return db::select('project_number','*','project_name=?','',array($project_name));
	}
	static function getProjectNameByName($project_name) {
		return db::select('project_name','*','project_name=?','',array($project_name));
	}
	static function getProjectNumberByName($project_number) {
		return db::select('project_number','*','project_number=?','',array($project_number));
	}
	static function getProjectName() {
		$project_name= db::select('project_name','*');
		return $project_name;
	}
	
	static function getProjectNumberTable($res) {
		$result="
		<button class='button_link' id='add_project_number'>Add Project Number</button><br>
		<table class='tbl' id='tbl_project_number'>
		<thead><tr><th>ID</th><th>Project Number</th><th>Principle Advisor</th><th>Project Name</th><th></th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.=Project::project_number_td($rs);
		}
		$result.="</tbody></table>";
		return $result;
	}
}
?>