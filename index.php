<?php 
require "pages/startup.php";
$page_name="";

if (isset($_SESSION['home_dir'])) {
	$home_dir=$_SESSION['home_dir'];
	
	$page_name=str_replace($home_dir, "", $_SERVER['REQUEST_URI']);
	if (strpos($page_name,'?')>0) {
		$page_name=substr($page_name,0,strpos($page_name, "?"));	
	}
}
$flag=0;
$title='';


if ($page_name=='') {
	$_SESSION['home']=$_SERVER['REQUEST_SCHEME']."://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
	$_SESSION['home_dir']=$_SERVER['REQUEST_URI'];
	$page_name="login";
	
} else {
	$general_menu=['activate','index','login','show_picture','captcha','send_email'];
	
	$p=str_replace("_ajax","",$page_name);
	
	if (!in_array($p, $general_menu)) {
	
		if (isset($_SESSION['allowed_module']) && count($_SESSION['allowed_module'])>0) {
			if (isset($_SESSION['allowed_module'][$p])) {				
				$title=key($_SESSION['allowed_module'][$p]);
			} else {
				header("Location: ".$_SESSION['home']);
				die;
			}
			if ($_SESSION['allowed_module'][$p][$title]==0) {
				setcookie('url', $p, time() + 3600*48); 
			}
		} else {
			header("Location: ".$_SESSION['home']);
			die;
		}
	}
}

$maxWidthArr['project']="800";
$maxWidthArr['education']="1100";
$maxWidthArr['references']="1100";
$maxWidthArr['filter_applicant']="1100";
$maxWidth=0;

if (isset($maxWidthArr[$page_name])) {
	$maxWidth=$maxWidthArr[$page_name];
} else {
	
}

if (endsWith($page_name,'_ajax')) {

	header('Content-Type: text/html; charset=utf-8');
	
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

if ($page_name=='activate'||$page_name=='upload_ajax'||$page_name=='show_picture_ajax'||$page_name=='downloadcv') {
	include("pages/$page_name.php");	
	die;
}
	

if ($page_name=='login') {
	unset($_SESSION['uid']);
	unset($_SESSION['allowed_module']);
	unset($_SESSION['employee']);
	unset($_SESSION['project_location']);
	unset($_SESSION['in_project_location']);
	unset($_SESSION['project_name']);
	unset($_SESSION['in_project_name']);
} else {
	shared::contract_reminder_email();
}

header('Content-Type: text/html; charset=utf-8');
?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><?php _p("GIZ HRMS");?></title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2">
    <link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/default.css"/>
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/store.min.js"></script>
	
	<script src="js/general.js"></script>
	<script src="js/numeric.js"></script>
	
	<script>
		$(function() {
			$('#freeze').hide();
			send_email();
		});
	</script>
<?php if ($page_name!="login") {?>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/store.js/1.3.14/store.min.js" type="text/javascript"></script>
	
	<script src="js/jquery-idleTimeout.min.js"></script>
<?php } ?>
<?php if ($page_name!="login") {?>
	<script src='js/menu.js'></script>
	<script>
		$(function() {
			var a=menu('<?php _p($home_dir)?>', '<?php _p($maxWidth)?>', '<?php _p($page_name)?>');
		});
		
	</script>
<?php }?>
</head>
<body>

	<div align="center">
	<img class="logoimg" src="images/logo.png" alt="PAKLIM">
    <img class="logoimg" src="images/logo_web.jpg" alt="">
	</div>
	<div id="freeze" style="position: fixed; top: 0px; left: 0px; z-index: 1000; opacity: 0.6; width: 100%; height: 100%; color: white; background-color: black;"></div>
<?php if ($page_name=='login') {		
		include("pages/login.php");
		
	} else {
		_p("<div id='menu' class='menu'>");
		_p(getImageTags(array('hide')));
		_p($_SESSION['create_menu']);
		_p("</div>");
	}?>
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
