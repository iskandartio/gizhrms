<script>
	var ajaxPage='change_log_ajax';
	$(function() {
		$('.from_change_date').val(getCookie('from_change_date'));
		$('.to_change_date').val(getCookie('to_change_date'));
		$('.time_from').val(getCookie('time_from'));
		$('.time_to').val(getCookie('time_to'));
		$('.changes').val(getCookie('changes'));
		$('.updated_by').val(getCookie('updated_by'));
		bind('.btn_search','click', Search);
		setDatePicker();
	});
	function Search() {
		setCookie('from_change_date', $('.from_change_date').val(), 1);
		setCookie('to_change_date', $('.to_change_date').val(), 1);
		setCookie('time_from', $('.time_from').val(), 1);
		setCookie('time_to', $('.time_to').val(), 1);
		setCookie('changes', $('.changes').val(), 1);
		setCookie('updated_by', $('.updated_by').val(), 1);
		
		var data={}
		data['type']='search';
		data=prepareDataText(data, ['from_change_date','time_from','to_change_date','time_to','changes','updated_by']);
		var success=function(msg) {
			$('#div_result').html(msg);
		}
		ajax(ajaxPage, data, success);
	}
</script>

<table>
<tr><td>Changed Time From</td><td>:</td><td><?php _t("from_change_date","","","","","Changed Date") ?> <?php _t("time_from","","5") ?></td></tr>
<tr><td>Changed Time To</td><td>:</td><td><?php _t("to_change_date","","","","","Changed Date") ?> <?php _t("time_to","","5") ?></td></tr>
<tr><td>Changes</td><td>:</td><td><?php _t("changes")?></td></tr>
<tr><td>Changed By</td><td>:</td><td><?php _t("updated_by")?></td></tr>
</table>
<button class='button_link btn_search'>Search</button>
<div id='div_result'></div>