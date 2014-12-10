<?php
	session_start();
	foreach ($_GET as $key=>$val) {
		$$key=$val;
	}
	$result="";
	if ($type=='export_pdf') {
		$get='';
		for ($i=1;$i<=$last;$i++) {
			$get.=$_SESSION['export'][$i];
		}
		
		$arr=array();
		parse_str($get, $arr);
		
		$result="<table><tr>";
		
		foreach($arr['data'] as $key=>$val) {
			$result.="<tr>";
			$result.="<td>".$val['tabular']."</td>";
			$result.="<td><img src='".$val['chart']."'/></td>";
			
			$result.="</tr>";
			
		}
		$result.="</table>";
		
		
	}
	//echo $result;
	//die;
	require_once("libs/MPDF57/mpdf.php");
	
	$mpdf=new mPDF(); 

	$mpdf->WriteHTML($result);
	$mpdf->Output();
	exit;

?>