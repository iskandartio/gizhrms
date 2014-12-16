<!DOCTYPE html>
<?php
require "pages/autoload.php";
require "pages/startup.php";

require_once('libs/URLParse.php'); 

$activation_email= (isset($_SESSION['activation_email'])? $_SESSION['activation_email'] : '');
$_SESSION['activation_email']="";
$name = URLParse::ProcessURL();
if ($name=='') {
	
	unset($_SESSION['uid']);
	
	//file_put_contents("log.txt", "");
}
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
?>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><?php 
                $title = URLParse::getPageTitle($name);
                echo "GIZ HRMS";
    ?></title>
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
<?php if ($name=='') {?>
	<script>
		
		$(function() {
			bind('#btn_login','click',Login);
			
			
		});
		
		function new_registrant() {
			$('#tr_confirm_password').show();
			$('#tr_new_applicant').hide();
			$('#tr_already_registered').show();
			$('#tr_forgot_password').show();
			$('#tr_password').show();
			
			
			tag="<img src='captcha.php'/><p>Input the word above:</br><input type='text' id='captcha_text'/>";
			$('#captcha').html(tag);
			$('#btn_login').html("Register");
		}
		function forgot_password() {
			$('#tr_confirm_password').hide();
			$('#tr_new_applicant').show();
			$('#tr_already_registered').show();
			$('#tr_forgot_password').hide();
			$('#tr_password').hide();
			
			tag="<img src='captcha.php'/><p>Input the word above:</br><input type='text' id='captcha_text'/>";
			$('#captcha').html(tag);
			$('#btn_login').html("Forgot Password");
			
			
			
		}
		function already_registered() {
			$('#tr_confirm_password').hide();
			$('#tr_new_applicant').show();
			$('#tr_already_registered').hide();
			$('#tr_forgot_password').show();
			$('#tr_password').show();
			
			$('#btn_login').html("Login");
			var data={}
			data['type=']="get_captcha_text";
			var success=function(msg) {
				$('#captcha').html(msg);
			}
			ajax('indexAjax.php', data, success);
			
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
					return;
				}
				location.href=obj['url'];
			}		
			ajax("indexAjax.php", data, success);
			
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
					$(obj['focus']).focus();
		
					return;
				}
				already_registered();
				
				$.ajax({
					type : "post",
					url : "send_email.php"						
				});
				
			}		
			ajax("indexAjax.php", data, success);
			
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
					$(obj['focus']).focus();
					return;
				}
				already_registered();
				$.ajax({
					type : "post",
					url : "send_email.php"						
				});
			}
			ajax("indexAjax.php", data, success);
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
		$(function() {
			$('.btn_collapse').bind("click", ExpandCollapse);
			<?php
				set_session_menu("menu_master");
				set_session_menu("menu_report");
				set_session_menu("menu_administation");
			?>
			
		});
		function ExpandCollapse() {
			var data={}
			data['type']="set_session";
			data['session_key']=$(this).parent().attr("id");
			data['session_value']=$(this).attr("src")=="images/expand_alt.png";
			ajax('indexAjax.php', data);
			if ($(this).attr("src")=="images/expand_alt.png") {
				$(this).parent().next().show();
				$(this).attr("src", "images/collapse_alt.png");
				$(this).attr("title", "Collapse");
			} else {
				$(this).parent().next().hide();
				$(this).attr("src", "images/expand_alt.png");
				$(this).attr("title", "Expand");
				
			}
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
	
	<div id="freeze" style="position: absolute; top: 0px; left: 0px; z-index: 1000; opacity: 0.6; width: 100%; height: 100%; color: white; background-color: black;"></div>
<?php if ($name=='') {?>
	<table id="tbl_login">
		<tbody>
		
		<tr id='tr_new_applicant'><td colspan="3">New Applicant click <span class='span_link' onclick='new_registrant()'>here</span></td></tr>
		<tr id='tr_forgot_password'><td colspan="3">Forgot Password click <span class='span_link' onclick='forgot_password()'>here</span></td></tr>
		<tr id='tr_already_registered' style="display:none"><td colspan="3">Already registered click <span class='span_link' onclick='already_registered()'>here</span></td></tr>
		<tr><td>Email</td><td>:</td><td><?php _t("email", $activation_email) ?></td></tr>
		<tr id='tr_password'><td>Password</td><td>:</td><td><?php _t("password","","","password") ?></td></tr>
		<tr style="display:none" id='tr_confirm_password'><td>Confirm Password</td><td>:</td><td><?php _t("confirm_password","","","password") ?></td></tr>
		</tbody>
		<tfoot>
		<tr><td colspan="3"><div id='captcha'>
				<?php _p($captcha_tag)?>
			</div>
			<button class='button_link' id='btn_login'>Login</button>
		</td></tr>
		</tfoot>
	</table>
		
<?php
		die;
	}?>
</div>
	
<div align="center">
<?php if ($_SESSION['role_name']=='applicant') {?>
	<div id="menu">
		<span>Application Data</span>
		<table style="margin:5px">
		<tr><td><a href="/gizhrms/position_applied">Position Applied</a></td></tr>
		<tr><td><a href="/gizhrms/applicant">Personal Details</a></td></tr>
		<tr><td><a href="/gizhrms/education">Education</a></td></tr>
		<tr><td><a href="/gizhrms/working">Working Experience</a></td></tr>
		<tr><td><a href="/gizhrms/language">Language</a></td></tr>
		<tr><td><a href="/gizhrms/references">References</a></td></tr>
		<tr><td><a href="/gizhrms/uploadcv">Upload CV + Cover Letter</a></td></tr>
		<tr><td><a href="/gizhrms">Logout</a></td></tr>
		</table>
	</div>
<?php } else if ($_SESSION['role_name']=='admin') {?>
	<div id="menu" style="width:175px">
		<span id='menu_master'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Master Data</span>
		<ul>
		<li><a href="/gizhrms/region">Region</a></li>
		<li><a href="/gizhrms/province">Province</a></li>
		<li><a href="/gizhrms/city">City</a></li>
		<li><a href="/gizhrms/nationality">Nationality</a></li>
		<li><a href="/gizhrms/gender">Gender</a></li>
		<li><a href="/gizhrms/location">Location</a></li>
		<li><a href="/gizhrms/vacancy_progress">Recruitment Process</a></li>
		</ul>
		
		<span id='menu_report'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Report</span>
		<ul>
		<li><a href="/gizhrms/statistics">Statistics</a></li>
		</ul>
		<span id='menu_administration'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Administration</span>
		
		<ul>
		<li><a href="/gizhrms/employee">Employee</a></li>
		<li><a href="/gizhrms/vacancy">Vacancy</a></li>
		<li><a href="/gizhrms/question">Question</a></li>
		<li><a href="/gizhrms/filter">Filter Applicants</a></li>
		<li><a href="/gizhrms/summary">Recruitment Summary</a></li>
		<li><a href="/gizhrms">Logout</a></li>
		</ul>
		
	</div>
<?php } else if ($_SESSION['role_name']=='employee') {?>
	<div id="menu">
		<span>Administration</span>
		<table style="margin:5px">
		<tr><td><a href="/gizhrms/filter">Filter Applicants</a></td></tr>
		<tr><td><a href="/gizhrms/recruitment_report">Recruitment Report</a></td></tr>
		<tr><td><a href="/gizhrms">Logout</a></td></tr>
		</table>
	</div>
<?php }?>
    <div id="pagecontent">
		<h3 id='title'><?php _p($title)?></h3>
		<table style="margin:5px"><tr><td>
        <?php
            URLParse::IncludePageContents();
        ?>
		</td></tr></table>
    </div>
</div>

</body>
</html>
