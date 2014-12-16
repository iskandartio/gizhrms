<?php
	function combo_gender($selected='') {
		$res=db::select('gender','gender_val','','gender_id');
		$combo_gender=shared::select_combo($res,'gender_val', '', $selected);
		return $combo_gender;
	}
	
	function combo_nationality($selected='') {
		$res=db::select('nationality','nationality_id, nationality_val','','ifnull(sort_id,1000), nationality_val');
		$combo_nationality=shared::select_combo($res,'nationality_id','nationality_val', $selected);
		$combo_nationality.="<option value=-1>Others *</option>";
		return $combo_nationality;
	}
	
	function combo_country($selected='') {
		$res=db::select('country','country_id, country_val','','country_id');
		$combo_country=shared::select_combo($res,'country_id','country_val', $selected);
		return $combo_country;
	}
	function combo_province($selected='') {
		$res=db::select('province','province_id, province_val','','province_id');
		$combo_province=shared::select_combo($res,'province_id','province_val', $selected);
		return $combo_province;
	}
	$res=db::select('city','city_id, province_id, city_val','','province_id, city_val');
	$js_city='';
	$last=0;
	$cities='';
	foreach ($res as $row) {
		if ($last!=$row['province_id']) {
			if ($last!=0) {
				$js_city.="city_list[".$last."]=[".$cities."];\n";
				$cities='';
			}
			$last=$row['province_id'];
			
		}
		if ($cities!='') $cities.=",";
		$cities.="{".$row['city_id'].":'".$row['city_val']."'}";
	}
	$edit_id=$_SESSION['edit_id'];
	$applicant=db::select_one('applicants a
left join contract_history b on a.user_id=b.user_id and now() between b.start_date and b.end_date'
,'*, (datediff(contract0_end_date, contract0_start_date)+1)/365+ 
ifnull((datediff(contract1_end_date, contract1_start_date)+1)/365,0)+
ifnull((datediff(contract2_end_date, contract2_start_date)+1)/365,0) count_years','a.user_id=?','', array($edit_id));
	$salary_history=db::select('contract_history','*','user_id=?', '',array($edit_id));
	$count_year=$applicant['count_years'];
	$service=0;
	if ($count_year<1) {
		$severance=$applicant['salary'];
	} else if ($count_year<2) {
		$severance=2*$applicant['salary'];
	} else if ($count_year<3) {
		$severance=3*$applicant['salary'];
	} else {
		$severance=4*$applicant['salary'];
		$service=2*$applicant['salary']+0.15*$severance;
		
	}
	
	$applicant['projected_severance']=formatNumber($severance);
	$applicant['projected_service']=formatNumber($service);
	
?>
<script>
	var city_list=new Object();
	
	$(function() {
		bind('#province','change', ChangeProvince);
		bind('#country','change', ChangeCountry);
		bind('#div_current_contract #btn_save','click', SaveCurrentSalary);
		bind('#div_personal_data #btn_save','click', SavePersonalData);
		bind('#div_contract_data #btn_save','click', SaveContractData);
		bind('#nationality','change', ChangeNationality);
		numeric($('.salary'));
		setDatePicker();
		build_city();
		
		ChangeProvinces($('#province').val(), '<?php _p($applicant['city'])?>');
		<?php if ($applicant['country']==-1) {
			_p("$('#country').val('-1');");
			_p("$('#country_name').show();");
			_p("$('#province').hide();");
			_p("$('#city').hide();");
		} else {
			_p("$('#country_name').hide();");
			_p("$('#province').show();");
			_p("$('#city').show();");
		}
		if ($applicant['nationality']==-1) {
			_p("$('#nationality').val('-1');");
			_p("$('#nationality_val').show();");
		} else {
			_p("$('#nationality_val').hide();");
		}
		?>
		
		fixSelect();
		
	});
	function build_city() {
		var h = new Object();
		<?php _p($js_city)?>
		
	}
	function ChangeNationality() {
		if ($(this).val()==-1) {
			$('#nationality_val').show();
		} else {
			$('#nationality_val').hide();
		}
	}
	function ChangeCountry() {
		if ($(this).val()==-1) {
			$('#country_name').show();
			$('#province').hide();
			$('#city').hide();
		} else {
			$('#country_name').hide();
			$('#province').show();
			$('#city').show();
		}
	}
	function ChangeProvinces(province, selected) {
		
		$('#city').empty();
			
		$('#city').append("<option value='' selected disabled>-City-</option>");
		
		
		var city=city_list[province];
		for  (c in city){
			for (d in city[c]) {
				$('#city').append("<option value='"+d+"'"+(selected==d ? 'selected' : '')+">"+city[c][d]+"</option>");
				
			}
		}
		fixSelect();
		
	}
	function ChangeProvince() {
		ChangeProvinces($(this).val());
		
	}
	function SaveContractData() {
		var data={}
		data['type']="save_contract_detail";
		data['applicants_id']="<?php _p($edit_id)?>";
		data=prepareDataText(data, ['contract0_start_date','contract0_end_date','contract1_start_date','contract1_end_date'
		,'contract2_start_date','contract2_end_date']);
		var success=function(msg) {
			d=jQuery.parseJSON(msg);
			$('#projected_severance').val(d['severance']);
			$('#projected_service').val(d['service']);
		}
		ajax("employeeAjax.php",data,success);
	}
	function SaveCurrentSalary() {
		var data={}
		data['type']='save_current_contract';
		data=prepareDataText(data, ['contract_history_id','project_name','project_number','project_location','principal_advisor','team_leader','responsible_superior','SAP_No','position','job_title']);
		var success=function(msg) {
		}
		ajax('employeeAjax.php',data, success);
	}
	function SavePersonalData() {
		if (!validate_empty(['first_name','last_name', 'place_of_birth','date_of_birth','nationality','address','country','post_code','phone1'])) return;
		if ($('#country').val()==-1) {
			if (!validate_empty(['country_name'])) return;
		} else {
			if (!validate_empty(['province','city'])) return;
		}
		var data ={};
		data['type']='save';
		data=prepareDataText(data, ['applicants_id','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','nationality','nationality_val','address','country','country_name','province','city','post_code','phone1','phone2','computer_skills','professional_skills']);
		var success=function(msg) {
			
			$('#applicants_id').val(msg);
		}
		ajax("applicantAjax.php", data, success);
		
	}

</script>
<h1><?php _p($applicant['first_name']." ".$applicant['last_name'])?></h1>
<div id="div_current_contract">
<input type="hidden" id="contract_history_id" value="<?php _p($applicant['contract_history_id'])?>"/>
<table>
	<tr><td>Project Name</td><td>:</td><td><?php _t("project_name", $applicant);?></td></tr>
	<tr><td>Project Number</td><td>:</td><td><?php _t("project_number", $applicant);?></td></tr>
	<tr><td>Project Location</td><td>:</td><td><?php _t("project_location", $applicant);?></td></tr>
	<tr><td>Principal Advisor</td><td>:</td><td><?php _t("principal_advisor", $applicant);?></td></tr>
	<tr><td>Team Leader</td><td>:</td><td><?php _t("team_leader", $applicant);?></td></tr>
	<tr><td>Responsible Superior</td><td>:</td><td><?php _t("responsible_superior", $applicant);?></td></tr>
	<tr><td>SAP No</td><td>:</td><td><?php _t("SAP_No", $applicant);?></td></tr>
	<tr><td>Position</td><td>:</td><td><?php _t("position", $applicant);?></td></tr>
	<tr><td>Job Title</td><td>:</td><td><?php _t("job_title", $applicant, "60");?></td></tr>
	<tr><td>Salary</td><td>:</td><td><?php _t("salary", formatNumber($applicant['salary']));?></td></tr>
</table>
<button class='button_link' id='btn_save'>Save</button>
</div>
<div id="div_salary_history">
<h1>Salary History</h1>
<table class='tbl'>
<tr><th>Project Name</th><th>Project Number</th><th>Project Location</th><th>Principal Advisor</th>
<th>Team Leader</th><th>Responsible Superior</th><th>SAP No</th><th>Position</th><th>Job Title</th><th>Salary</th></tr>
<?php
	foreach ($salary_history as $row) {
		foreach ($row as $key=>$val) {
			$$key=$val;
		}
		echo "<tr><td>$project_name</td><td>$project_number</td><td>$project_location</td>
		<td>$principal_advisor</td><td>$team_leader</td><td>$responsible_superior</td>
		<td>$SAP_No</td><td>$position</td><td>$job_title</td><td>".formatNumber($salary)."</td></tr>";
	}
?>
</table>
</div>
<div id="div_contract_data">
<h1>Contract Data</h1>
<table>
<tr><td>First Contract</td><td>:</td><td>
<?php _t("contract0_start_date",$applicant, "8", "text", "", "Start Date") ?> - <?php _t("contract0_end_date",$applicant, "8", "text", "", "End Date") ?>
</td></tr>
<tr><td>First Amendment</td><td>:</td><td>
<?php _t("contract1_start_date",$applicant, "8", "text", "", "Start Date") ?> - <?php _t("contract1_end_date",$applicant, "8", "text", "", "End Date") ?>
</td></tr>
<tr><td>Second Amendment</td><td>:</td><td>
<?php _t("contract2_start_date",$applicant, "8", "text", "", "Start Date") ?> - <?php _t("contract2_end_date",$applicant, "8", "text", "", "End Date") ?>
</td></tr>
<tr><td>Projected Severance</td><td>:</td><td>
<?php _t("projected_severance", $applicant)?>
</td></tr>
<tr><td>Projected Service</td><td>:</td><td>
<?php _t("projected_service", $applicant)?>
</td></tr>
</table>
<button class='button_link' id='btn_save'>Save</button>
</div>
<div id="div_personal_data">
<h1>Personal Data</h1>
<table>
	<tr style='display:none'><td>Applicants ID</td><td>:</td><td><?php _t("applicants_id",$applicant)?></td></tr>
	<tr><td>First Name *</td><td>:</td><td><?php _t("first_name",$applicant)?></td></tr>
	<tr><td>Last Name *</td><td>:</td><td><?php _t("last_name", $applicant)?></td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td><?php _t("place_of_birth", $applicant)?></td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td><?php _t("date_of_birth", $applicant)?></td></tr>
	<tr><td>Gender</td><td>:</td><td><select id='gender'><option value='' selected>-Gender-</option><?php _p(combo_gender($applicant['gender']))?></select></td></tr>
	<tr><td>Nationality *</td><td>:</td><td><select id='nationality'><option value='' selected disabled>-Nationality-</option><?php _p(combo_nationality($applicant['nationality']))?></select> <?php _t("nationality_val", $applicant)?></td></tr>
	<tr><td valign='top'>Address *</td><td>:</td><td><textarea id='address' cols='30' rows='3'><?php _p($applicant['address'])?></textarea><br/>
	<select id='country'><option value='' disabled selected>-Country-</option><?php _p(combo_country($applicant['country']))?><option value=-1>Other *</option></select> <?php _t("country_name", $applicant)?><br/>
	<select id='province'><option value='' disabled selected>-Province-</option><?php _p(combo_province($applicant['province']))?></select>
	<select id='city'><option value='' disabled selected>-City-</option></select></td></tr>
	<tr><td>Post Code *</td><td>:</td><td><?php _t("post_code", $applicant)?></td></tr>
	<tr><td>Phone1 *</td><td>:</td><td><?php _t("phone1", $applicant)?></td></tr>
	<tr><td>Phone2</td><td>:</td><td><?php _t("phone2", $applicant)?></td></tr>
	<tr><td>Computer Skills</td><td>:</td><td><textarea id="computer_skills" cols='30' rows='3'><?php _p($applicant['computer_skills'])?></textarea></td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td><textarea id="professional_skills" cols='30' rows='3'><?php _p($applicant['professional_skills'])?></textarea></td></tr>
</table>
<button class='button_link' id='btn_save'>Save</button>

</div>





