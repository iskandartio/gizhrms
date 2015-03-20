<?php
	if ($type=='save')  {
		if (db::updateShort('settings', 'setting_name',$_POST)<0) {
			_p("error when saving");
		}
		die;
	}
?>