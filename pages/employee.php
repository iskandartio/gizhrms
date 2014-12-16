<?php
	$filter_first_name=shared::get_session('filter_first_name',"");
	$filter_last_name=shared::get_session('filter_last_name',"");
?>
<script>
	var fields=generate_assoc(['user_id','first_name','last_name','project_name','project_location']);
	$(function() {
		bindAll();
		Search();
	});
	function bindAll() {
		bind('#btn_search','click',Search);
		bind('.btn_edit','click',Edit);
	}
	function Edit() {
		var par=$(this).closest("tr");
		var data={}
		data['type']="set_edit_id";
		data['edit_id']=getChild(par, 'edit_id');
		var success=function(msg) {
			
			location.href="employee_detail";
		}
		ajax("employeeAjax.php", data, success);
	}
	function Search() {
		var data={}
		data['type']='search';
		data=prepareDataText(data, ['first_name','last_name']);
		var success=function(msg) {
			$('#div_result').html(msg);
			bindAll();
		}
		ajax('employeeAjax.php', data, success);
	}
</script>
<div id='div_content'>
<?php _t("first_name", $filter_first_name)?> <?php _t("last_name", $filter_last_name)?><button id='btn_search' class='button_link'>Search</button>
<div id='div_result'>
</div>
</div>