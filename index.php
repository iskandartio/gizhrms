<?php

require "pages/startup.php";

require_once('libs/URLParse.php'); 


$name = URLParse::ProcessURL();
if ($name=='') {
	$_SESSION['home']=$_SERVER['REQUEST_SCHEME']."://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
}
$activation_email= (isset($_SESSION['activation_email'])? $_SESSION['activation_email'] : '');
$_SESSION['activation_email']="";


$_SESSION['page_name']=$name;

if ($name=='activate'){
	URLParse::IncludePageContents();
	die;
}
if ($name=='uploadajax'||$name=='show_picture'||$name=='test') {
	URLParse::IncludePageContents();
	die;
}
if ($name==''||$name=='activate') {
	
	unset($_SESSION['uid']);
	
	//file_put_contents("log.txt", "");
}
shared::contract_reminder_email();

function set_session_menu($menu) {
	if (isset($_SESSION[$menu])) {		
		if ($_SESSION[$menu]=="true") {
			_p("$('#$menu img').attr('src', 'images/collapse_alt.png');");
			_p("$('#$menu').next().show();");
		} else {
			_p("$('#$menu img').attr('src', 'images/expand_alt.png');");
			_p("$('#$menu').next().hide();");
		}
		
	}
}
			
header('Content-Type: text/html; charset=utf-8');

?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><?php 
                $title = URLParse::getPageTitle($name);
                echo "GIZ HRMS";
    ?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2">

    <meta name="description" content="<?php 
                $metd = URLParse::getPageMetaDescription($name);
                echo htmlspecialchars($metd, ENT_QUOTES);
    ?>" />
    <meta name="keywords" content="<?php 
                $metk = URLParse::getPageMetaKeywords($name);
                echo htmlspecialchars($metk, ENT_QUOTES);
    ?>" />
	<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/general.js"></script>
	<script src="js/numeric.js"></script>

	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>

	<link rel="stylesheet" href="css/default.css"/>
