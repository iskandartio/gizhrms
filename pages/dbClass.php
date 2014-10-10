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
		db::Log("Start:".date('Y/m/d H:i:s'));
		db::Log($query);
		db::Log($params);
		return $res->fetchAll(PDO::FETCH_ASSOC);
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
				file_put_contents("log.txt", $log."\n", FILE_APPEND | LOCK_EX);
			}	
		} else {
			file_put_contents("log.txt", $logs."\n", FILE_APPEND | LOCK_EX);
		}
		
	}
	static function ExecMe($query, $params=array(), $con=null) {
		if (!isset($con)) $con= db::Connect();
	 	$res=$con->prepare($query);
		$res->execute($params);
		db::Log("Start:".date('Y/m/d H:i:s'));
		db::Log($query);
		db::Log($params);
		if (substr($query,0,6)=='insert') {
			return $con->lastInsertId();
		}
		return $res->rowCount();
	}

	
	function select($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		if($order!='') $order="order by $order";
		$s="select $fields from $tbl $where $order";
		return db::DoQuery($s, $params, $con);
	}
	function select_with_count($tbl, $where='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		$s="select count(*) c from $tbl $where";
		$rs=db::DoQuery($s, $params, $con);
		
		return $rs[0]['c'];
	}
	function select_one($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		if($where!='') $where="where $where";
		if($order!='') $order="order by $order";
		$s="select $fields from $tbl $where $order";
		$res = db::DoQuery($s, $params, $con);	
		if (count($res)>0) return $res[0]; else return null;
	}
	
	function select_single($tbl, $fields, $where='', $order='', $params=array(), $con=null) {
		$res = db::select_one($tbl, $fields, $where, $order, $params, $con);
		if (isset($res['v'])) return $res['v']; else return null;
	}
	
	function insert($tbl, $fields, $params=array(), $con=null) {
		$s="insert into $tbl($fields) values(".substr(str_repeat(',?', count($params)),1).")";
		return db::ExecMe($s, $params, $con);
	}
	function update($tbl, $fields, $where, $params=array(), $con=null) {
		$s="update $tbl set ".str_replace(',','=?,', $fields)."=? where $where";
		
		return db::ExecMe($s, $params, $con);
	}
	
	function delete($tbl, $where, $params=array(), $con=null) {
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
}

