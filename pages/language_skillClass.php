<?php
class language_skill {
	static function getAll() {
		$res=db::select('language_skill','language_skill_id, language_skill_val','','sort_id');
		
		return $res;
	}
}
?>