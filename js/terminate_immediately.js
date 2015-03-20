var div=$('#div_terminate');
function bindTerminate() {
	setDatePicker();
	$('.btn_calculate', div).bind('click', jsCalculateSeverance);
}
function jsCalculateSeverance() {
	var data={}
	data['type']='calculate_severance';
	data['terminate_date']=$('#terminate_date',div).val();
	var success=function(msg) {
		$('#div_severance_data').html(msg);
		bindSeveranceData();
	}
	ajax("employee_ajax",data, success);
}
function bindSeveranceData() {
	$('#change_severance',div).bind('click', jsChangeSeverance);
	$('#terminate',div).bind('click', jsTerminate);
	$('#cancel_change',div).bind('click', jsCancelChange);
	
}
function jsChangeSeverance() {
	$('#div_severance').show();
}
function jsTerminate() {
	if (!confirm("Are you sure to terminate?")) return;
	var data={}
	data['type']='terminate';
	if ($('#new_severance',div).val()=='') {
		$('#new_severance',div).val($('.severance',div).html());
	}
	data['new_severance']=cNum($('#new_severance',div).val());
	data['severance']=cNum($('.severance',div).html());
	data['service']=cNum($('.service',div).html());
	data['reason']=$('#reason',div).val();
	data['terminate_date']=$('.terminate_date',div).val();
	
	var success=function(msg) {
		$(div).dialog("close");
		loadData();
	}
	ajax('contract_termination_ajax',data,success);
}
function jsCancelChange() {
	$('#new_severance',div).val('');
	$('#reason',div).val('');
	$('#div_severance',div).hide();
}