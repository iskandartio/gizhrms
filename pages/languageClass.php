<?php
class language {
	static function getChoice() {
		$res=db::select('language','language_id, language_val','','sort_id');
		$combo=shared::select_combo($res,'language_id','language_val');
		return $combo;
	}
}
?>