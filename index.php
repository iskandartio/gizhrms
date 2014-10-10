<?php
/*==============================================================================

        Defuse Cyber-Security's Secure & Lightweight CMS in PHP for Linux.
        Setup & Usage Instructions: https://defuse.ca/helloworld-cms.htm

                      PUBLIC DOMAIN CONTRIBUTION NOTICE                             
   This work has been explicitly placed into the Public Domain for the
    benefit of anyone who may find it useful for any purpose whatsoever.

==============================================================================*/
require "pages/autoload.php";

require_once('libs/URLParse.php'); 
session_start();
date_default_timezone_set('Asia/Jakarta');
$_SESSION['db']=array('mysql:host=localhost:3307;dbname=inv','root','123456');

$name = URLParse::ProcessURL();

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title><?php 
                $title = URLParse::getPageTitle($name);
                echo htmlspecialchars($title, ENT_QUOTES);
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

</head>
<body>
    <h1>GIZ PAKLIM HRMS</h1>
	<table>
	<tr><td valign="top">
		<table>
		<tr><td>
        <a href="/cms/applicant">Applicant</a></td></tr>
		<tr><td>
        <a href="/cms/about">About</a></td></tr>
		<tr><td>
        <a href="/cms/skadlfjasdklfjsdklaf">404 page</a></td></tr>
		</table>
    </div>
	</td><td>
    <div id="pagecontent">
        <?php
            URLParse::IncludePageContents();
        ?>
    </div>
	</td></tr>
	</table>

</body>
</html>
