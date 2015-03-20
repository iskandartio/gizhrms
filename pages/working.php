<?php
?>
<script>
	$(function() {
		loadWorking();
	});
	function loadWorking() {
		if ($('#div_working').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#div_working').html(d['result']);
			var a=new working($("#div_working"));
			
		}
		ajax("working_ajax", data, success);
	}

</script>
<div id='div_working'></div>