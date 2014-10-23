<?php
	function combo_gender($selected='') {
		$res=db::select('gender','gender_val','','gender_id');
		$combo_gender=shared::select_combo($res,'gender_val', '', $selected);
		return $combo_gender;
	}
	
	function combo_nationality($selected='') {
		$res=db::select('nationality','nationality_id, nationality_val','','nationality_id');
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
		$('#province').bind("change",ChangeProvince);
		$('#btn_save').bind("click",Save);
		setDatePicker();
		build_city();
		ChangeProvinces($('#province').val(), '<?php _p($applicant['city'])?>');
	});
	function build_city() {
		var h = new Object();
		<?php _p($js_city)?>
		
	}
	function ChangeProvinces(province, selected) {
		
		$('#city').empty();
		$('#city').append("<option value=0>-City-</option>");
		
		var city=city_list[province];
		for  (c in city){
			for (d in city[c]) {
				$('#city').append("<option value='"+d+"'"+(selected==d ? 'selected' : '')+">"+city[c][d]+"</option>");
				
			}
		}
		
	}
	function ChangeProvince() {
		ChangeProvinces($(this).val());
		
	}
	
	function Save() {
		var data = 'type=save&user_id=<?php _p($_SESSION['uid'])?>';
		var fields=['applicants_id','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','nationality','address','country','province','city','post_code','phone1','phone2','computer_skills','professional_skills'];
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
	<tr><td>Gender</td><td>:</td><td><select id='gender'><?php _p(combo_gender($applicant['gender']))?></select></td></tr>
	<tr><td>Nationality</td><td>:</td><td><select id='nationality'><?php _p(combo_nationality($applicant['nationality']))?></select></td></tr>
	<tr><td valign='top'>Address</td><td>:</td><td><textarea id='address' cols='30' rows='3'><?php _p($applicant['address'])?></textarea><br/>
	<select id='country'><?php _p(combo_country($applicant['country']))?></select><br/>
	<select id='province'><option value=0>-Province-</option><?php _p(combo_province($applicant['province']))?></select><br/>
	<select id='city'><option value=0>-City-</option></select></td></tr>
	<tr><td>Post Code</td><td>:</td><td><?php _t("post_code", $applicant)?></td></tr>
	<tr><td>Phone1</td><td>:</td><td><?php _t("phone1", $applicant)?></td></tr>
	<tr><td>Phone2</td><td>:</td><td><?php _t("phone2", $applicant)?></td></tr>
	<tr><td>Computer Skills</td><td>:</td><td><textarea id="computer_skills" cols='30' rows='3'><?php _p($applicant['computer_skills'])?></textarea></td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td><textarea id="professional_skills" cols='30' rows='3'><?php _p($applicant['professional_skills'])?></textarea></td></tr>
	
</table>
<button class='button_link' id='btn_save'>Save</button>
