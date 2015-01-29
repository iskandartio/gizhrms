<?php
class language_skill {
	static function getChoice() {
		$res=db::select('language_skill','language_skill_id, language_skill_val','','sort_id');
		$combo=shared::select_combo($res,'language_skill_id','language_skill_val');
		return $combo;
	}
}
?>