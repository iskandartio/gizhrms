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
	
	$data=employee::getApplicantData($edit_id);
	foreach ($data as $key=>$val) {
		$$key=$val;
	}
	
	
	$language=db::select('applicants_language a
	left join language b on a.language_id=b.language_id
	left join language_skill c on c.language_skill_id=a.language_skill_id'
	,'ifnull(a.language_val, b.language_val) language_val, a.language_id, a.language_skill_id, c.language_skill_val, a.applicants_language_id'
	,'user_id=?','language_val', array($edit_id));
	
	$combo_language_def=language::getChoice();
	$combo_language_skill_def=shared::select_combo_complete(language_skill::getAll(), 'language_skill_id','-Skill-','language_skill_val');
	
	$combo_project_name_def=shared::select_combo_complete(Project::getProjectName(), 'project_name', '-Project Name-');
	$project_view=employee::getProjectView($applicant, $combo_project_name_def);
?>
<script>
	var city_list=new Object();
	var language_choice="<?php _p($combo_language_def)?>";
	var language_skill_choice="<?php _p($combo_language_skill_def)?>";
	var fields=generate_assoc(['applicants_language_id','language_id','language_skill_id','btn']);
	var fields_dependent=generate_assoc(['employee_dependent_id','relation','name','dob','btn']);
	var tabs=generate_assoc(['personal_data','project','project_history','contract_data','dependents','language','working']);
	$(function() {
		$( "#tabs" ).tabs({
			activate: function( event, ui ) {
				setCookie("employee_detail_tabs", $( "#tabs" ).tabs( "option", "active" ), 1);
				if (tabs['dependents']==$('#tabs').tabs("option","active")) {
					loadDependents();
				}
				if (tabs['working']==$('#tabs').tabs("option","active")) {
					loadWorking();
				}
				
			}
		});
		$( "#tabs" ).tabs( "option", "active", getCookie('employee_detail_tabs'));
		$('#btnUpload').click(function() {
			uploadPhoto()
			
			return false;	
		});
		
		<?php if ($edit_id==0) {  ?>
			$('#div_personal_data').insertAfter('h1#name');
			$('#div_current_contract').hide();
			$('#div_salary_history').hide();
			$('#div_contract_data').hide();
		<?php } ?>
		numeric($('.salary'));
		setDOB();
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
		bindAll();
		bindLanguage();
		fixSelect();
		hideColumns('tbl_salary_history');
	});
	function uploadPhoto() {
		if($("#uploadPhoto").val() == ''){
			return;
		}
		$.ajax({
			url: "upload.php",
			type: 'POST',
			data: new FormData( $('#data')[0] ),
			async: false,
			success: function (data) {
				alert(data);
				$('#photo').attr('src','show_picture.php');
			},
			cache: false,
			contentType: false,
			processData: false
		});
	}
	function bindAll() {
		bind('#province','change', ChangeProvince);
		bind('#country','change', ChangeCountry);
		bind('#btn_save_project','click', SaveProject);
		bind('#div_personal_data #btn_save','click', SavePersonalData);
		bind('#div_contract_data #btn_save','click', SaveContractData);
		bind('#nationality','change', ChangeNationality);
		
		bind("#btn_back", "click", Back);
		bind('#btn_add_language','click',AddLanguage);
		
		bind('#contract1_end_date','change', ValidateFirstEndDate);
		
		bind('#am1_end_date','change',ValidateAm1EndDate);
		bind('#contract2_end_date','change',ValidateSecondEndDate);
		bind('#am2_end_date','change',ValidateAm2EndDate);
		bind('.project_name','change',ChangeProjectName);
		bind('.project_number','change',ChangeProjectNumber);
		
		bind(".btn_add", "click", AddSalarySharing);
		bind('.btn_deleteSalarySharing','click',DeleteSalarySharing);
		bind('.btn_print', "click",Print);
	}
	function Print() {		
		window.open("print_recruitment_summary.php?contract_history_id="+$(this).closest("tr").children("td:eq(0)").html(),"_blank");
	}
	function ValidateFirstEndDate() {
		validateContractLength('contract1_start_date', 'contract1_end_date', 2);
	}
	function ValidateAm1EndDate() {
		validateContractLength('contract1_start_date', 'am1_end_date', 2);
	}
	function ValidateSecondEndDate() {
		validateContractLength('contract2_start_date', 'contract2_end_date', 1);
	}
	function ValidateAm2EndDate() {
		validateContractLength('contract2_start_date', 'am2_end_date', 1);
	}
	function Back() {
		location.href="employee";
	}
	
	
	
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
	function validateContractLength(d1, d2, y) {
		if ($('#'+d2).datepicker('getDate')==null) return true;
		var dateMin=$('#'+d1).datepicker('getDate');
		var rMax = new Date(dateMin.getFullYear() + y, dateMin.getMonth(),dateMin.getDate() - 1); 
        if (rMax<$('#'+d2).datepicker('getDate')) {
			if (d1=='contract1_start_date') {
				alert('First Period Contract can not more then 2 years');
			} else {
				alert('Extension Period Contract can not more then 1 years');
			}
			return false;
		}
		return true;
	}
	function SaveContractData() {
		if (!validateContractLength('contract1_start_date','contract1_end_date',2))  return;
		if (!validateContractLength('contract1_start_date','am1_end_date',2))  return;
		if (!validateContractLength('contract2_start_date','contract2_end_date',1))  return;
		if (!validateContractLength('contract2_start_date','am2_end_date',1))  return;

		var data={}
		data['type']="save_contract_detail";
		data=prepareDataText(data, ['contract1_start_date','contract1_end_date','am1_start_date','am1_end_date'
		,'contract2_start_date','contract2_end_date','am2_start_date','am2_end_date']);
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#projected_severance').val(d['severance']);
			$('#projected_service').val(d['service']);
			$('#contract_graph>tbody>tr>td:eq(0)').html(d['first']);
			$('#contract_graph>tbody>tr>td:eq(1)').html(d['second']);
		}
		ajax("employeeAjax.php",data,success);
	}
	function SaveProject() {
		var p=$('#div_current_contract');
		if (!validate_empty_col(p,['job_title','position','project_name_id','project_number_id','project_location','responsible_superior','salary','salary_band'])) return;
		
		var data={}
		data['type']='save_current_contract';
		data = prepareDataMultiInput(data
		, ['job_title','position','project_name','project_number','principle_advisor','team_leader','project_location'
		,'responsible_superior','SAP_No','salary','salary_band','working_time','reason','start_date','end_date']
		, p);
		data['salary_sharing_project_name']=new Array();
		data['salary_sharing_project_number']=new Array();
		data['salary_sharing_percentage']=new Array();
		var percentage=0;
		var flag=false;
		$(p).find('.div_salary_sharing').find('.row').each(function(idx) {
			data['salary_sharing_project_name'].push($(this).find('.project_name').val());
			data['salary_sharing_project_number'].push($(this).find('.project_number').val());
			data['salary_sharing_percentage'].push($(this).find('.percentage').val());
			percentage=percentage+1*$(this).find('.percentage').val();
			flag=true;
		});
		if (percentage!=100 && flag) {
			alert('salary sharing not correct');
			return;
		}
		
		var success=function(msg) {
			$('#tbl_salary_history tbody').empty();
			$('#tbl_salary_history').append(msg);
			hideColumns('tbl_salary_history');
			bindAll();
		}
		ajax('employeeAjax.php',data, success);
	}
	
	function SavePersonalData() {
		if (!validate_empty(['first_name','last_name', 'user_name', 'place_of_birth','date_of_birth','nationality','address','country','post_code','phone1'])) return;
		if ($('#country').val()==-1) {
			if (!validate_empty(['country_name'])) return;
		} else {
			if (!validate_empty(['province','city'])) return;
		}
		var data ={};
		data['type']='save';
		data=prepareDataText(data, ['applicants_id','user_name','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','nationality','nationality_val','address','country','country_name','province','city','post_code','phone1','phone2','computer_skills','professional_skills','account_bank','account_number']);
		var success=function(msg) {
			
			var d=jQuery.parseJSON(msg);
			if (d['err']) {
				alert(d['err']);
				return;
			}
			if (d['type']=='register') {
				$.ajax({
					type : "post",
					url : "send_email.php"						
				});
			}
			$('#applicants_id').val(d['id']);
			uploadPhoto();
		}
		ajax("employeeAjax.php", data, success);
		
	}
	function AddLanguage() {
		var data={}
		data['type']='add_language';
		var success=function(msg) {
			$('#tbl_language tbody').prepend(msg);
			$('.language_val').hide();
			bindLanguage();
			
		}
		ajax('employeeAjax.php',data, success);
	}
	function bindLanguage() {
		bind('.language_id','change', LanguageChange);
		bind('#tbl_language .btn_save', 'click', SaveLanguage);
		bind('#tbl_language .btn_delete', 'click', DeleteLanguage);
		bind('#tbl_language .btn_edit', 'click', EditLanguage);
		bind('#tbl_language .btn_cancel', 'click', CancelLanguage);
		fixSelect();
		hideColumns('tbl_language');
	}
	function LanguageChange() {
		if ($(this).val()==-1) {
			$(this).closest("td").children(".language_val").show();
		} else {
			$(this).closest("td").children(".language_val").hide();
		}
	}
	
	function SaveLanguage() {
		var par=$(this).closest("tr");
		var data={}
		
		data['type']='save_language';
		data=prepareDataText(data, ['applicants_language_id','language_skill_id'], par, fields);
		data=prepareDataMultiInput(data, ['language_id','language_val'], getChildObj(par,'language_id',fields));
		var success=function(msg) {
			setHtmlText(par, 'applicants_language_id', msg, fields);
			var obj=getChildObj(par, 'language_id', fields);
			var language_id=obj.children("select").val();
			if (language_id==-1) {
				obj.html("<span style='display:none'>"+language_id+"</span>"+obj.children("input").val());
			} else {
				selectedToLabel(par,'language_id',  fields);
			}
			
			selectedToLabel(par,'language_skill_id',  fields);
			btnChange(par, ['edit','delete'], fields);
			bindLanguage();
		}
		ajax("employeeAjax.php", data, success);
	}
	function DeleteLanguage() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='delete_language';
		data['applicants_language_id']=getChildHtml(par, 'applicants_language_id', fields);
		var success=function(msg) {
			par.remove();
		}
		ajax("employeeAjax.php", data, success);
	}
	function EditLanguage() {
		var par=$(this).closest("tr");
		
		var obj=getChildObj(par,'language_id',fields);
		if (obj.children("span").html()==-1) {
			var html=obj.html();
			html=html.substr(html.indexOf('</span>')+7);
			labelToSelect(getChildObj(par, 'language_id', fields), language_choice);
			obj.append(" <input type='text' class='language_val' value='"+html+"'/>");
		} else {
			labelToSelect(getChildObj(par, 'language_id', fields), language_choice);
			obj.append(" <input style='display:none' type='text' class='language_val'/>");
		}
		
		
		labelToSelect(getChildObj(par, 'language_skill_id', fields), language_skill_choice);
		btnChange(par, ['save','cancel']);
			
		
		bindLanguage();
		
	}
	function CancelLanguage() {
		var par=$(this).closest("tr");
		var td=getChildObj(par, 'language_id', fields);
		var originalValue=td.children("select").data("originalValue");
		td.children("select").val(originalValue);
		if (td.children("select").data("originalValue")!=-1) {
			td.html("<span style='display:none'>"+originalValue+"</span>"+td.children("select").children("option:selected").html());
			
		} else {
			td.html("<span style='display:none'>"+originalValue+"</span>"+td.children("input").prop("defaultValue"));
		}
		selectedToDefaultLabel(par, 'language_skill_id', fields);
		btnChange(par, ['edit','delete']);
		bindLanguage();
	
	}
	function ChangeProjectName() {
		var data={}
		data['type']='getProjectNameAndNumber';
		data['project_name']=$(this).val();
		var p=$(this).closest(".row");
		if (p.length==0) p=document;
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$(p).find('.project_number:first').html(d['combo_project_number']);
			$(p).find('.team_leader').html(d['team_leader']);
			$(p).find('.principle_advisor').html('');
			fixSelect();
		}
		ajax('projectAjax.php',data, success);
	}
	function ChangeProjectNumber() {
		if ($(this).closest('.div_salary_sharing').length>0) return;
		var data={}
		data['type']='getProjectNumberByName';
		data['project_number']=$(this).val();
		var success=function(msg) {
			$('.principle_advisor').html(msg);
		}
		ajax('projectAjax.php',data, success);
	}
	function AddSalarySharing() {
	
		var s="<div class='row'><div class='label width120'><?php _p($combo_project_name_def)?></div>";
		s+="<div class='label width120'><select class='project_number'><option value=''>-Project Number-</option></select></div>";
		s+="<div class='label width80'><?php _t("percentage","","1")?> % ";
		s+=getImageTags(['delete'],'SalarySharing');
		s+="</div></div>";
		var p=$(this).closest(".row").next();
		$(p).append(s);
		bindAll();
		fixSelect();
		
	}
	function DeleteSalarySharing() {
		$(this).closest(".row").remove();
	}
	function loadDependents() {
		var data={}
		data['type']="get_dependent";
		var success=function(msg) {
			$('#div_dependents').html(msg);
			bindDependent();
		}
		ajax('employeeAjax.php',data, success);
	}
	function bindDependent() {
		bind('#btn_add_dependent','click',AddDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_save','click',SaveDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_edit','click',EditDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_cancel','click',CancelDependent);
		bind('#tbl_dependent>tbody>tr>td>.btn_delete','click',DeleteDependent);
		bind('#save_spouse','click',SaveSpouse);
		hideColumns('tbl_dependent');
		
		setDatePicker();
		setDOB('#dob');
	}
	function AddDependent()  {
		$s="<tr><td></td><td><?php _t("relation")?></td><td><?php _t("name")?></td><td><?php _t("dob")?></td><td>"+getImageTags(['save','delete'])+"</tr>";
		$('#tbl_dependent').prepend($s);
		bindDependent();
	}
	function EditDependent() {
		var f= fields_dependent;
		var par=$(this).closest("tr");
		labelToText(par, {'relation':20,'name':20,'dob':10}, f);
		btnChange(par, ['save','cancel'],f);
		bindDependent();
		
	}
	function CancelDependent() {
		var f=fields_dependent;
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['relation','name','dob'], f);
		btnChange(par, ['edit','delete'], f);
		bindDependent();
	}
	function DeleteDependent() {
		if (!confirm("Are you sure to delete?")) return;
		var f=fields_dependent;
		var par=$(this).closest("tr");
		data={};
		data['type']='delete_dependent';
		data['employee_dependent_id']=getChildHtml(par,'employee_dependent_id', f);
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax("employeeAjax.php", data, success);
	}
	function SaveDependent()  {
		var par=$(this).closest("tr");
		var f=fields_dependent;
		if (!validate_empty_tbl(par, ['relation','name','dob'], null, f)) {
			return;
		}
		
		var data={};
		data['type']='save_dependent';
		
		data['employee_dependent_id']=getChildHtml(par,'employee_dependent_id', f);
		data=prepareDataText(data, ['relation','name','dob'], par, f);
		var success= function(msg) {
			setHtmlText(par, 'employee_dependent_id', msg, f);
			textToLabel(par, ['relation','name','dob'],f);
			btnChange(par, ['edit','delete'], f);
			bindDependent();
		}
		ajax('employeeAjax.php', data, success);
	}
	function SaveSpouse() {
		var data={};
		data['type']='save_spouse';
		data=prepareDataText(data, ['spouse_name','marry_date']);
		var success=function(msg) {
		}
		ajax('employeeAjax.php',data, success);
	}
	var fields_working=generate_assoc(['applicants_working_id','month_from','year_from', 'month_to', 'year_to', 'employer', 'job_title', 'business_id', 'may_contact', 'leave_reason', 'btn']);
	var currentRow=-1;
	function loadWorking() {
		var data={}
		data['type']="get_working";
		var success=function(msg) {
			$('#div_working').html(msg);
			bindWorking();
		}
		ajax('employeeAjax.php',data, success);
	}
	function bindWorking() {
		bind('#btn_add_working','click',AddWorking);
		$('#btn_save','#div_working').unbind('click');
		$('#btn_save','#div_working').bind('click', SaveWorking);
		
		bind('#tbl_working>tbody>tr>td>.btn_edit','click',EditWorking);
		bind('#tbl_working>tbody>tr>td>.btn_cancel','click',CancelWorking);
		bind('#tbl_working>tbody>tr>td>.btn_delete','click',DeleteWorking);
		hideColumns('tbl_working');
		setDatePicker();
		setDOB('#dob');
		fixSelect();
	}
	function AddWorking()  {
		currentRow=-1;
		clearText(['applicants_working_id','year_from','year_to','employer','job_title','leave_reason','month_from','month_to','business_id','email','phone']);
		$('#may_contact').prop("checked", false);
		$('#email').hide();
		$('#phone').hide();
		$('#btn_save').html('Save as New');
		fixSelect();
	}
	function EditWorking() {
		clearText(['applicants_working_id','year_from','year_to','employer','job_title','leave_reason','month_from','month_to','business_id','email','phone']);
		
		inputFromTableToText(this, ['applicants_working_id','year_from','year_to','employer','job_title','leave_reason'], fields_working, $('#div_working'));
		
		inputFromTableToSelect(this, ['month_from','month_to','business_id'], fields_working, $('#div_working'));
		if (getChild($(this).closest("tr"), 'may_contact', fields_working)!='None') {
			$('#may_contact','#div_working').prop("checked",true);
			inputFromTableToOther(this, 'may_contact', ['email','phone'], fields_working, $('#div_working'));
			$('#email','#div_working').show();
			$('#phone','#div_working').show();
		} else {
			$('#may_contact','#div_working').prop("checked",false);
			$('#email','#div_working').hide();
			$('#phone','#div_working').hide();
			
		}
		$('#btn_save','#div_working').html('Update');
		currentRow=$(this).closest("tr").index();
		fixSelect();

	}
	
	function CancelWorking() {
		var f=fields_working;
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['relation','name','dob'], f);
		btnChange(par, ['edit','delete'], f);
		bindWorking();
	}
	function DeleteWorking() {
		if (!confirm("Are you sure to delete?")) return;
		var f=fields_working;
		var par=$(this).closest("tr");
		data={};
		data['type']='delete_working';
		data['employee_working_id']=getChildHtml(par,'employee_working_id', f);
		var success=function(msg) {
			$('#freeze').hide();
			par.remove();
		}
		ajax("employeeAjax.php", data, success);
	}
	function SaveWorking()  {
		var col=$(this).closest("#div_working");
		if (!validate_empty_col(col, ['month_from','year_from','month_to','year_to','employer','job_title','business_id'])) return;
		var data={};
		data['type']='save_working';
		data=prepareDataMultiInput(data, ['applicants_working_id','month_from','year_from','month_to','year_to','employer','job_title','business_id','email','phone','leave_reason'], col);
		data=prepareDataCheckBox(data, ['may_contact']);
		var success= function(msg) {
			loadWorking();
		}
		ajax('employeeAjax.php', data, success);
	}

