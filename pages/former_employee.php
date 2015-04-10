<?php
	
?>
<script>
	$(function() {
		loadData();
	});
	function loadData() {
		var data={}
		data['type']='load';
		var success=function(msg) {
			$('#div_result').html(msg);
		}
		ajax('former_employee_ajax', data, success);
	}
</script>

<div id='div_result'>
</div>