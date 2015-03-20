<?php
	
?>
<script>
	$(function() {
		bindAll();
	});
	function bindAll() {
		bind('.btn_change_password','click',ChangePassword);
	}
	function ChangePassword() {
		var data={}
		data['type']='change_password';
		data=prepareDataText(data, ['old_password','new_password','confirm_password']);
		if (data['new_password']!=data['confirm_password']) {
			alert('confirm password not match!');
			//return;
		}
		var success=function(msg) {
			if (msg!='') alert(msg);
		}
		ajax("change_password_ajax",data, success);
	}
</script>
<div class='row'><div class='label'>Old Password</div><div class='textbox'><?php _t("old_password","","","password")?></div></div>
<div class='row'><div class='label'>New Password</div><div class='textbox'><?php _t("new_password","","","password")?></div></div>
<div class='row'><div class='label'>Confirm Password</div><div class='textbox'><?php _t("confirm_password","","","password")?></div></div>
<button class='button_link btn_change_password'>Change Password</button>