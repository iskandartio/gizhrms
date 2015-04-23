<?php
	if ($type=='load') {
		if ($tbl=='user') {
			$res=db::select('m_user','*','','user_name');
			$result="";
			$result.="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>User Name</th><th>Active</th></tr></thead><tbody>";
				
			foreach ($res as $rs) {
				$result.="<tr><td>".$rs['user_id']."</td><td>".$rs['user_name']."</td>";
				$result.="<td>".shared::create_checkbox('status_id','',$rs['status_id'])."</td></tr>";
				
			}
			$result.="</tbody></table>";
		} else if ($tbl=='role') {
			$res=db::select('m_role','*','','role_name');
			$result="";
			$result.="<button class='button_link' id='btn_add'>Add</button>";
			$result.="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>Role Name</th><th>Role Description</th><th>Active</th><th></th></tr></thead><tbody>";
				
			foreach ($res as $rs) {
				$result.="<tr><td>".$rs['role_id']."</td><td>".$rs['role_name']."</td><td>".$rs['role_description']."</td>";
				$result.="<td><span style='display:none'>".$rs['status_id']."</span>".($rs['status_id']==0 ? "Not Active" : "Active")."</td>";
				$result.="<td>".getImageTags(['edit','delete'])."</td></tr>";
				
			}
			$result.="</tbody></table>";
			$adder="<tr><td></td><td>"._t2("role_name","","10")."</td><td>"._t2("role_description","","30")."</td>";
			$adder.="<td>".shared::create_checkbox('status_id', 'Active')."</td><td>".getImageTags(['save','delete'])."</td></tr>";
		} else if ($tbl=='category') {
			$res=db::select('m_category','*','','sort_id,category_name');
			$result="";
			$result.="<button class='button_link' id='btn_add'>Add</button>";
			$result.="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>Category Name</th><th></th></tr></thead><tbody>";
				
			foreach ($res as $rs) {
				$result.="<tr><td>".$rs['category_id']."</td><td>".$rs['category_name']."</td>";
				$result.="<td>".getImageTags(['edit','delete','up','down'])."</td></tr>";
				
			}
			$result.="</tbody></table>";
			$adder="<tr><td></td><td>"._t2("category_name","","10")."</td><td>".getImageTags(['save','delete'])."</td></tr>";
		} else if ($tbl=='module') {
			$res=db::select('m_module a left join m_category b on a.category_id=b.category_id','a.*, b.category_name','','b.sort_id, a.sort_id, a.module_name');
			$result="";
			$result.="<button class='button_link' id='btn_add'>Add</button>";
			$result.="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>Module Name</th><th>Module Description</th><th>Sub Module</th><th>Category</th><th>Active</th><th></th></tr></thead><tbody>";
			$category_choice=shared::select_combo_complete(db::select('m_category','*','','sort_id'), 'category_id','-Category-','category_name');
			foreach ($res as $rs) {
				$result.="<tr><td>".$rs['module_id']."</td><td>".$rs['module_name']."</td><td>".$rs['module_description']."</td><td>".$rs['sub_module']."</td>";
				$result.="<td><span style='display:none'>".$rs['category_id']."</span>".$rs['category_name']."</td>";
				$result.="<td><span style='display:none'>".$rs['status_id']."</span>".($rs['status_id']==0 ? "Not Active" : "Active")."</td>";
				$result.="<td>".getImageTags(['edit','delete','up','down'])."</td></tr>";
				
			}
			$result.="</tbody></table>";
			$adder="<tr><td></td><td>"._t2("module_name","","20")."</td><td>"._t2("module_description","","25")."</td><td>"._t2("sub_module","","30")."</td><td>".$category_choice."</td>";
			$adder.="<td>".shared::create_checkbox('status_id', 'Active')."</td><td>".getImageTags(['save','delete'])."</td></tr>";
			$data['category_choice']=$category_choice;
		} else if ($tbl=='user_role') {
			$result="";
			$result.="<div id='div_user_role_all'>Employee Name : "._t2("user_name")."<div id='div_user_role'></div></div>";
			$data['employee_choice']=Employee::getComboEmployee(null,  "b.user_id is not null");
			$result.="<p>Role Name : ".shared::select_combo_complete(db::select('m_role','*','status_id=1','role_name'), 'role_id', '-Role-','role_name')."</p>";
			
			$result.="<div id='div_role_user'></div>";
			$adder="<tr><td></td><td>"._t2('employee')."</td><td>".getImageTags(['save','delete'])."</td></tr>";
		} else if ($tbl=='role_module') {
			$result="";
			$role_choice=shared::select_combo_complete(db::select('m_role','*','status_id=1','role_name'), 'role_id', '-Role-','role_name');
			$module_choice=shared::select_combo_complete(db::select('m_module','*','status_id=1','module_description'), 'module_id', '-Module-','module_description');
			
			$result.="<div id='div_role_module_all'>Role Name : ".$role_choice."<div id='div_role_module'></div></div>";
			$result.="<p><div id='div_module_role_all'>Module Name : ".$module_choice."<div id='div_module_role'></div></div></p>";

		}
		$data['result']=$result;
		if (isset($adder)) $data['adder']=$adder;
		die(json_encode($data));
	}
	if ($type=='save_user_active') {
		db::updateShort('m_user', 'user_id', $_POST);
		die;
	}
	if ($type=='delete') {
		if ($tbl=='role') {
			db::delete('m_role','role_id=?', array($role_id));
		} else if ($tbl=='module') {
			db::delete('m_module','module_id=?', array($module_id));
		} else if ($tbl=='category') {
			db::delete('m_category','category_id=?', array($category_id));
		} else if ($tbl=='user_role') {
			db::delete('m_user_role', 'user_id=? and role_id=?', array($user_id, $role_id));
		} else if ($tbl=='role_module') {
			db::delete('m_role_module', 'module_id=? and role_id=?', array($module_id, $role_id));
		}
	}
	if ($type=='save') {
		if ($tbl=='role') {
			if ($role_id=="") {
				$role_id=db::insert('m_role','role_name, role_description, status_id', array($role_name, $role_description, $status_id));
			} else {
				db::update('m_role','role_name, role_description, status_id', 'role_id=?', array($role_name, $role_description, $status_id, $role_id));
			}
			die($role_id);
		} else if ($tbl=='module') {
			if ($module_id=="") {
				$con=db::beginTrans();
				$sort_id=db::select_single('m_module', 'ifnull(max(sort_id),0)+1 v','','',array(), $con);
				$module_id=db::insert('m_module','module_name, module_description, sub_module, category_id, status_id,sort_id', array($module_name, $module_description, $sub_module, $category_id, $status_id, $sort_id), $con);
				db::commitTrans($con);
			} else {
				db::update('m_module','module_name, module_description, sub_module, category_id, status_id', 'module_id=?', array($module_name, $module_description, $sub_module, $category_id, $status_id, $module_id));
			}
			die($module_id);
		} else if ($tbl=='category') {
			
			if ($category_id=="") {
				$con=db::beginTrans();
				$sort_id=db::select_single('m_category', 'ifnull(max(sort_id),0)+1 v','','',array(), $con);
				$category_id=db::insert('m_category','category_name, sort_id', array($category_name, $sort_id), $con);
				db::commitTrans($con);
			} else {
				db::update('m_category','category_name', 'category_id=?', array($category_name, $category_id));
			}
			die($category_id);
		} else if ($tbl=='user_role') {
			$res=db::select('m_user_role', '*','role_id=? and user_id=? and user_id!=?','', array($role_id, $employee, $user_id));
			if (count($res)>0) die ("Error : User Already Exists");
			if ($user_id=="") {
				$user_id=db::insert('m_user_role','user_id, role_id', array($employee, $role_id));
			} else {
				db::update('m_user_role','role_id', 'user_id=?', array($role_id, $user_id));
			}
			die($user_id);
		}
	}
	if ($type=='load_user_role'){
		$sql="select a.*, b.user_id from m_role a left join m_user_role b on a.role_id=b.role_id and b.user_id=? order by b.user_id desc, a.role_name";
		$res=db::DoQuery($sql, array($user_id));
		$result="";
		foreach ($res as $rs) {
			$result.=shared::create_checkbox('role_id', $rs['role_description'], ($rs['user_id']==null ? 0 : 1), $rs['role_id'])."<br>";
		}
		$result.="<button class='button_link' id='btn_save'>Save</button>";
		
		die($result);
	}
	if ($type=='load_role_module'){
		if ($role_id=="") die;
		$sql="select a.*, b.role_id, c.category_name from m_module a 
			left join m_role_module b on a.module_id=b.module_id and b.role_id=? 
			left join m_category c on c.category_id=a.category_id
			order by c.sort_id, a.sort_id, a.module_name";
		$res=db::DoQuery($sql, array($role_id));
		$result="";
		$last=-1;
		if (count($res)>0) {
			$result.="<p><table class='tbl'><tr>";
			$temp="";
			$th="";
			foreach ($res as $rs) {
				if ($last!=$rs['category_id']) {
					$temp.="</td><td style='vertical-align:top!important'>";
					$th.="</th><th>".$rs['category_name'];
					$last=$rs['category_id'];
				}
				
				$temp.=shared::create_checkbox('module_id', $rs['module_description'], ($rs['role_id']==null ? 0 : 1), $rs['module_id'])."<br>";
			}
			if ($temp!="") {
				$temp=substr($temp, 5)."</td>";
				$th=substr($th, 5)."</td></tr><tr>";
			}
			$result.=$th.$temp."</tr></table>";
		}
		$result.="<button class='button_link' id='btn_save'>Save</button></p>";
		
		die($result);
	}
	if ($type=='load_module_role'){
		if ($module_id=="") die;
		$sql="select a.*, b.module_id from m_role a left join m_role_module b on a.role_id=b.role_id and b.module_id=? order by b.role_id desc, a.role_name";

		$res=db::DoQuery($sql, array($module_id));
		$result="";
		foreach ($res as $rs) {
			$result.=shared::create_checkbox('role_id', $rs['role_description'], ($rs['module_id']==null ? 0 : 1), $rs['role_id'])."<br>";
		}
		$result.="<button class='button_link' id='btn_save'>Save</button>";
		
		die($result);
	}
	if ($type=='save_user_role') {
		$con=db::beginTrans();
		db::delete('m_user_role','user_id=?', array($user_id), $con);
		if (isset($role_id)) {
			foreach ($role_id as $val) {
				db::insert('m_user_role','user_id, role_id', array($user_id, $val), $con);
			}
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='save_role_module') {
		
		$con=db::beginTrans();
		db::delete('m_role_module','role_id=?', array($role_id), $con);
		if (isset($module_id)) {
			foreach ($module_id as $val) {
				db::insert('m_role_module','module_id, role_id', array($val, $role_id), $con);
			}
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='save_module_role') {
		
		$con=db::beginTrans();
		db::delete('m_role_module','module_id=?', array($module_id), $con);
		
		if (isset($role_id)) {
			foreach ($role_id as $val) {
				db::insert('m_role_module','module_id, role_id', array($module_id, $val), $con);
				
			}
		}
		db::commitTrans($con);
		die;
	}
	if ($type=='load_role_user'){
		$sql="select a.*, b.first_name, b.last_name from m_user_role a left join employee b on a.user_id=b.user_id
			where role_id=? order by b.first_name, b.last_name";
		$res=db::DoQuery($sql, array($role_id));
		$result="";
		$result.="<button class='button_link' id='btn_add'>Add</button>";
		$result.="<table class='tbl' id='tbl_result'><thead><tr><th></th><th>User Name</th><th></th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>".$rs['user_id']."</td><td><span class='employee hidden'>".$rs['user_id']."</span>
				<span class='employee_name'>".$rs['first_name']." ".$rs['last_name']."</span></td><td>".getImageTags(['edit','delete'])."</td></tr>";
		}
		$result.="</tbody></table>";
		$result.="<button class='button_link' id='btn_save'>Save</button>";
		
		die($result);
	}
	if ($type=='up') {
		$con=db::beginTrans();
		$table="m_".$tbl;
		
		$sort_id=db::select_single($table, 'sort_id v', $tbl.'_id=?','', array($id), $con);
		$sort_id2=db::select_single($table, 'sort_id v', $tbl.'_id=?','', array($id2), $con);
		db::update($table,'sort_id',$tbl.'_id=?', array($sort_id, $id2), $con);
		db::update($table,'sort_id',$tbl.'_id=?', array($sort_id2, $id), $con);
		db::commitTrans($con);
		die;
	}
	if ($type=='down') {
		$con=db::beginTrans();
		$table="m_".$tbl;
		$sort_id=db::select_single($table, 'sort_id v', $tbl.'_id=?','', array($id), $con);
		$row=db::select_one($table,$tbl.'_id, sort_id', 'sort_id>?','sort_id desc', array($sort_id), $con);
		if ($row) {
			db::update($table,'sort_id',$tbl.'_id=?', array($sort_id, $row[$tbl.'_id']), $con);
			db::update($table,'sort_id',$tbl.'_id=?', array($row['sort_id'], $id), $con);
		}
		db::commitTrans($con);
		die;
	}
?>