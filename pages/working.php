<?php
?>
<script src='js/working.js'></script>
<script>
	var ajaxPage="working_ajax";
	$(function() {
		loadWorking();
		bind('.no_working_exp','click',NoWorkingExp);
	});
	function loadWorking() {
		if ($('#div_working').html()!='') return;
		var afterSave=function(msg) {
			location.reload();
		}
		var data={}
		data['type']='load_working';
		var success=function(msg) {
			if (msg=="0") {
				alert('You have no working experience');
			}
			var d=jQuery.parseJSON(msg);
			$('#div_working').html(d['result']);
			var a=new working($("#div_working"), ajaxPage,afterSave);
			a.tbl='applicants';
		}
		ajax(ajaxPage, data, success);
	}
	function NoWorkingExp() {
		var data={}
		data['type']='no_working_exp';
		var success=function(msg) {
			location.reload();
		}
		ajax(ajaxPage, data, success);
	}
</script>

<div id='div_working'></div>