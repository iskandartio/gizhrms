function personal_data(div, ajaxPage) {	
	var self=this;
	
	self.start= function() {
		self.validateCountry();
		self.ChangeNationality();
		bindDiv('.nationality_id', div,'change',self.ChangeNationality);
		bindDiv('.country_id', div,'change',self.ChangeCountry);
		bindDiv('.province_id', div,'change',self.ChangeProvince);
		bindDiv('#btn_save', div,'click',self.Save);
		
		fixSelect();
		setDatePicker();
		setDOB();
	}
	self.validateCountry=function() {
		if ($('.country_id', div).val()==-1) {
			$('.country_name', div).show();
			$('.province_id', div).hide();
			$('.city_id', div).hide();
		} else {
			$('.country_name', div).hide();
			$('.province_id', div).show();
			$('.city_id', div).show();
		}
	}
	self.ChangeNationality=function() {
		if ($('.nationality_id', div).val()==-1) {
			$('.nationality_val', div).show();
		} else {
			$('.nationality_val', div).hide();
		}
	}
	self.ChangeCountry=function() {
		self.validateCountry();
	}
	self.ChangeProvince=function() {		
		$('.city_id',div).empty();			
		$('.city_id',div).append("<option value=''>-City-</option>");
		var city=self.city_option[$('.province_id',div).val()];
		for  (c in city){
			$('.city_id', div).append("<option value='"+city[c]['city_id']+"'>"+city[c]['city_val']+"</option>");
		}
		fixSelect();
		
	}
	self.Save=function() {
		if (!validate_empty_col(div, ['title','first_name','last_name', 'place_of_birth','date_of_birth','nationality_id','address','country_id','post_code','phone1','gender'])) return;
		if ($('#country_id',div).val()==-1) {
			if (!validate_empty_col(div,['country_name'])) return;
		} else {
			if (!validate_empty_col(div,['province_id','city_id'])) return;
		}
		var data ={};
		data['type']='save_personal_data';
		data=prepareDataMultiInput(data, ['title','user_name','email','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','marital_status'
		,'nationality_id','nationality_val','address','country_id','country_name','province_id','city_id'
		,'post_code','phone1','phone2','computer_skills','professional_skills','account_bank','account_number','emergency_phone','emergency_email'], div);
		var success=function(msg) {			
			var d=jQuery.parseJSON(msg);
			if (d['err']) {
				alert(d['err']);
				return;
			}
			$('#btn_upload').trigger('click');
			
		}
		ajax(ajaxPage, data, success);
	}
	
	self.start();
}