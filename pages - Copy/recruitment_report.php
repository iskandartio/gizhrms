<script>
	$(function() {
		bind('.btn_detail',"click",ShowDetail);
		$('#show_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		hideColumns('tbl');
	});
	function ShowDetail() {
		var data={};
		data['type']='show_detail';
		data['user_id']=$(this).closest("span").children("span").html();
		data['vacancy_id']=$(this).closest("tr").children("td:eq(0)").html();
		var success=function(msg) {
			$('#show_detail').html(msg);
			$('#show_detail').dialog("open");
		};
		ajax("filter_applicantAjax.php", data, success);
	}
	

	
</script>
<?php
	$sql="select a.vacancy_id, a.user_id, concat(d.first_name, ' ',d.last_name) as name from job_applied  a
left join vacancy b on a.vacancy_id=b.vacancy_id and a.vacancy_progress_id=b.vacancy_progress_id
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id
left join applicants d on a.user_id=d.user_id 
where c.vacancy_progress_val !='Closing'";
	$res=db::DoQuery($sql);
	foreach ($res as $row) {
		if (!isset($applicants[$row['vacancy_id']])) {
			$applicants[$row['vacancy_id']]=array();
		}
		array_push($applicants[$row['vacancy_id']], array("name"=>$row['name'],"user_id"=>$row['user_id']));
	}
	
	$res=db::DoQuery("select distinct a.vacancy_id, concat(b.vacancy_name,' (',b.vacancy_code,'-',b.vacancy_code2,')') vacancy, c.process_name from vacancy_employee a
left join vacancy b on a.vacancy_id=b.vacancy_id and b.vacancy_progress_id<a.vacancy_progress_id 
left join vacancy_progress c on c.vacancy_progress_id=b.vacancy_progress_id 
where c.vacancy_progress_val !='Closing' and a.employee_id=?", array($_SESSION['uid']));
	$result="<table class='tbl' id='tbl'>";
	$result.="<thead><tr><th></th><th>Vacancy</th><th>Process Name</th><th>Applicants</th></tr></thead>";
	foreach ($res as $row) {	
		$applicant="";
		foreach ($applicants[$row['vacancy_id']] as $a) {
			$applicant.="<span style='display:block'>".getImageTags(array('detail'))."<span style='display:none'>".$a['user_id']."</span>".$a['name']."</span>";
		}
		$result.="<tr><td>".$row['vacancy_id']."</td><td>".$row['vacancy']."</td><td>".$row['process_name']."</td><td valign='middle'>$applicant</td></tr>";
	}
	$result.="</table>";
	_p($result);
?>
<div id="show_detail"></div>