<?php
	$rs=db::select_one('email_from',"*, aes_decrypt(pwd,'iskandar tio') pwd");
	$res=db::select('email_setup','*','general=1','email_type');
?>
<script>
	var fields=generate_assoc(['email_type','email_type_name','email_content']);
	$(function() {
		bindAll();
	});
	function bindAll() {
		$('#show_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		bind('#btn_save', 'click',Save);
		bind('.btn_email_content', "click", EmailContent);
		bind('.btn_save_email',"click", SaveEmail);
		hideColumnsArr('tbl', ['email_type'],fields);
	}
	function Save() {
		var data={}
		data['type']='save';
		data=prepareDataText(data, ['host','security_type','port','user_name','pwd','sender_name']);
		ajax('email_settingAjax.php',data);
	}
	function EmailContent() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='show_email';
		data['email_type']=getChild(par, 'email_type', fields);
		var success=function(msg) {
			$('#show_detail').html(msg);
			$('#show_detail').dialog("open");
			bindAll();
		}
		
		ajax('email_settingAjax.php', data, success);
	}
	function SaveEmail() {
		var data={}
		data['type']='save_email';
		data=prepareDataText(data, ['email_type','email_to','email_subject','params']);
		data=prepareDataHtml(data,['email_content']);
		var success=function(msg) {
			$('#show_detail').dialog("close");
			
		}
		ajax('email_settingAjax.php', data, success);
	}
	
</script>
<span class="label">Host</span> <div class='textbox'><?php _t("host", $rs)?></div>
<span class="label">Security Type</span> <div class='textbox'><?php _t("security_type",$rs)?></div>
<span class="label">Port</span> <div class='textbox'><?php _t("port", $rs)?></div>
<span class="label">User ID</span> <div class='textbox'><?php _t("user_name",  $rs)?></div>
<span class="label">Password</span> <div class='textbox'><?php _t("pwd",$rs,"","password")?></div>
<span class="label">Sender Name</span> <div class='textbox'><?php _t("sender_name", $rs)?></div>
<span><?php _t("btn_save","Save","","button","button_link")?></span>

<table class='tbl' id='tbl'>
<thead>
<tr><th></th><th>Email Type</th><th></th></tr>
</thead>
<?php foreach ($res as $rs) {
	_p("<tr><td>".$rs['email_type']."<td>".$rs['email_type_name']."</td><td><button class='btn_email_content'>Email Content</button></tr></tr>");
}?>

</table>
<div id='show_detail'/>