<?php
class language {
	static function getAll() {
		$res=db::select('language','language_id, language_val','','sort_id');
		return $res;
	}
	static function getChoice() {
		$combo_language_def=shared::select_combo_complete(language::getAll(), 'language_id','-Language-','language_val');
		$combo_language_def=str_replace("</select>","<option value='-1'>Others</option></select>", $combo_language_def);
		return $combo_language_def;
	}
}
?>