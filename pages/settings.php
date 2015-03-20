<?php
$res=db::select('settings','*');
?>
<script>
	var fields=generate_assoc(['setting_name','setting_val']);
	$(function() {
		bindAll();
	});
	function bindAll() {
		bind('.btn_save','click',Save);
	}
	function Save() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='save';
		data=prepareDataHtml(data,['setting_name'],par,fields);
		data=prepareDataText(data,['setting_val'],par, fields);
		var success=function(msg) {
			if (msg!='') {
				alert(msg);
			}
		}
		ajax('settings_ajax', data, success);
	}
</script>
<table class='tbl'>
<thead><tr><th>Setting Name</th><th>Setting Value</th><th></th></tr><tbody>
	<?php
	foreach ($res as $rs) {
		_p("<tr><td>".$rs['setting_name']."</td><td>"._t2("setting_val",$rs['setting_val'])."</td><td>".getImageTags(['save'])."</td></tr>");
	}?>
</tbody></table>