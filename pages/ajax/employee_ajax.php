<?php
	shared::prepOM(isset($om) ? 1 : 0);
	if ($type=='search') {
		$_SESSION['filter_first_name']=$first_name;
		$_SESSION['filter_last_name']=$last_name;
		$filter="";
		$arr=array();
		if ($first_name!='') {
			$filter.=" and a.first_name like ?";
			array_push($arr, "%$first_name%");
		}
		if ($last_name!='') {
			$filter.=" and a.last_name like ?";
			array_push($arr, "%$last_name%");
		}
		if ($filter!='') $filter=substr($filter,5);
		$res=Employee::get_active_employee($filter, $arr);
		shared::setId('employee_user_id', 'user_id', $res);
		$result="<table id='tbl_employee' class='tbl'>
		<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Project Name</th><th>Project Location</th><th></th></tr></thead><tbody>";
		foreach ($res as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$id</td><td>$first_name</td><td>$last_name</td><td>$project_name</td><td>$project_location</td>
			<td><button class='btn_edit_project'>Edit Data</button>";
			if (!isset($om)) {
				$result.="<button class='btn_update'>Change Project Data</button> 
				<button class='btn_terminate'>Terminate Immediately</button> ";
			}
			$result.="</td>
			</tr>";
		}
		$result.="</tbody></table>";
		die($result);
	}
	if ($type=='set_user_id') {
		$user_id=shared::getId('employee_user_id', $user_id);
		$_SESSION['user_id']=$user_id;
		die($_SESSION['user_id']);	
	}
	

	if ($type=='show_terminate_immediately') {
		$_SESSION['user_id']=$user_id;
		$result=Employee::getShowTerminateImmediately();
		$result.="<script src='js/terminate_immediately.js'></script>";
		die($result);
	}
	if ($type=='calculate_severance') {
		$result=Employee::getShowTerminate($terminate_date);
		die($result);
	}



	
	if ($type=='terminate') {
		if (!isset($terminate_date)) $terminate_date=null;
		Employee::terminate($severance, $service, $housing, $new_severance, $reason, $terminate_date);
		die;
	}	
?>