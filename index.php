<?php

require "pages/autoload.php";
require "pages/startup.php";
require_once('libs/URLParse.php'); 

$name = URLParse::ProcessURL();
if ($name=='') {
	
	unset($_SESSION);	
	
	file_put_contents("log.txt", "");
}

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
	<link rel="stylesheet" href="css/default.css"/>
<?php if ($name=='') {?>
	<script>
		$(function() {
			bind('#btn_login','click',Login);
			bind('#btn_register','click', Register);
			
			
		});
		function new_registrant() {
			$('#tr_confirm_password').show();
			$('#tr_new_applicant').hide();
			$('#tr_already_registered').show();
			$('#btn_register').show();
			$('#btn_login').hide();
		}
		function already_registered() {
			$('#tr_confirm_password').hide();
			$('#tr_new_applicant').show();
			$('#tr_already_registered').hide();
			$('#btn_register').hide();
			$('#btn_login').show();
		}
		function Login() {
			$('#freeze').show();
			var data={};
			data['type']='login';
			data=prepareDataText(data,['email','password']);
			$.ajax({
				type : "post",
				url : "indexAjax.php",
				data : $.param(data),
				success: function(msg) {
					$('#freeze').hide();
					if (msg=='Wrong User Name or Password!')  {
						alert(msg);
						return;
					}
					location.href=msg;
				}				
			});
		}
		function Register() {
			$('#freeze').show();
			var data={};
			data['type']='register';
			data=prepareDataText(data,['email','password','confirm_password']);
			$.ajax({
				type : "post",
				url : "indexAjax.php",
				data : $.param(data),
				success: function(msg) {
					$('#freeze').hide();
					if (msg=='Confirm password not matched!')  {
						alert(msg);
						return;
					}
					if (msg=='User already exists!')  {
						alert(msg);
						return;
					}
					location.href=msg;
				}				
			});
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
		<tr id='tr_already_registered' style="display:none"><td colspan="3">Already registered click <span class='span_link' onclick='already_registered()'>here</span></td></tr>
		<tr><td>Email</td><td>:</td><td><?php _t("email") ?></td></tr>
		<tr><td>Password</td><td>:</td><td><?php _t("password","","","password") ?></td></tr>
		<tr style="display:none" id='tr_confirm_password'><td>Confirm Password</td><td>:</td><td><?php _t("confirm_password","","","password") ?></td></tr>
		</tbody>
		<tfoot>
		<tr><td colspan="3">
			<button class='button_link' id='btn_login'>Login</button><button class='button_link' id='btn_register' style="display:none">Register</button>
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
	<div id="menu">
		<span>Administration</span>
		<table style="margin:5px">
		<tr><td><a href="/gizhrms/vacancy">Vacancy</a></td></tr>
		<tr><td><a href="/gizhrms/question">Question</a></td></tr>
		<tr><td><a href="/gizhrms/filter">Filter Applicants</a></td></tr>
		<tr><td><a href="/gizhrms/summary">Recruitment Summary</a></td></tr>
		<tr><td><a href="/gizhrms">Logout</a></td></tr>
		</table>
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
    <div id="pagecontent" style="width:1000px">
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
