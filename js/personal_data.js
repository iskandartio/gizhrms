function personal_data(div, saveFunc) {	
	var self=this;
	
	self.start= function() {
		self.validateCountry();
		bindDiv('.country_id', div,'change',self.ChangeCountry);
		bindDiv('.province_id', div,'change',self.ChangeProvince);
		bindDiv('#btn_save', div,'click',self.Save);
		bindDiv('#btn_upload', div,'click',self.Upload);
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
		if (!validate_empty_col(div, ['first_name','last_name', 'user_name', 'place_of_birth','date_of_birth','nationality_id','address','country_id','post_code','phone1'])) return;
		if ($('#country_id',div).val()==-1) {
			if (!validate_empty_col(div,['country_name'])) return;
		} else {
			if (!validate_empty_col(div,['province_id','city_id'])) return;
		}
		var data ={};
		data['type']='save';
		data=prepareDataMultiInput(data, ['applicants_id','user_name','first_name','last_name', 'place_of_birth','date_of_birth', 'gender','marital_status'
		,'nationality_id','address','country_id','country_name','province_id','city_id'
		,'post_code','phone1','phone2','computer_skills','professional_skills','account_bank','account_number','emergency_phone','emergency_email'], div);
		var success=function(msg) {			
			var d=jQuery.parseJSON(msg);
			if (d['err']) {
				alert(d['err']);
				return;
			}
			if (d['type']=='register') {
				ajax("send_email");
			}
			$('#applicants_id',div).val(d['id']);
			self.Upload();
			if (saveFunc) saveFunc(msg);
		}
		ajax("personal_data_ajax", data, success);
	}
	
	self.Upload=function() {
		if($("#uploadPhoto", div).val() == ''){
			return false;
		}
		$.ajax({
			url: "upload_ajax",
			type: 'POST',
			data: new FormData($('#data', div)[0]),
			async: false,
			success: function (data) {
				alert(data);
				$('#photo',div).attr('src','show_picture');
				return false;
			},
			cache: false,
			contentType: false,
			processData: false
		});
	}
	self.start();
}