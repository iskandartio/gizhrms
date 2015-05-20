<?php
	$rs=db::select_one('email_from',"*");
	$res=db::select('email_setup','*','general=1','email_type');
	
?>
<script src='js/gibberish-aes.min.js'></script>
<script src="js/tinymce/tinymce.min.js"></script>
<script src="js/tinymce/jquery.tinymce.min.js"></script>
<script>
	var fields=generate_assoc(['email_type','email_type_name','email_content']);

	$(function() {

		$.widget("ui.dialog", $.ui.dialog, {
			_allowInteraction: function(event) {
				return !!$(event.target).closest(".mce-container").length || this._super( event );
			}
		});
		$('#show_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true
		});
		bindAll();
	
	
	});
	function bindAll() {

		bind('#btn_save', 'click',Save);
		bind('.btn_email_content', "click", EmailContent);
		bind('.btn_save_email',"click", SaveEmail);
		hideColumnsArr('tbl', ['email_type'],fields);
	}
	function Save() {
		var data={}
		data['type']='save';
		data=prepareDataText(data, ['host','security_type','port','user_name','sender_name']);
		if ($('#pwd').val()=='') {
			data['pwd']="";
		} else {
			data['pwd']=GibberishAES.enc($('#pwd').val(), "giz_hrms_iskandar_tio").replace("\n","");
		}
		var success=function(msg) {
			if (msg!='') alert(msg);
		}
		ajax('email_setting_ajax',data, success);
	}
	function EmailContent() {
		var par=$(this).closest("tr");
		var data={}
		data['type']='show_email';
		data['email_type']=getChild(par, 'email_type', fields);
		var success=function(msg) {
			
			$('#show_detail').html(msg);
			$('#show_detail').dialog("open");
			tiny_setup("#email_content");
			bindAll();
		}
		
		ajax('email_setting_ajax', data, success);
	}
	function SaveEmail() {
		var data={}
		data['type']='save_email';
		data=prepareDataText(data, ['email_type','email_to','email_cc','email_subject','params']);
		data=prepareDataHtml(data,['email_content']);
		var success=function(msg) {
			$('#show_detail').dialog("close");
			
		}
		ajax('email_setting_ajax', data, success);
	}
	
</script>
<span class="label">Host</span> <div class='textbox'><?php _t("host", $rs)?></div>
<span class="label">Security Type</span> <div class='textbox'><?php _t("security_type",$rs)?></div>
<span class="label">Port</span> <div class='textbox'><?php _t("port", $rs)?></div>
<span class="label">User ID</span> <div class='textbox'><?php _t("user_name",  $rs)?></div>
<span class="label">Password</span> <div class='textbox'><?php _t("pwd","","","password")?></div>
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
<div id='show_detail'></div>