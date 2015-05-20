<?php
	shared::prepOM(isset($om) ? 1 : 0);
	shared::prepPA(isset($pa) ? 1 : 0);
	
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
		if ($project_name!='') {
			$filter.=" and c.project_name=?";
			array_push($arr, $project_name);
		}
		if ($filter!='') $filter=substr($filter,5);
		$res=Employee::get_active_employee($filter, $arr);
		shared::setId('employee_user_id', 'user_id', $res);
		$result="";
		if (!isset($pa)) {
			$result.="<button id='btn_add' class='button_link'>Add New Employee</button>";
		}
		$result.="<script src='js/excellentexport.js'></script>";
		$result.=shared::setDataTable($res, ['project_name','project_number','project_location'
			,'first_name','last_name','gender','job_title','phone1','phone2','user_name','current_start_date','current_end_date','salary_band']);
		$result.=" <a download='employee_raw_data.csv' id='btn_export_data' class='button_link' onclick=\"return ExcellentExport.csv(this, 'data_table');\">Export to Excel</a>";
		$result.="<table id='tbl_employee' class='tbl'>
		<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Project Name</th><th>Project Location</th><th></th></tr></thead><tbody>";
		foreach ($res as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$id</td><td>$first_name</td><td>$last_name</td><td>$project_name</td><td>$project_location</td>
			<td>";
			if (!isset($pa)) {
				$result.="<button class='btn_edit_project'>Edit Data</button>";
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
	
	
?>