<?php if ($name==''||$name=='activate') {
	?>
	<script>
		$(function() {
			bind('#btn_login','click',Login);
			send_email();
		});
		function ChangeCaptchaText() {
			$('#captcha img').attr('src','captcha');
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
			data=prepareDataText(data,['email','password','captcha_text']);
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
<?php } else {?>
	<script>
		var alwaysHide=false;
		$(function() {
			var maxWidth="<?php _p(URLParse::getMaxWidth($name));?>";
			if ($(window).width()<maxWidth) {
				AlwaysHideMenu();
				alwaysHide=true;
			}
			bind('.btn_collapse',"click", ExpandCollapse);
			bind('.btn_menu','click',ShowMenu);
			bind('.btn_hide','click',HideMenu);
			<?php
				set_session_menu("menu_master");
				set_session_menu("menu_report");
				set_session_menu("menu_administation");
			?>
			
			$('.btn_hide').hide();
		});
		function ShowMenu() {
			$('#freeze').show();
			$('div#menu').attr('class', 'menu menu2');
			$('div#menu').show();
			$('.btn_hide').show();
			bind('#freeze','click',HideMenu);
		}
		function HideMenu() {
			$('#freeze').hide();
			if (alwaysHide) {
				AlwaysHideMenu();
			} else {
				$('div#menu').attr('class', 'menu');
				$('div#menu').hide();
				$('.btn_hide').hide();
				
			}
		}
		function AlwaysHideMenu() {
			$('div#menu').attr('class', 'menu2');
			$('div#menu').hide();
			$('div#pagecontent').attr('class','pagecontent small_left_margin');
			$('.btn_menu').show();
			
		}
		function ExpandCollapse() {
			var data={}
			data['type']="set_session";
			data['session_key']=$(this).parent().attr("id");
			data['session_value']=$(this).attr("src")=="images/expand_alt.png";
			var obj=$(this);
			var success=function(msg) {
				if ($(obj).attr("src")=="images/expand_alt.png") {
					$(obj).parent().next().show();
					$(obj).attr("src", "images/collapse_alt.png");
					$(obj).attr("title", "Collapse");
				} else {
					$(obj).parent().next().hide();
					$(obj).attr("src", "images/expand_alt.png");
					$(obj).attr("title", "Expand");
					
				}
				if ($('#menu').css('display')=='none') {
					$('#freeze').css('display','block');
				}
			}
			ajax('index_ajax', data, success);
			
		}
	</script>
<?php } ?>
	<script>
		$(function() {
			$('#freeze').hide();
		});
	</script>
	
</head>
<body>
	<div align="center">
	<img class="logoimg" src="images/logo.png" alt="PAKLIM">
    <img class="logoimg" src="images/logo_web.jpg" alt="">
	</div>
	<div id="freeze" style="position: fixed; top: 0px; left: 0px; z-index: 1000; opacity: 0.6; width: 100%; height: 100%; color: white; background-color: black;"></div>
<?php if ($name==''||$name=='activate') {?>
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
		
	
<?php
		die;
	}?>

	

<?php if ($_SESSION['role_name']=='applicant') {?>
	<div id="menu" class='menu'>
		<?php _p(getImageTags(array('hide')))?>
		<span>Application Data</span>
		<div style="margin:5px">
		<ul>
			<li><a href="/gizhrms/position_applied">Position Applied</a></li>
			<li><a href="/gizhrms/applicant">Personal Details</a></li>
			<li><a href="/gizhrms/education">Education</a></li>
			<li><a href="/gizhrms/working">Working Experience</a></li>
			<li><a href="/gizhrms/language">Language</a></li>
			<li><a href="/gizhrms/references">References</a></li>
			<li><a href="/gizhrms/uploadcv">Upload CV + Cover Letter</a></li>
			<li><a href="/gizhrms/change_password">Change Password</a></li>
			<li><a href="/gizhrms">Logout</a></li>
		</ul>
		
		</div>
	</div>
<?php } else if ($_SESSION['role_name']=='admin') {?>
	<div id="menu" class='menu'>
		<?php _p(getImageTags(array('hide')))?>
		<span id='menu_master'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Master Data</span>
		<ul>
		<li><a href="/gizhrms/project">Project</a></li>
		<li><a href="/gizhrms/email_setting">Email Setting</a></li>
		<li><a href="/gizhrms/region">Region</a></li>
		<li><a href="/gizhrms/gender">Gender</a></li>
		<li><a href="/gizhrms/location">Interview Location</a></li>
		<li><a href="/gizhrms/vacancy_progress">Recruitment Process</a></li>
		<li><a href="/gizhrms/settings">Settings</a></li>
		</ul>
		
		<span id='menu_report'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Report</span>
		<ul>
		<li><a href="/gizhrms/statistics">Statistics</a></li>
		</ul>
		<span id='menu_administration'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Administration</span>
		<ul>
		<li><a href="/gizhrms/employee">Employee</a></li>
		<li><a href="/gizhrms/salary">Salary Adjustment</a></li>
		<li><a href="/gizhrms/contract_termination">Contract Termination</a></li>
		</ul>
		
		<span id='menu_medical'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Medical</span>
		<ul>
		<li><a href="/gizhrms/outpatient">Outpatient</a></li>
		<li><a href="/gizhrms/eyeglasses">Eyeglasses</a></li>
		<li><a href="/gizhrms/pregnancy">Pregnancy</a></li>
		<li><a href="/gizhrms/medical_checkup">Medical Checkup</a></li>
		<li><a href="/gizhrms/medical_summary">Summary</a></li>
		</ul>
		<span id='menu_recruitment'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Recruitment</span>
		<ul>
		<li><a href="/gizhrms/vacancy">Vacancy</a></li>
		<li><a href="/gizhrms/question">Question</a></li>
		<li><a href="/gizhrms/filter">Filter Applicants</a></li>
		<li><a href="/gizhrms/call_interview">Call for Interview</a></li>
		<li><a href="/gizhrms/accept_employee">Accept as Employee</a></li>
		<li><a href="/gizhrms/summary">Recruitment Summary</a></li>
		<li><a href="/gizhrms/change_password">Change Password</a></li>
		<li><a href="/gizhrms">Logout</a></li>
		</ul>
		
	</div>
<?php } else if ($_SESSION['role_name']=='employee') {?>	
	<div id="menu" class='menu'>
		<span>Administration</span>
		<div style="margin:5px">
		<ul>
		<li><a href="/gizhrms/recruitment">Recruitment</a></li>
		<li><a href="/gizhrms/recruitment_report">Recruitment Report</a></li>
		<li><a href="/gizhrms/change_password">Change Password</a></li>
		<li><a href="/gizhrms">Logout</a></li>
		</ul>
		</div>
	</div>
<?php }?>
	<?php _p(getImageTags(array('menu')))?>
	
    
	<div id="pagecontent" class='pagecontent'>
		
		<h3 id='title'><?php _p($title)?></h3>
	
		<div style="margin:5px">
        <?php
            URLParse::IncludePageContents();
        ?>
		</div>
    </div>

</body>
</html>
