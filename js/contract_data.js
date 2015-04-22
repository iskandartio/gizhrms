function contract_data(div, ajaxPage) {
	var self=this;
	self.start=function() {
		bindDiv('#contract1_end_date',div,'change', self.ValidateFirstEndDate);
		bindDiv('#am1_end_date',div,'change',self.ValidateAm1EndDate);
		bindDiv('#contract2_end_date',div,'change',self.ValidateSecondEndDate);
		bindDiv('#am2_end_date',div,'change',self.ValidateAm2EndDate);
		bindDiv('#btn_save',div,'click', self.SaveContractData);
		$('input[id$="end_date"]',div).each(function(idx) {
			if ($(this).val()!="") {
				$(this).prop('disabled',true);
			}
		});
		$('input[id$="start_date"]',div).each(function(idx) {
			if ($(this).val()!="") {
				$(this).prop('disabled',true);
			}
		});
		setDatePicker();
	}
	self.SaveContractData=function() {
		if (!self.validateContractLength('contract1_start_date','contract1_end_date',2))  return;
		if (!self.validateContractLength('contract1_start_date','am1_end_date',2))  return;
		if (!self.validateContractLength('contract2_start_date','contract2_end_date',1))  return;
		if (!self.validateContractLength('contract2_start_date','am2_end_date',1))  return;

		var data={}
		data['type']="save_contract_detail";
		data=prepareDataMultiInput(data, ['contract1_start_date','contract1_end_date','am1_start_date','am1_end_date'
		,'contract2_start_date','contract2_end_date','am2_start_date','am2_end_date'], div);
		var success=function(msg) {
			if (msg=='Failed') {
				alert(msg);
			}
			var d=jQuery.parseJSON(msg);
			$('#projected_severance',div).val(d['severance']);
			$('#projected_service',div).val(d['service']);
			$('#projected_housing',div).val(d['housing']);
			$('#contract_graph>tbody>tr>td:eq(0)',div).html(d['first']);
			$('#contract_graph>tbody>tr>td:eq(1)',div).html(d['second']);
			self.start();
		}
		ajax(ajaxPage,data,success);
	}
	self.validateContractLength=function(d1, d2, y) {
		if ($('#'+d2,div).length==0) return true;
		if ($('#'+d2,div).datepicker('getDate')==null) return true;
		var dateMin=$('#'+d1,div).datepicker('getDate');
		var rMax = new Date(dateMin.getFullYear() + y, dateMin.getMonth(),dateMin.getDate() - 1); 
        if (rMax<$('#'+d2,div).datepicker('getDate')) {
			if (d1=='contract1_start_date') {
				alert('First Period Contract can not more then 2 years');
			} else {
				alert('Extension Period Contract can not more then 1 years');
			}
			return false;
		}
		return true;
	}
	self.ValidateFirstEndDate=function() {
		self.validateContractLength('contract1_start_date', 'contract1_end_date', 2);
	}
	self.ValidateAm1EndDate=function () {
		self.validateContractLength('contract1_start_date', 'am1_end_date', 2);
	}
	self.ValidateSecondEndDate=function() {
		self.validateContractLength('contract2_start_date', 'contract2_end_date', 1);
	}
	self.ValidateAm2EndDate=function () {
		self.validateContractLength('contract2_start_date', 'am2_end_date', 1);
	}
	this.start();
}