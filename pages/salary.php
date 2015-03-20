<?php
	$res=db::select('salary_band','*');
	$salary_band_option_def=shared::select_combo_complete($res, "salary_band", "-Salary Band-");
	
	$res=Employee::get_active_employee();
	
?>
<script>
	var fields=generate_assoc(['user_id','first_name','last_name','job_title','current_salary','salary_band','adj_salary','adj_salary_band','adj_reason']);
	$(function() {
		fixSelect();
		bindAll();
		hideColumns('tbl_data');
		bind('#popup_detail_btn','click', PopupDetail);
		
	});
	function bindAll() {
		bind('.btn_save','click',Save);
		bind('#process_salary','click',ProcessSalary);
		$('input[id="salary"]').each(function(idx) {
			numeric($(this));
		});
		setDatePicker();
		$('#popup_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
	}
	function Save() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save_adj_salary';
		data['user_id']= getChildHtml(par, 'user_id', fields);
		data=prepareDataText(data, ['adj_salary_band','adj_reason'], par, fields);
		data=prepareDataDecimal(data, ['adj_salary'], par, fields);
		var success=function(msg) {
			if (msg!='') alert(msg);
		}
		ajax('salary_ajax', data, success);
	}
	function PopupDetail()  {
		if ($('#start_date').val()=='') {
			alert("You must input start date");
			return;
		}
		var data={}
		data['type']='get_process_salary';
		data['start_date']=$('#start_date').val();
		var success=function(msg) {
			$('#popup_detail').html(msg);
			$('#popup_detail').dialog("open");
			bindAll();
		}
		ajax('salary_ajax',data, success);
	}
	function ProcessSalary() {
		var data={}
		data['type']='process_salary';
		data['start_date']=$('#start_date').val();
		var success=function(msg) {
			$('#popup_detail').dialog("close");
			location.reload();
		}
		ajax('salary_ajax',data, success);
	}
</script>

Salary Adjustment Start Date : <?php _t("start_date")?><p>
<table class='tbl' id='tbl_data'>
<thead><tr><th>User ID</th><th>First Name</th><th>Last Name</th><th>Job Title</th><th>Current Salary</th><th>Salary Band</th>
<th>Adjusted Salary</th><th>Adjusted<br>Salary Band</th><th>Reason</th><th></th></tr></thead>
<?php foreach ($res as $rs) {
	foreach ($rs as $key=>$val) {
		$$key=$val;
	}
	
	$salary_band_option=shared::set_selected($adj_salary_band, $salary_band_option_def);
	_p("<tr><td>$user_id</td><td>$first_name</td><td>$last_name</td><td>$job_title</td><td>".formatNumber($salary)."</td><td>$salary_band</td>
	<td>"._t2("salary", formatNumber($adj_salary))."</td><td>$salary_band_option</td><td>"._t2("adj_reason", $adj_reason)."</td>
	<td>".getImageTags(['save'])."</tr>");
}?>
</table>
<button class='button_link' id='popup_detail_btn'>Process Salary Adjustment</button>
<div id="popup_detail"></div>
