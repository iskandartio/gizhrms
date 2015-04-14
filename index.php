<?php
$home_dir="/gizhrms/";
$page_name=str_replace($home_dir, "", $_SERVER['REQUEST_URI']);
if (strpos($page_name,'?')>0) {
	$page_name=substr($page_name,0,strpos($page_name, "?"));	
}
require "pages/startup.php";
$flag=0;

if ($page_name=='') {	
	$_SESSION['home']=$_SERVER['REQUEST_SCHEME']."://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
	$page_name="login";
} else {
	$secArr=array();
	$secArr['admin']=['accept_employee','call_interview','change_project_data','contract_expiring','email_setting','employee','employee_detail','eyeglasses'
						, 'filter_applicant','former_employee','location','medical','medical_checkup','medical_summary','others','outpatient','pregnancy'
						, 'project','question','recruitment_summary','salary','settings','statistics','vacancy','vacancy_progress'
						,'region','province','city','countries','nationality'
						,'show_picture','upload','pay_medical'];
	$secArr['employee']=['employee','employee_detail','recruitment','recruitment_report'];
	$secArr['office_manager']=['eyeglasses','medical','medical_checkup','medical_summary','outpatient','pregnancy','show_picture','upload'];
	$secArr['applicant']=['applicant','education','language','position_applied','references','uploadcv','working'];
	$secArr['general']=['activate','change_password','login','captcha','index','login','send_email'];
	$serArr['finance']=['pay_medical'];
	
	$p=str_replace("_ajax","",$page_name);
	if (in_array($p, $secArr['general'])) $flag=1;
	if ($flag==0) {
		if (isset($_SESSION['role_name'])) {
			$role_name=$_SESSION['role_name'];
			if ($flag==0) if (in_array($p, $secArr[$role_name])) $flag=1;
			if ($flag==0) {
				if (Employee::isOfficeManager()==1) {
					if (in_array($p, $secArr['office_manager'])) $flag=1;
				}
			}
		}
	}
	if ($flag==0) $page_name='login';
}

$title="";
$titleArr["vacancy_progress"]="Recruitment Process";
$maxWidthArr['project']="800";
$maxWidth=0;
if (isset($titleArr[$page_name])) {
	$title=$titleArr[$page_name];
} else {
	$title=proper($page_name);
}
if (isset($maxWidthArr[$page_name])) {
	$maxWidth=$maxWidthArr[$page_name];
} else {
	
}

//require_once('libs/URLParse.php'); 

if (endsWith($page_name,'_ajax')) {
	header('Content-Type: text/html; charset=utf-8');
	
	if ($_SESSION['page_name']=='outpatient') $medical_type='employee_outpatient';
	if ($_SESSION['page_name']=='pregnancy') $medical_type='employee_pregnancy';

	foreach ($_POST as $key=>$value) {
		if (startsWith($key,'date')||endsWith($key,'date')) {
			if (!is_array($value)) {
				$$key=dbDate($value);	
				$_POST[$key]=$$key;
			} else {
				foreach ($value as $key2=>$val) {
					$_POST[$key][$key2]=dbDate($val);
				}
				$$key=$_POST[$key];
			}
		} else {
			$$key=$value;
		}					
	}
		
	if (isset($captcha_text)) {
		if ($_SESSION['captcha_text']!=$captcha_text) {
			$data['err']='Wrong captcha text';
			$data['captcha_tag']=shared::get_captcha_text(true);
			$data['focus']='#captcha_text';
			die(json_encode($data));
		}
	}
	include("pages/ajax/$page_name.php");
	
	die;
}

//$name = URLParse::ProcessURL();

$_SESSION['random_key']=base64_encode(hash('ripemd128', shared::random(6) , true));


$activation_email= (isset($_SESSION['activation_email'])? $_SESSION['activation_email'] : '');
$_SESSION['activation_email']="";


$_SESSION['page_name']=$page_name;

if ($page_name=='activate'){
	include("pages/$page_name.php");	
	die;
}
if ($page_name=='upload_ajax'||$page_name=='show_picture_ajax') {
	include("pages/$page_name.php");	
	die;
}
	

