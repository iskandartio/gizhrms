<?php

?>
<script src='js/projectView.js'></script>
<script>

	$(function() {
		bindAll();
		loadData();
	});
	function bindAll() {
		bind('.btn_stop','click',ShowStop);
		bind('.btn_recontract','click', ShowRecontract);
		$('#recontract_detail').dialog({
			autoOpen:false,
			height:550,
			width:750,
			modal:true
		});
		$('#stop_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		bind('#change_severance','click', ChangeSeverance);
		bind('#cancel_change','click', CancelChange);
		bind('#terminate','click', Stop);
		fixSelect();
		numeric($('#salary'));
		numeric($('#new_severance'));
		setDatePicker();
	}
	function ChangeSeverance() {
		$('#div_severance').show();
	}
	function CancelChange() {
		$('#new_severance').val('');
		$('#reason').val('');
		$('#div_severance').hide();
	}
	function Stop() {
		if (!confirm("Are you sure to stop contract?")) return;
		var data={}
		data['type']='stop';
		if ($('#new_severance').val()=='') {
			$('#new_severance').val($('.severance').html());
		}
		data['new_severance']=cNum($('#new_severance').val());
		data['severance']=cNum($('.severance').html());
		data['service']=cNum($('.service').html());
		data['housing']=cNum($('.housing').html());
		data['reason']=$('#reason').val();
		
		var success=function(msg) {
			$('#stop_detail').dialog("close");
			location.reload();
		}
		ajax('contract_expiring_ajax',data,success);
	}
	
	function ShowStop() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='show_stop';
		data['user_id']=par.children("td:eq(0)").html();
		var success=function(msg) {
			$('#stop_detail').html(msg);
			$('#stop_detail').dialog("open");
			bindAll();
			
		}
		ajax('contract_expiring_ajax',data, success);
	}
	var user_id=0;
	function ShowRecontract() {
		var par=$(this).closest("tr");
		var data={};
		data['type']='show_recontract';
		data['user_id']=par.children("td:eq(0)").html();
		user_id=data['user_id'];
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#recontract_detail').html(d['result']);
			$('#recontract_detail').dialog("open");
			var a=new projectView("#recontract_detail", beforeSave, afterSave,"contract_expiring_ajax");
			a.project_name_choice=d['project_name_choice'];
			a.type='save_recontract';
			
			
		};
		var beforeSave=function() {
			if (!validate_empty_col($('#recontract_detail'), ['start_date','end_date'])) return false;
			return true;
		}
		var afterSave=function(msg) {
			if (msg!='') {
				alert(msg);
			} else {
				location.reload();
			}
		}
		ajax("contract_expiring_ajax", data, success);
	}

	function loadData() {
		var data={}
		data['type']='search_expiring';
		var success=function(msg) {
			$('#search_expiring_result').html(msg);
			bindAll();
			hideColumns('tbl');
		}
		ajax('contract_expiring_ajax', data, success);
	}

</script>
<div id='search_expiring_result'>
</div>

<div id="stop_detail"></div>
<div id="recontract_detail"></div>
