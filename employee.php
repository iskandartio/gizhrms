<?php
	require_once("pages/startup.php");
	$res=db::DoQuery('select * from applicants a
	left join nationality b on a.nationality=b.nationality_id
	order by a.first_name, a.last_name');
	
?>
<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script src="js/general.js"></script>
<script src="js/numeric.js"></script>

<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" href="css/default.css"/>
<script>
	$(function() {
		bindAll();
	});
	function bindAll() {
		$('.btn_edit').bind("click", Edit);
		$('.btn_add').bind("click", Add);
		$('.tbl tr').each(function(idx) {
			$(this).children("td:eq(0)").hide();
			$(this).children("th:eq(0)").hide();
		});
	}
	function Edit() {
		var par=$(this).closest("tr");
		var data={}
		data['type']="set_user_id";
		data['user_id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			location.href="employee_edit.php";
		}
		$.ajax({
			type : 'post',
			url : 'employeeAjax.php',
			data : data,
			success : success
		});
	}
	function Add() {
		var data={}
		data['type']="set_user_id";
		data['user_id']="";
		var success=function(msg) {
			location.href="employee_edit.php";
		}
		$.ajax({
			type : 'post',
			url : 'employeeAjax.php',
			data : data,
			success : success
		});
	}
</script>
<button class='btn_add'>Add</button>
<table class='tbl'>
<tr>
<th>User ID</th>
<th></th>
<th>First Name</th>
<th>Last Name</th>
<th>Gender</th>
<th>Nationality</th>
</tr>
<?php foreach ($res as $row) {
	echo "<tr>
	<td>".$row['user_id']."</td>
	<td><button class='btn_edit'>Edit</button></td>
	<td>".$row['first_name']."</td>
	<td>".$row['last_name']."</td>
	<td>".$row['gender']."</td>
	<td>".$row['nationality_val']."</td>
	</tr>";
}?>
</table>