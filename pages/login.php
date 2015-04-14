<script src="js/sha512.js"></script>

<script>
	$(function() {
		bind('#btn_login','click',Login);
		send_email();
	});
	function ChangeCaptchaText() {
		$('#captcha img').attr('src','captcha_ajax');
		$('#captcha_text').focus();
	}
	function new_registrant() {
		$('#div_confirm_password').show();
		$('#div_new_applicant').hide();
		$('#div_already_registered').show();
		$('#div_forgot_password').show();
		$('#div_password').show();
		
		tag="<?php _p(shared::get_captcha_string())?>";
		$('#captcha').html(tag);
		
		$('#btn_login').html("Register");
		bind('#change_captcha_text','click',ChangeCaptchaText);
		
	}
	function forgot_password() {
		$('#div_confirm_password').hide();
		$('#div_new_applicant').show();
		$('#div_already_registered').show();
		$('#div_forgot_password').hide();
		$('#div_password').hide();
		
		tag="<?php _p(shared::get_captcha_string())?>";
		$('#captcha').html(tag);
		bind('#change_captcha_text','click',ChangeCaptchaText);
		$('#btn_login').html("Forgot Password");
		
		
		
	}
	function already_registered() {
		$('#div_confirm_password').hide();
		$('#div_new_applicant').show();
		$('#div_already_registered').hide();
		$('#div_forgot_password').show();
		$('#div_password').show();
		
		$('#btn_login').html("Login");
		var data={}
		data['type']="get_captcha_text";
		var success=function(msg) {
			$('#captcha').html(msg);
			bind('#change_captcha_text','click',ChangeCaptchaText);
		}
		ajax('index_ajax', data, success);
		
	}
	function Login() {
		var type=$('#btn_login').html();
		if (type=='Login') {
			loginAjax(this);
			return;
		}
		if (type=='Register') {
			registerAjax(this);
			return;
		}
		if (type=='Forgot Password') {
			forgotPasswordAjax(this);
			return;
		}
	}

	function loginAjax(o) {
		if (!validate_empty(['email','password','captcha_text'])) return;
		$('#freeze').show();
		var data={};
		data['type']='login';
		var hash = CryptoJS.SHA512($('#password').val());
		data['password']=hash.toString();
		data['random_key']="<?php _p($_SESSION['random_key'])?>";
		data=prepareDataText(data,['email','captcha_text']);
		
		var success=function(msg) {
			
			obj = jQuery.parseJSON(msg);
			$('#freeze').hide();
			if (obj['err']!='')  {
				alert(obj['err']);
				
				$('#captcha').html(obj['captcha_tag']);
				bind('#change_captcha_text','click',ChangeCaptchaText);
				return;
			}
			location.href=obj['url'];
		}		
		ajax("index_ajax", data, success);
		
	}
	function registerAjax(o) {
		if (!validate_empty(['email','password','confirm_password','captcha_text'])) return;
		$('#freeze').show();
		var data={};
		data['type']='register';
		data=prepareDataText(data,['email','password','confirm_password','captcha_text']);
		var success=function(msg) {	
			obj = jQuery.parseJSON(msg);
			
			if (obj['err']!='')  {
				alert(obj['err']);
				$('#captcha').html(obj['captcha_tag']);
				bind('#change_captcha_text','click',ChangeCaptchaText);
				$(obj['focus']).focus();
	
				return;
			}
			already_registered();
			send_email();
			alert('Thank you for the registration. The activation link has been sent to your email.  You could login after you click confirmation link from your email to activate the account');
		}		
		ajax("index_ajax", data, success);
		
	}
	
	function forgotPasswordAjax(o) {
		if (!validate_empty(['email','captcha_text'])) return;
		$('#freeze').show();
		var data={};
		data['type']='forgotPassword';
		data=prepareDataText(data,['email','captcha_text']);
		var success= function(msg) {
			obj = jQuery.parseJSON(msg);
			$('#freeze').hide();
			if (obj['err']!='')  {
				alert(obj['err']);
				$('#captcha').html(obj['captcha_tag']);
				bind('#change_captcha_text','click',ChangeCaptchaText);
				$(obj['focus']).focus();
				return;
			}
			already_registered();
			send_email();

		}
		ajax("index_ajax", data, success);
	}
	function validateEmail(email) { 
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	} 

	function validatePassword(fld) {
		var error = "";
		
		if (fld.val() == "") {
			fld.css('background','Yellow');
			error = "You didn't enter a password.\n";
		} else if ((fld.val().length < 7) || (fld.val().length > 15)) {
			error = "The password is the wrong length. \n";
			fld.css('background','Yellow');
		} else if (!(/[0-9]+/.test(fld.val()) && /[a-z]+/.test(fld.val()) && /[A-Z]+/.test(fld.val()))) {
			error = "The password must contain at least one upper case, one lower case and one number .\n";
			fld.css('background','Yellow');
		} else {
			fld.css('background','White');
		}
	   return error;
	} 
</script>

<div class='middle_div'>
	<div id='div_new_applicant'>New Applicant click <span class='span_link' onclick='new_registrant()'>here</span></div>
	<div id='div_forgot_password'>Forgot Password click <span class='span_link' onclick='forgot_password()'>here</span></div>
	<div id='div_already_registered' style="display:none">Already registered click <span class='span_link' onclick='already_registered()'>here</span></div>
	<div class='label'>Email</div><div class='textbox'><?php _t("email", $activation_email) ?></div>
	<div id='div_password'><div class='label'>Password</div><div class='textbox'><?php _t("password","","","password") ?></div></div>
	<div style="display:none" id='div_confirm_password'><div class='label'>Confirm Password</div><div class='textbox'><?php _t("confirm_password","","","password") ?></div></div>
	<div><div id='captcha'>
			<?php _p($captcha_tag)?>
			
		</div>
		<button class='button_link' id='btn_login'>Login</button>
	</div>		
</div>	
