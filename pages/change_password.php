<?php
	
?>
<script src="js/sha512.js"></script>
<script>
	$(function() {
		bindAll();
	});
	function bindAll() {
		bind('.btn_change_password','click',ChangePassword);
	}
	function ChangePassword() {
		if ($('#new_password').val()!=$('#confirm_password').val()) {
			alert('confirm password not match!');
			
		}
		var data={}
		data['type']='change_password';
		
		var hash = CryptoJS.SHA512($('#old_password').val());
		data['old_password']=hash.toString();
		hash = CryptoJS.SHA512($('#new_password').val());
		data['new_password']=hash.toString();
		
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