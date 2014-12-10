<?php
require_once("pages/startup.php");
$user_id= $_SESSION['employee.user_id'];
echo $user_id;
$res_nationality=db::DoQuery('select * from nationality');

$res=db::DoQuery('select * from applicants where user_id=?', array($user_id));
if (count($res)>0) {
	$row=$res[0];
}

?>
<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script src="js/general.js"></script>
<script src="js/numeric.js"></script>

<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" href="css/default.css"/>
<script>
	$(function() {
		<?php if (count($res)>0) {?>
			$('#first_name').val('<?php echo $row['first_name']?>');
			$('#last_name').val('<?php echo $row['last_name']?>');
			<?php if ($row['gender']=='Male') {
				echo "$('#radio_male').prop('checked', true);"; 
			}?>
		<?php }?>
		bindAll();
	});
	function bindAll() {
		$('.btn_save').bind("click", Save);
		$('.btn_back').bind("click", Back);

	}
	function Save() {
		var data={}
		data['type']='save';
		data['first_name']=$('#first_name').val();
		data['last_name']=$('#last_name').val();
		if ($('#radio_male').prop('checked')) {
			data['gender']='Male';
		} else {
			data['gender']='Female';
		}
		data['nationality']=$('#nationality').val();
		var success=function(msg) {
			location.href="employee.php";
		}
		$.ajax({
			type : 'post',
			url : 'employeeAjax.php',
			data : data,
			success: success
		});
	}
	function Back() {
		location.href="employee.php";
	}
</script>
<button class='btn_back'>Back</button>
<table>
<tr><td>First Name</td><td>:</td><td><input type='text' id='first_name'/></td></tr>
<tr><td>Last Name</td><td>:</td><td><input type='text' id='last_name'/></td></tr>
<tr><td>Gender</td><td>:</td><td>
	<input type='radio' id='radio_male'><label for='radio_male'>Male</label>
	<input type='radio' id='radio_female'><label for='radio_female'>Female</label>
</td></tr> 
<tr><td>Nationality</td><td>:</td><td>
	<select id='nationality'>
	<?php foreach ($res_nationality as $row) {?>
		<option value='<?php echo $row['nationality_id']?>'><?php echo $row['nationality_val']?></option>
	<?php }?>	
	</select>
</td></tr>
</table>
<button class='btn_save'>Save</button>