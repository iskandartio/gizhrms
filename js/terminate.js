function terminate(div, ajaxPage) {
	var self=this;
	self.start=function() {
		bindDiv('.btn_calculate', div, 'click', self.Calculate);
		setDatePicker();
	}
	self.Calculate=function() {
		var data={}
		data['type']='calculate_severance';
		data['terminate_date']=$('#terminate_date',div).val();
		var success=function(msg) {
			$('#div_severance_data').html(msg);
			self.bindSeveranceData();
		}
		
		ajax(ajaxPage,data, success);
	}
	
	self.bindSeveranceData=function() {
		$('#change_severance',div).bind('click', self.ChangeSeverance);
		$('#terminate',div).bind('click', self.Terminate);
		$('#cancel_change',div).bind('click', self.CancelChange);
		numeric($('.new_severance'), div);
	}
	self.ChangeSeverance=function() {
		$('#div_severance').show();
	}
	self.Terminate=function() {
		if (!confirm("Are you sure to terminate?")) return;
		
		var data={}
		data['type']='terminate';
		if ($('#new_severance',div).val()=='') {
			$('#new_severance',div).val($('.severance',div).html());
		}
		data['new_severance']=cNum($('#new_severance',div).val());
		data['severance']=cNum($('.severance',div).html());
		data['service']=cNum($('.service',div).html());
		data['housing']=cNum($('.housing',div).html());
		data['reason']=$('#reason',div).val();
		data['terminate_date']=$('.terminate_date',div).val();
		
		var success=function(msg) {
			location.reload();
		}
		ajax(ajaxPage,data,success);
	}
	self.CancelChange=function() {
		$('#new_severance',div).val('');
		$('#reason',div).val('');
		$('#div_severance',div).hide();
	}

	self.start();
}