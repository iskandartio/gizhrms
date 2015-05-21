<?php
	
	if ($type=='get_datatable') {
		$res=Employee::get_active_employee();
		$result="<table id='datatable' class='hidden'>";
		if (count($res)>0) {
			$result.="<tr>";
			foreach ($res[0] as $key=>$val) {
				$result.="<th>".proper($key)."</th>";
			}
			$result.="</tr>";
			foreach ($res as $row) {
				$result.="<tr>";
				foreach ($row as $val) {
					$result.="<td>".$val."</td>";
				}
				$result.="</tr>";
			}
			
		}
		
		$result.="</table>";
		
		die ($result);
	}
	if ($type=='gender') {
		$res=Employee::get_active_employee_simple("", array(),"a.gender");
		$result=array();
		foreach ($res as $row) {
			if (!isset($result[$row['gender']])) {
				$result[$row['gender']]=array();
			}
			array_push($result[$row['gender']], $row['first_name'].' '.$row['last_name']);
		}
		
		$pieData=array();
		$colorList=array("#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360");
		$highlightList=array("#FF5A5E","#5AD3D1", "#FFC870","#A8B3C5","#616774");
		$i=0;
		$pieData=array();
		$tabular="";
		foreach ($result as $key=>$res) {
			$data=array();
			$value=count($res);
			$data['value']=$value;
			$data['color']=$colorList[$i];
			$data['highlight']=$highlightList[$i];
			$data['label']=$key;
			$i++;
			array_push($pieData, $data);
			$tabular.="<br/><br/><br/><h2>".$key."</h2><hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row."</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		$allDataArray['Gender']=$allData;
		die(json_encode($allDataArray));
	}
	if ($type=='salary_band') {
		$res=Employee::get_active_employee("", array(),"c.salary_band");
		$result=array();
		foreach ($res as $row) {
			shared::setArr($result[$row['salary_band']], $row['first_name'].' '.$row['last_name']);
		}
		
		$pieData=array();
		$colorList=array("#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360");
		$highlightList=array("#FF5A5E","#5AD3D1", "#FFC870","#A8B3C5","#616774");
		$i=0;
		$pieData=array();
		$tabular="";
		foreach ($result as $key=>$res) {
			$data=array();
			$value=count($res);
			$data['value']=$value;
			$data['color']=$colorList[$i];
			$data['highlight']=$highlightList[$i];
			$data['label']=$key;
			$i++;
			array_push($pieData, $data);
			$tabular.="<br/><br/><br/><h2>".$key."</h2><hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row."</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		$allDataArray['Salary Band']=$allData;
		die(json_encode($allDataArray));
	}

	if ($type=='age') {
		$res=Employee::get_active_employee_simple('',array(),'a.date_of_birth desc');
		$result=array();
		foreach ($res as $row) {
			$age=get_age($row['date_of_birth']);
			$r=$age-$age%$range;
			$r2=$r+$range;
			$r3=$r." - ".$r2;
			if (!isset($result[$r3])) {
				$result[$r3]=array();
			}
			array_push($result[$r3], array('name'=>$row['first_name'].' '.$row['last_name']
			, 'age'=>$age));
			
		}
		
		$pieData=array();
		$colorList=array("#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360");
		$highlightList=array("#FF5A5E","#5AD3D1", "#FFC870","#A8B3C5","#616774");
		$i=0;
		$pieData=array();
		$tabular="";
		foreach ($result as $key=>$res) {
			$data=array();
			$value=count($res);
			$data['value']=$value;
			$data['color']=$colorList[$i];
			$data['highlight']=$highlightList[$i];
			$data['label']=$key;
			$i++;
			array_push($pieData, $data);
			$tabular.="<br/><br/><br/><h2>".$key."</h2><hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row['name']." (".formatNumber($row['age']).")</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		$allDataArray['Age']=$allData;
		
		die(json_encode($allDataArray));
	}
	
	if ($type=='education') {
		$res=db::DoQuery("select b.first_name, b.last_name, c.education_val from (
select a.user_id, max(c.sort_id) sort_id from employee a
left join employee_education b on a.user_id=b.user_id 
inner join education c on c.education_id=b.education_id 
group by a.user_id) a
left join employee b on a.user_id=b.user_id
left join education c on c.sort_id=a.sort_id
 where ifnull(b.contract_state,'')!='Terminate' order by c.sort_id");

		$result=array();
		foreach ($res as $row) {
			if (!isset($result[$row['education_val']])) {
				$result[$row['education_val']]=array();
			}
			array_push($result[$row['education_val']], $row['first_name'].' '.$row['last_name']);
		}
		
		$pieData=array();
		$colorList=array("#F7464A","#46BFBD","#FDB45C","#949FB1","#4D5360");
		$highlightList=array("#FF5A5E","#5AD3D1", "#FFC870","#A8B3C5","#616774");
		$i=0;
		$pieData=array();
		$tabular="";
		foreach ($result as $key=>$res) {
			$data=array();
			$value=count($res);
			$data['value']=$value;
			$data['color']=$colorList[$i];
			$data['highlight']=$highlightList[$i];
			$data['label']=$key;
			$i++;
			array_push($pieData, $data);
			$tabular.="<br/><br/><br/><h2>".$key."</h2><hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row."</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		$allDataArray['Education']=$allData;
		die(json_encode($allDataArray));
	}
	
	function get_age($dob) {
		$y=date('Y',strtotime($dob));
		$y2=date('Y');
		$age=$y2-$y;
		$m=date('m',strtotime($dob));
		$m2=date('m');
		if ($m<$m2) {
			return $age;
			
		} else if ($m<$m2) {
			$age=$age-1;
		} else {
			$d=date('d',strtotime($dob));
			$d2=date('d');
			if ($d>$d2) {
				$age=$age-1;
			}
		}
		return $age;
	}
?>