</script>
<button id='btn_back' class="button_link">Back</button>

<div id="tabs">
	<ul>
		<li><a href="#div_personal_data">Personal Data</a></li>
		<li><a href="#div_current_contract">Project</a></li>
		<li><a href="#div_salary_history">Project History</a></li>
		<li><a href="#div_contract_data">Contract Data</a></li>
		<li><a href="#div_dependents">Dependents</a></li>
		<li><a href="#div_language">Language</a></li>
		<li><a href="#div_working">Working Exp</a></li>
	</ul>

<h1 id="name" style='margin-left:10px'><img id='photo' src="show_picture.php" width="75px" height="100px"/> <?php _p($applicant['first_name']." ".$applicant['last_name'])?></h1>
	
<div id="div_personal_data">
<form action="upload.php" id="data" method="post" enctype="multipart/form-data">
<div class='row'><div class='label'>Photo</div><div class='label width200'><input type="file" id="uploadPhoto" name="uploadPhoto" accept=".png,.jpg"></div>
<button class="button_link" id="btnUpload">Upload</button>
</div>

 
</form>

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
	<tr><td>Email *</td><td>:</td><td><?php _t("user_name",$applicant,"","text","","Email")?></td></tr>
	<tr><td>Computer Skills</td><td>:</td><td><textarea id="computer_skills" cols='30' rows='3'><?php _p($applicant['computer_skills'])?></textarea></td></tr>
	<tr><td>Professionals Skills</td><td>:</td><td><textarea id="professional_skills" cols='30' rows='3'><?php _p($applicant['professional_skills'])?></textarea></td></tr>
	<tr><td>Account Bank</td><td>:</td><td><?php _t("account_bank", $applicant)?></td></tr>
	<tr><td>Account Number</td><td>:</td><td><?php _t("account_number", $applicant)?></td></tr>
