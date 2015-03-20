<?php

Class Project {

	static function project_name_td($rs=array()) {
		$s="<tr><td>"._lbl('project_name_id',$rs)."</td><td>"._lbl('project_name',$rs)."</td>";
		$s.="<td><span class='principal_advisor hidden'>"._lbl('principal_advisor',$rs)."</span>";
		$s.="<span class='principal_advisor_name'>"._lbl('principal_advisor_name',$rs)."</span></td>";
		$s.="<td><span class='financial_controller hidden'>"._lbl('financial_controller',$rs)."</span>";
		$s.="<span class='financial_controller_name'>"._lbl('financial_controller_name', $rs)."</span>";
		$s.="</td><td>".getImageTags(['edit','delete'])."</td></tr>";
		
		return $s;
	}
	static function project_number_td($rs=array()) {
		$s="<tr><td>"._lbl('project_number_id',$rs)."</td><td>"._lbl('project_number',$rs)."</td>";
		$s.="<td><span class='team_leader hidden'>"._lbl('team_leader',$rs)."</span>";
		$s.="<span class='team_leader_name'>"._lbl('team_leader_name',$rs)."</span></td>";
		$s.="<td>"._lbl('project_name', $rs)."</td>";
		$s.="<td>".getImageTags(['edit','delete'],'ProjectNumber')."</td></tr>";
		return $s;
	}
	static function getProjectNumber() {
		$project_number= db::select('project_number','*');
		foreach ($project_number as $key=>$val) {
			$project_number[$key]['team_leader_name']= _name('team_leader', $val);
		}
		return $project_number;
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
		foreach ($project_name as $key=>$val) {
			$project_name[$key]['principal_advisor_name']= _name('principal_advisor', $val);
			$project_name[$key]['financial_controller_name']= _name('financial_controller', $val);
		}
		
		return $project_name;
	}
	
	
	static function getProjectNumberTable($res) {
		$result="";
		$result.="
		<button class='button_link' id='add_project_number'>Add Project Number</button><br>
		<table class='tbl' id='tbl_project_number'>
		<thead><tr><th>ID</th><th>Project Number</th><th>Team Leader</th><th>Project Name</th><th></th></tr></thead><tbody>";
		
		foreach ($res as $rs) {
			$result.=Project::project_number_td($rs);
		}
		$result.="</tbody></table>";
		return $result;
	}
}
?>