if ($page_name=='login'||$page_name=='activate') {

	unset($_SESSION['uid']);
	unset($_SESSION['role_name']);
	unset($_SESSION['role_name2']);
	unset($_SESSION['project_location']);
	unset($_SESSION['employee']);
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
    <title><?php _p("GIZ HRMS");?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2">

    <link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/general.js"></script>
	<script src="js/numeric.js"></script>

	<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
<?php if ($page_name!="login") {?>
	<script src="js/store.min.js" type="text/javascript"></script>
	<script src="js/jquery-idleTimeout.min.js"></script>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function (){
			$(document).idleTimeout({
				idleTimeLimit: 1200,       // 'No activity' time limit in seconds. 1200 = 20 Minutes
				redirectUrl: '<?php _p($home_dir)?>',    // redirect to this url on timeout logout. Set to "redirectUrl: false" to disable redirect
				customCallback: false,     // set to false for no customCallback
				activityEvents: 'click keypress scroll wheel mousewheel mousemove', // separate each event with a space
				enableDialog: true,        // set to false for logout without warning dialog
				dialogDisplayLimit: 30,   // time to display the warning dialog before logout (and optional callback) in seconds. 180 = 3 Minutes
				dialogTitle: 'Session Expiration Warning',
				dialogText: 'Because you have been inactive, your session is about to expire.',
				sessionKeepAliveTimer: 600 // Ping the server at this interval in seconds. 600 = 10 Minutes
			});
			$('#freeze').hide();
		});
	</script>
<?php } else {?>
	<script>
		$(function() {
			$('#freeze').hide();
		});
	</script>
<?php }?>
	<link rel="stylesheet" href="css/default.css"/>
