<?php
	require_once("pages/startup.php");
	if ($type=='get_datatable') {
		$res=db::select('job_applied a
		left join applicants b on a.user_id=b.user_id','b.first_name, b.last_name, b.gender, a.salary_expectation, b.date_of_birth'
		,' a.vacancy_id=?', '',array($vacancy_id));
		$result="<table id='datatable'><tr><td>Name</td><td>Gender</td><td>Salary Expectation</td><td>Age</td></tr>";
		foreach ($res as $row) {
			$result.="<tr><td>".$row['first_name'].' '.$row['last_name']."</td>";
			$result.="<td>".$row['gender']."</td><td>".$row['salary_expectation']."<td>".get_age($row['date_of_birth'])."</td></tr>";
		}
		$result.="</table>";
		
		die ($result);
	}
	if ($type=='gender') {
		$res=db::select('job_applied a
		left join applicants b on a.user_id=b.user_id','b.first_name, b.last_name, b.gender'
		,' a.vacancy_id=?', '',array($vacancy_id));
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
			$tabular.="".$key."<hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row."</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		die(json_encode($allData));
	}
	if ($type=='salary_expectation') {
		$res=db::select('job_applied a
		left join applicants b on a.user_id=b.user_id','b.first_name, b.last_name, a.salary_expectation'
		,' a.vacancy_id=?', 'a.salary_expectation',array($vacancy_id));
		$result=array();
		foreach ($res as $row) {
			$r=$row['salary_expectation']-$row['salary_expectation']%$range;
			$r2=$r+$range;
			$r3=($r==0 ? '0' : formatNumber($r))." - ".formatNumber($r2);
			if (!isset($result[$r3])) {
				$result[$r3]=array();
			}
			array_push($result[$r3], array('name'=>$row['first_name'].' '.$row['last_name']
			, 'salary_expectation'=>$row['salary_expectation']));
			
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
			$tabular.="<h2>".$key."</h2><hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row['name']." (".formatNumber($row['salary_expectation']).")</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		die(json_encode($allData));

	}
	if ($type=='age') {
		$res=db::select('job_applied a
		left join applicants b on a.user_id=b.user_id','b.first_name, b.last_name, b.date_of_birth'
		,' a.vacancy_id=?', 'b.date_of_birth desc',array($vacancy_id));
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
			$tabular.="<h2>".$key."</h2><hr/><ul>";
			foreach ($res as $row) {
				$tabular.="<li>".$row['name']." (".formatNumber($row['age']).")</li>";
			}
			$tabular.="</ul>";
		}
		$allData['tabular']=$tabular;
		$allData['pieData']=$pieData;
		die(json_encode($allData));
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
