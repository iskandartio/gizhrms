<?php
	require_once("pages/startup.php");
	$res=db::select_one('m_user','user_id, user_name','activation_code=?','', array($_GET['link']));
	db::update('m_user','status_id', 'user_id=?', array(1, $res['user_id']));
	$_SESSION['activation_email']=$res['user_name'];
	
?>
<script src="js/jquery.min.js"></script>
<script>
	$(function() {
		location.href="<?php _p($home) ?>";
	});
	
	
</script>