<?php if ($page_name!=''&&$page_name!='activate') {?>
	<script>
		var alwaysHide=false;
		$(function() {
			var maxWidth="<?php _p($maxWidth)?>";
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

</head>
<body>

	<div align="center">
	<img class="logoimg" src="images/logo.png" alt="PAKLIM">
    <img class="logoimg" src="images/logo_web.jpg" alt="">
	</div>
	<div id="freeze" style="position: fixed; top: 0px; left: 0px; z-index: 1000; opacity: 0.6; width: 100%; height: 100%; color: white; background-color: black;"></div>
<?php if ($page_name=='login') {		
		include("pages/login.php");
		
	} else if ($_SESSION['role_name']=='applicant') {?>
	<div id="menu" class='menu'>
		<?php _p(getImageTags(array('hide')))?>
		<span>Application Data</span>
		<div style="margin:5px">
		<ul>
			<li><a href="<?php _p($home_dir)?>applicant">Personal Details</a></li>
			<li><a href="<?php _p($home_dir)?>education">Education</a></li>
			<li><a href="<?php _p($home_dir)?>working">Working Experience</a></li>
			<li><a href="<?php _p($home_dir)?>language">Language</a></li>
			<li><a href="<?php _p($home_dir)?>references">References</a></li>
			<li><a href="<?php _p($home_dir)?>uploadcv">Upload CV + Cover Letter</a></li>
			<li><a href="<?php _p($home_dir)?>position_applied">Position Applied</a></li>

			<li><a href="<?php _p($home_dir)?>change_password">Change Password</a></li>
			<li><a href="<?php _p($home_dir)?>">Logout</a></li>
		</ul>
		
		</div>
	</div>
	
<?php } else if ($_SESSION['role_name']=='admin') {
	?>
	
	<div id="menu" class='menu'>
		<?php _p(getImageTags(array('hide')))?>
		<span id='menu_master'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Master Data</span>
		<ul>
		<li><a href="<?php _p($home_dir)?>project">Project</a></li>
		<li><a href="<?php _p($home_dir)?>email_setting">Email Setting</a></li>
		<li><a href="<?php _p($home_dir)?>region">Region</a></li>
		<li><a href="<?php _p($home_dir)?>others">Others</a></li>
		<li><a href="<?php _p($home_dir)?>location">Interview Location</a></li>
		<li><a href="<?php _p($home_dir)?>vacancy_progress">Recruitment Process</a></li>
		<li><a href="<?php _p($home_dir)?>settings">Settings</a></li>
		</ul>
		
		<span id='menu_report'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Report</span>
		<ul>
		<li><a href="<?php _p($home_dir)?>statistics">Statistics</a></li>
		</ul>
		<span id='menu_administration'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Administration</span>
		<ul>
		<li><a href="<?php _p($home_dir)?>employee">Employee</a></li>
		<li><a href="<?php _p($home_dir)?>salary">Salary Adjustment</a></li>
		<li><a href="<?php _p($home_dir)?>contract_expiring">Contract Expiring</a></li>
		<li><a href="<?php _p($home_dir)?>former_employee">Former Employee</a></li>
		</ul>
		
		<span id='menu_medical'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Medical</span>
		<ul>
		<li><a href="<?php _p($home_dir)?>outpatient">Outpatient</a></li>
		<li><a href="<?php _p($home_dir)?>eyeglasses">Eyeglasses</a></li>
		<li><a href="<?php _p($home_dir)?>pregnancy">Pregnancy</a></li>
		<li><a href="<?php _p($home_dir)?>medical_checkup">Medical Checkup</a></li>
		<li><a href="<?php _p($home_dir)?>pay_medical">Pay Medical</a></li>
		<li><a href="<?php _p($home_dir)?>medical_summary">Summary</a></li>
		</ul>
		<span id='menu_recruitment'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Recruitment</span>
		<ul>
		<li><a href="<?php _p($home_dir)?>vacancy">Vacancy</a></li>
		<li><a href="<?php _p($home_dir)?>question">Question</a></li>
		<li><a href="<?php _p($home_dir)?>filter">Filter Applicants</a></li>
		<li><a href="<?php _p($home_dir)?>call_interview">Call for Interview</a></li>
		<li><a href="<?php _p($home_dir)?>accept_employee">Accept as Employee</a></li>
		<li><a href="<?php _p($home_dir)?>recruitment_summary">Recruitment Summary</a></li>
		<li><a href="<?php _p($home_dir)?>change_password">Change Password</a></li>
		<li><a href="<?php _p($home_dir)?>">Logout</a></li>
		</ul>
		
	</div>
<?php } else if ($_SESSION['role_name']=='employee') {?>	
	<div id="menu" class='menu'>
		<?php if (Employee::isOfficeManager()==1) {
			$_SESSION['role_name2']='office_manager';?>
			<span id='menu_medical'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Medical</span>
			<ul>
			<li><a href="<?php _p($home_dir)?>outpatient">Outpatient</a></li>
			<li><a href="<?php _p($home_dir)?>eyeglasses">Eyeglasses</a></li>
			<li><a href="<?php _p($home_dir)?>pregnancy">Pregnancy</a></li>
			<li><a href="<?php _p($home_dir)?>medical_checkup">Medical Checkup</a></li>
			<li><a href="<?php _p($home_dir)?>medical_summary">Summary</a></li>
			</ul>
		<?php }?>
		
		<span id='menu_administration'><img src="images/collapse_alt.png" class='btn_collapse' title='Collapse'/>Administration</span>
		<ul>
		<li><a href="<?php _p($home_dir)?>employee">Employee</a></li>
		<li><a href="<?php _p($home_dir)?>recruitment">Recruitment</a></li>
		<li><a href="<?php _p($home_dir)?>recruitment_report">Recruitment Report</a></li>
		<li><a href="<?php _p($home_dir)?>change_password">Change Password</a></li>
		<li><a href="<?php _p($home_dir)?>">Logout</a></li>
		</ul>
		
		
	</div>
<?php }?>
<?php if ($page_name!="login") {?>
	<?php _p(getImageTags(array('menu')))?>

    
	<div id="pagecontent" class='pagecontent'>
		
		<h3><?php _p($title)?></h3>
	
		<div style="margin:5px">
        <?php
			include("pages/$page_name.php");
            //URLParse::IncludePageContents();
        ?>
		</div>
    </div>
<?php }?>

</body>
</html>
