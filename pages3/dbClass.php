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
				$result[$k][$key]=$row[$key];
			}
		}
		return $result;
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
	
}

