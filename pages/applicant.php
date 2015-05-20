<?php
	
	function combo_gender($selected='') {
		$res=db::select('gender','gender','','gender_id');
		$combo_gender=shared::select_combo($res,'gender', '', $selected);
		return $combo_gender;
	}
	function combo_title($selected='') {
		$res=db::select('title','title','','title_id');
		$combo_title=shared::select_combo($res,'title', '', $selected);
		return $combo_title;
	}
	function combo_marital_status($selected='') {
		$res=db::select('marital_status','marital_status','','marital_status_id');
		$combo_marital_status=shared::select_combo($res,'marital_status', '', $selected);
		return $combo_marital_status;
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
	$applicant=db::select_one('applicants','*','user_id=?','', array($_SESSION['uid']));
	
?>
<script>
	var city_list=new Object();
	$(function() {
		bind('#province_id','change', ChangeProvince);
		bind('#country_id','change', ChangeCountry);
		bind('#btn_save','click', Save);
		bind('#nationality_id','change', ChangeNationality);
		setDOB();
		setDatePicker();
		
		build_city();
		
		ChangeProvinces($('#province_id').val(), '<?php _p($applicant['city_id'])?>');
		<?php if ($applicant['country_id']==-1) {
			_p("$('#country_id').val('-1');");
			_p("$('#country_name').show();");
			_p("$('#province_id').hide();");
			_p("$('#city_id').hide();");
		} else {
			_p("$('#country_name').hide();");
			_p("$('#province_id').show();");
			_p("$('#city_id').show();");
		}
		if ($applicant['nationality_id']==-1) {
			_p("$('#nationality_id').val('-1');");
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
			$('#province_id').hide();
			$('#city_id').hide();
		} else {
			$('#country_name').hide();
			$('#province_id').show();
			$('#city_id').show();
		}
	}
	function ChangeProvinces(province, selected) {
		
		$('#city_id').empty();
			
		$('#city_id').append("<option value='' selected disabled>-City-</option>");
		
		
		var city=city_list[province];
		for  (c in city){
			for (d in city[c]) {
				$('#city_id').append("<option value='"+d+"'"+(selected==d ? 'selected' : '')+">"+city[c][d]+"</option>");
				
			}
		}
		fixSelect();
		
	}
	function ChangeProvince() {
		ChangeProvinces($(this).val());
		
	}
	
	function Save() {
		
		if (!validate_empty(['title','first_name','last_name', 'place_of_birth','date_of_birth','gender','nationality_id','address','country_id','post_code','phone1'])) return;
		if ($('#country_id').val()==-1) {
			if (!validate_empty(['country_name'])) return;
		} else {
			if (!validate_empty(['province_id','city_id'])) return;
		}
		var data ={};
		data['type']='save';
		data['user_id']='<?php _p($_SESSION['uid'])?>';
		data=prepareDataText(data, ['applicants_id','title','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','marital_status','nationality_id','nationality_val','address','country_id','country_name','province_id','city_id','post_code','phone1','phone2','computer_skills','professional_skills']);
		var success=function(msg) {
			
			$('#applicants_id').val(msg);
		}
		ajax("applicant_ajax", data, success);
		
	}

</script>

<table>
	<tr style='display:none'><td>Applicants ID</td><td>:</td><td><?php _t("applicants_id",$applicant)?></td></tr>
	<tr><td>Title *</td><td>:</td><td><select id='title'><option value='' selected>-Title-</option><?php _p(combo_title($applicant['title']))?></select></td></tr>
	<tr><td>First Name *</td><td>:</td><td><?php _t("first_name",$applicant)?></td></tr>
	<tr><td>Last Name *</td><td>:</td><td><?php _t("last_name", $applicant)?></td></tr>
	<tr><td>Place of Birth *</td><td>:</td><td><?php _t("place_of_birth", $applicant)?></td></tr>
	<tr><td>Date of Birth *</td><td>:</td><td><?php _t("date_of_birth", $applicant)?></td></tr>
	<tr><td>Gender *</td><td>:</td><td><select id='gender'><option value='' selected>-Gender-</option><?php _p(combo_gender($applicant['gender']))?></select></td></tr>
	<tr><td>Marital Status</td><td>:</td><td><select id='marital_status'><option value='' selected>-Marital Status-</option><?php _p(combo_marital_status($applicant['marital_status']))?></select></td></tr>
	<tr><td>Nationality *</td><td>:</td><td><select id='nationality_id'><option value='' selected disabled>-Nationality-</option><?php _p(combo_nationality($applicant['nationality_id']))?></select> <?php _t("nationality_val", $applicant)?></td></tr>
	<tr><td valign='top'>Address *</td><td>:</td><td><textarea id='address' cols='30' rows='3'><?php _p($applicant['address'])?></textarea><br/>
	<select id='country_id'><option value=''>-Country-</option><?php _p(combo_country($applicant['country_id']))?><option value=-1>Other *</option></select> <?php _t("country_name", $applicant)?><br/>
	<select id='province_id'><option value=''>-Province-</option><?php _p(combo_province($applicant['province_id']))?></select>
	<select id='city_id'><option value=''>-City-</option></select></td></tr>
	<tr><td>Post Code *</td><td>:</td><td><?php _t("post_code", $applicant)?></td></tr>
	<tr><td>Phone1 *</td><td>:</td><td><?php _t("phone1", $applicant)?></td></tr>
	<tr><td>Phone2</td><td>:</td><td><?php _t("phone2", $applicant)?></td></tr>
	<tr><td>Computer Skills</td><td>:</td><td><textarea id="computer_skills" cols='30' rows='3'><?php _p($applicant['computer_skills'])?></textarea></td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td><textarea id="professional_skills" cols='30' rows='3'><?php _p($applicant['professional_skills'])?></textarea></td></tr>
	
</table>
<button class='button_link' id='btn_save'>Save</button>
