<?php
require "pages/startup.php";
	if ($type=='search') {
		$_SESSION['filter_first_name']=$first_name;
		$_SESSION['filter_last_name']=$last_name;
		$filter="1=1";
		$arr=array();
		if ($first_name!='') {
			$filter.=" and a.first_name like ?";
			array_push($arr, "%$first_name%");
		}
		if ($last_name!='') {
			$filter.=" and a.last_name like ?";
			array_push($arr, "%$last_name%");
		}
		$res=db::select('applicants a left join contract_history b on a.user_id=b.user_id and now() between b.start_date and b.end_date'
		,'a.user_id, a.first_name, a.last_name, b.project_name, b.project_location',$filter, 'a.first_name, a.last_name', $arr);
		$result="<table class='tbl'><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Project Name</th><th>Project Location</th><th></th></tr>";
		foreach ($res as $row) {
			foreach ($row as $key=>$val) {
				$$key=$val;
			}
			$result.="<tr><td>$user_id</td><td>$first_name</td><td>$last_name</td><td>$project_name</td><td>$project_location</td>
			<td>".getImageTags(array('edit'))."</td>
			</tr>";
		}
		$result.="</table>";
		die($result);
	}
	if ($type=='set_edit_id') {
		$_SESSION['edit_id']=$edit_id;
		die($_SESSION['edit_id']);
		
	}
	if ($type=='save_current_contract') {

	
		db::updateEasy('contract_history',$_POST);
		die;
	}
	if ($type=='save_contract_detail') {
		db::updateEasy('applicants',$_POST);
		$applicant=db::select_one('applicants a
	left join contract_history b on a.user_id=b.user_id and now() between b.start_date and b.end_date'
	,'*, (datediff(contract0_end_date, contract0_start_date)+1)/365+ 
	ifnull((datediff(contract1_end_date, contract1_start_date)+1)/365,0)+
	ifnull((datediff(contract2_end_date, contract2_start_date)+1)/365,0) count_years','a.user_id=?','', array($_SESSION['edit_id']));
		$count_year=$applicant['count_years'];
		$service=0;
		if ($count_year<1) {
			$severance=$applicant['salary'];
		} else if ($count_year<2) {
			$severance=2*$applicant['salary'];
		} else if ($count_year<3) {
			$severance=3*$applicant['salary'];
		} else {
			$severance=4*$applicant['salary'];
			$service=2*$applicant['salary']+0.15*$severance;
			
		}
		$data['severance']=formatNumber($severance);
		$data['service']=formatNumber($service);
		
		die(json_encode($data));
	}
?>