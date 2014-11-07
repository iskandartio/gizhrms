<?php
	function combo_gender($selected='') {
		$res=db::select('gender','gender_val','','gender_id');
		$combo_gender=shared::select_combo($res,'gender_val', '', $selected);
		return $combo_gender;
	}
	
	function combo_nationality($selected='') {
		$res=db::select('nationality','nationality_id, nationality_val','','ifnull(sort_id,1000), nationality_val');
		$combo_nationality=shared::select_combo($res,'nationality_id','nationality_val', $selected);
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
	$applicant=db::select_one('applicants','*','user_id=?','', array($_SESSION['uid']));
	
?>
<script>
	var city_list=new Object();
	$(function() {
		bind('#province','change', ChangeProvince);
		bind('#country','change', ChangeCountry);
		bind('#btn_save','click', Save);
		
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
		}?>
		
		fixSelect();
		
	});
	function build_city() {
		var h = new Object();
		<?php _p($js_city)?>
		
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
	
	function Save() {
		if (!validate_empty(['first_name','last_name', 'place_of_birth','date_of_birth','nationality','address','country','post_code','phone1'])) return;
		if ($('#country').val()==-1) {
			if (!validate_empty(['country_name'])) return;
		} else {
			if (!validate_empty(['province','city'])) return;
		}
		var data = 'type=save&user_id=<?php _p($_SESSION['uid'])?>';
		var fields=['applicants_id','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','nationality','address','country','country_name','province','city','post_code','phone1','phone2','computer_skills','professional_skills'];
		for (f in fields) {
			data+="&"+fields[f]+"="+$('#'+fields[f]).val();
		}
		
		$('#freeze').show();
		$.ajax({
			type:'post',
			url:'applicantAjax.php',
			data: data,
			success: function(msg) {
				$('#freeze').hide();
				alert('Success');
				$('#applicants_id').val(msg);
			}
		});
		
	}

</script>

<table>
	<tr style='display:none'><td>Applicants ID</td><td>:</td><td><?php _t("applicants_id",$applicant)?></td></tr>
	<tr><td>First Name *</td><td>:</td><td><?php _t("first_name",$applicant)?></td></tr>
	<tr><td>Last Name *</td><td>:</td><td><?php _t("last_name", $applicant)?></td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td><?php _t("place_of_birth", $applicant)?></td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td><?php _t("date_of_birth", $applicant)?></td></tr>
	<tr><td>Gender</td><td>:</td><td><select id='gender'><option value='' selected>-Gender-</option><?php _p(combo_gender($applicant['gender']))?></select></td></tr>
	<tr><td>Nationality *</td><td>:</td><td><select id='nationality'><option value='' selected disabled>-Nationality-</option><?php _p(combo_nationality($applicant['nationality']))?></select></td></tr>
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
