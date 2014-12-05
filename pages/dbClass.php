<?php
class db {
	static function Connect($db_str='db') {
		$db=$_SESSION[$db_str];
		$db_driver=$db[0];
		$db_uid=$db[1];
		$db_pwd=$db[2];
		return new PDO($db_driver, $db_uid, $db_pwd);
	}
	
	
	
	static function DoQuery($query, $params=array(), $con=null) {
		if (!isset($con)) $con= db::Connect();
		$res=$con->prepare($query);
		$res->execute($params);
		$result= $res->fetchAll(PDO::FETCH_ASSOC);
		foreach ($result as $k=>$row) {
			foreach ($row as $key=>$value) {
				$result[$k][$key]=shared::sanitize($row[$key]);
			}
		}
		return $result;
	}
	
	static function DoQueryOne($query, $params=array(), $con=null) {
		$res=db::DoQuery($query, $params, $con);
		if (count($res)>0) {
			return $res[0];
		} 
		return null;
	}
	static function DoQuerySingle($query, $params=array(), $con=null) {
		$res=db::DoQueryOne($query, $params, $con);
		return $res['v']; 
	}
	
	static function Log($logs) {
		if (is_array($logs)) {
			foreach ($logs as $log) {
				if (!isset($log)) $log='null';
				file_put_contents("log.txt", $log."\n", FILE_APPEND | LOCK_EX);
			}	
		} else {
			file_put_contents("log.txt", $logs."\n", FILE_APPEND | LOCK_EX);
		}
		
	}
	static function execMeDebug($query, $params=array(), $con=null) {
		if (!isset($con)) $con= db::Connect();
	 	foreach ($params as &$v) { 
			if (isset($v)) {
				$v = str_replace("'","''",$v);
				$v="'$v'";
			} else {
				$v="null";
			}
		} 
	    $query = vsprintf(str_replace("?","%s",$query), $params );
		$res = $con->exec($query);
		
		if (substr($query,0,6)=='insert') {
			return $con->lastInsertId();
		}
		return $res->rowCount();
	}
	static function ExecMe($query, $params=array(), $con=null) {
		if (!isset($con)) $con= db::Connect();
	 	$res=$con->prepare($query);
		$res->execute($params);
		
		if (substr($query,0,6)=='insert') {
			return $con->lastInsertId();
		}
		return $res->rowCount();
	}

	
	static function select($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		if($order!='') $order="order by $order";
		$s="select $fields from $tbl $where $order";
		return db::DoQuery($s, $params, $con);
	}
	
	static function select_with_count($tbl, $where='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		$s="select count(*) c from $tbl $where";
		$rs=db::DoQuery($s, $params, $con);
		
		return $rs[0]['c'];
	}
	static function select_one($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		if($order!='') $order="order by $order";
		$s="select $fields from $tbl $where $order";
		$res = db::DoQuery($s, $params, $con);	
		if (count($res)>0) return $res[0]; else return null;
	}
	
	static function select_single($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		$res = db::select_one($tbl, $fields, $where, $order, $params, $con);
		if (isset($res['v'])) return $res['v']; else return null;
	}
	
	static function insert($tbl, $fields, $params=array(), $con=null) {
		$s="insert into $tbl($fields) values(".substr(str_repeat(',?', count($params)),1).")";
		return db::ExecMe($s, $params, $con);
	}
	static function insertEasy($tbl, $post, $con=null) {
		
		$fields="";
		$count=0;
		$params=array();
		foreach($post as $key=>$value) {
			if (is_array($post[$key])) {
				continue;
			}
			if ($key=='type') {
				continue;
			}
			if ($key==$tbl.'_id') {
				continue;
			}
			$fields.=",".$key;
			$count++;
			if ($value=='') {
				array_push($params, null);
			} else {
			array_push($params, $value);
			}
		}
		$fields=substr($fields,1);
		$s="insert into $tbl($fields) values(".substr(str_repeat(',?', $count),1).")";
		return db::ExecMe($s, $params, $con);
	}
	
	static function updateEasy($tbl, $post, $con=null) {
		
		$fields="";
		$count=0;
		$params=array();
		foreach($post as $key=>$value) {
			if ($key=='type') {
				continue;
			}
			if (is_array($post[$key])) {
				continue;
			}
			if ($key==$tbl.'_id') {
				$where="$key=".$value;
				continue;
			}
			$fields.=",".$key;
			$count++;
			if ($value=='') {
				array_push($params, null);
			} else {
			array_push($params, $value);
			}
		}
		$fields=substr($fields,1);
		$s="update $tbl set ".str_replace(',','=?,', $fields)."=? where $where";
		return db::ExecMe($s, $params, $con);
	}
	
	static function update($tbl, $fields, $where, $params=array(), $con=null) {
		$s="update $tbl set ".str_replace(',','=?,', $fields)."=? where $where";
		db::Log($s);
		return db::ExecMe($s, $params, $con);
	}
	
	static function delete($tbl, $where, $params=array(), $con=null) {
		$s="delete from $tbl where $where";
		return db::ExecMe($s, $params, $con);
		
	}
	static function beginTrans($db_str='db') {
		$con=db::connect($db_str);
		$con->beginTransaction();
		return $con;
	}
	static function commitTrans($con) {
		$con->commit();
		$con=null;
	}
	static function rollbackTrans($con) {
		$con->rollBack();
		$con=null;
	}
	static function select_required($tbl, $fields=array(), $params=array()) {
		$result=array();
		$filter='(1=0';
		foreach($fields as $field) {
			$filter.=" or trim(ifnull($field,''))=''"; 
		}
		$filter.=") and user_id=?";
		$s="select * from $tbl where $filter";
		$res= db::DoQuery($s, $params);
		foreach ($res as $row) {
			foreach($fields as $field) {
				if ($row[$field]=='') {
					array_push($result, $field);
				}
			}
		}
		return $result;
	}
}

