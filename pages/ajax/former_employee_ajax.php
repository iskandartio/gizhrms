<?php
	if ($type=='load') {
		$res=db::select('employee a
			inner join employee_history b on a.user_id=b.user_id and a.contract1_start_date=b.contract1_start_date'
			,'a.*, b.severance, b.service, b.housing, b.new_severance, b.reason, b.terminate_date'
			, "contract_state='Terminate'", "a.first_name, a.last_name");
		foreach ($res as $key=>$rs) {
			$res2=db::select('contract_history2', '*','user_id=?','start_date', array($rs['user_id']));
			$res3=db::select('contract_history', '*','user_id=?','start_date', array($rs['user_id']));
			$res2=array_merge($res2, $res3);
			$res[$key]['project_history']=$res2;
		}
		$result="";
		$result.="<table class='tbl' id='tbl_result'>
			<thead><tr><th>Name</th><th>Contract Duration</th><th>Project History</th><th>Severance Data</th></tr></thead><tbody>";
		foreach ($res as $rs) {
			$result.="<tr><td>"._name($rs['user_id'])."</td>
				<td><table>
				<tr><td>First Contract</td><td>:</td><td>".formatDate($rs['contract1_start_date'])." - ".formatDate($rs['contract1_end_date'])."</td></tr>";
			if ($rs['am1_start_date']!=null) {
				$result.="<tr><td>First Amendment</td><td>:</td><td>".formatDate($rs['am1_start_date'])." - ".formatDate($rs['am1_end_date'])."</td></tr>";
			}
			$result.="</table></td>
			<td><table style='border-spacing:0px'>";
			$style="";
			foreach ($rs['project_history'] as $rs2) {
				
				$result.="<tr><td $style>Contract Date</td><td $style>:</td><td $style>".formatDate($rs2['start_date'])." - ".formatDate($rs2['end_date'])."</td></tr>";
				$result.="<tr><td>Project</td><td>:</td><td>".$rs2['project_name']." - ".$rs2['project_number']." - ".$rs2['project_location']."</td></tr>";
				if ($style=="") $style=" style='border-top:1px solid black'";
			}
			$result.="</table></td>
			<td><table style='border-spacing:0px'>
			<tr><td>Severance</td><td>:</td><td align='right'>".formatNumber($rs['severance'])."</td></tr>
			<tr><td>Service</td><td>:</td><td align='right'>".formatNumber($rs['service'])."</td></tr>
			<tr><td>Housing</td><td>:</td><td align='right'>".formatNumber($rs['housing'])."</td></tr>";
			if ($rs['terminate_date']!=null) {
				$result.="<tr><td style='border-top:1px solid black'>Terminate Date</td><td style='border-top:1px solid black'>:</td><td style='border-top:1px solid black'>".formatDate($rs['terminate_date'])."</td></tr>
					<tr><td align='right'>Severance Paid</td><td>:</td><td align='right'>".formatNumber($rs['new_severance'])."</td></tr>
					<tr><td>Reason</td><td>:</td><td>".$rs['reason']."</td></tr>";
			}
			$result.="</table></td></tr>";
		}
		$result.="</tbody></table>";
		die($result);
	}
?>