</table>
<button class='button_link' id='btn_save'>Save</button>
</div>
<div id="div_current_contract">
<?php _p($project_view)?>
</div>

<div id="div_salary_history">
<h1>Salary History</h1>
<table id='tbl_salary_history' class='tbl'>
<thead><tr><th>id</th><th>Date</th><th>Project</th><th>Leader</th><th>Position</th><th>Salary</th><th></th></tr></thead>
<?php _p(employee::get_salary_history_tbl($salary_history));?>
</table>
</div>

<div id="div_contract_data">
<h1>Contract Data</h1>
<table>
<tr><td>First Contract</td><td>:</td><td>
<?php _t("contract1_start_date",$applicant, "10", "text", "", "Start Date") ?> - 

<?php _t("contract1_end_date",$applicant, "10", "text", "", "End Date") ?>
</td></tr>
<tr><td>First Amendment</td><td>:</td><td>
<?php _t("am1_start_date",$applicant, "10", "text", "", "Start Date") ?> - <?php _t("am1_end_date",$applicant, "10", "text", "", "End Date") ?>
</td></tr>
<tr><td>Extension</td><td>:</td><td>
<?php _t("contract2_start_date",$applicant, "10", "text", "", "Start Date") ?> - <?php _t("contract2_end_date",$applicant, "10", "text", "", "End Date") ?>
</td></tr>
<tr><td>Second Amendment</td><td>:</td><td>
<?php _t("am2_start_date",$applicant, "10", "text", "", "Start Date") ?> - <?php _t("am2_end_date",$applicant, "10", "text", "", "End Date") ?>
</td></tr>
<tr><td>Projected Severance</td><td>:</td><td>
<?php _t("projected_severance", $applicant)?>
</td></tr>
<tr><td>Projected Service</td><td>:</td><td>
<?php _t("projected_service", $applicant)?>
</td></tr>
</table>
<table id='contract_graph'><thead>
<tr><th>First Contract</th><th>Extension Contract</th></tr></thead><tbody>
<tr><td>
<?php _p(employee::get_graph($applicant['contract1_start_date'],$applicant['contract1_end_date']
					, $applicant['am1_start_date'],$applicant['am1_end_date']
					, shared::addYear($applicant['contract1_start_date'], 2))); ?>
</td><td>
<?php _p(employee::get_graph($applicant['contract2_start_date'],$applicant['contract2_end_date']
					, $applicant['am2_start_date'],$applicant['am2_end_date']
					, shared::addYear($applicant['contract2_start_date'], 1))); ?>
</td>
</tr>
</tbody>
</table>
<button class='button_link' id='btn_save'>Save</button>
</div>
<div id='div_dependents'>
</div>
<div id='div_language'>
	<h1>Language</h1>
	<button id='btn_add_language' class='button_link'>Add</button>
	<table class='tbl' id='tbl_language'>
	<thead>
	<tr><th>ID<th>Language</th><th>Skill Level</th><th></th></tr>
	</thead>
	<tbody>
	<?php foreach($language as $row) {
		_p('<tr><td>'.$row['applicants_language_id'].'</td>');
		_p('<td><span style="display:none">'.$row['language_id'].'</span> '.$row['language_val'].'</td>');
		_p('<td><span style="display:none">'.$row['language_skill_id'].'</span>'.$row['language_skill_val'].'</td>');
		_p("<td>".getImageTags(array('edit','delete'))."</td>");
		_p("</tr>");
		
	}?>
	</tbody>
	</table>
</div>
<div id='div_working'>

</div>
