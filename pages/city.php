<?php
	$res=db::select('province','*','','sort_id');
	$combo_province=shared::select_combo($res, 'province_id', 'province_val');
	$res=db::select('city a 
	left join province b on a.province_id=b.province_id','a.*, b.province_val', '', 'a.city_val');
	
?>
<script>
	var fields=generate_assoc(['city_id','city_val','province_id','btn']);
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_edit',"click", Edit);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		bind('.btn_cancel',"click", Cancel);
		hideColumnsArr('tbl_city', ['city_id']);
		fixSelect();
	}
	function Delete() {
		par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data['city_id']=getChildHtml(par, 'city_id', fields);
		var success=function(msg) {
			
			par.remove();
		}
		ajax('cityAjax.php', data, success);
	}
	
	function Add() {
		var a='';
		a+="<tr><td></td><td><?php _t("city_val")?></td><td><select id='province_id'><option value=''>-Province-</option><?php _p($combo_province)?></select>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_city tbody').prepend(a);
		bindAll();
	}
	function Edit() {
		var par=$(this).closest("tr");
		labelToText(par, {'city_val':0});
		labelToSelect(par, 'province_id', ' -Province- ', "<?php _p($combo_province)?>");
		btnChange(par, ['save','cancel']);
		bindAll();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['city_val']);
		selectedToDefaultLabel(par,['province_id']);
		btnChange(par, ['edit','delete']);
		bindAll();
	}
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['city_val'])) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['city_id']=getChildHtml(par,'city_id', fields);
		data['city_val']=getChild(par,'city_val', fields);
		data['province_id']=getChild(par,'province_id',fields);
		var success= function(msg) {
			setHtmlText(par, 'city_id', msg);
			textToLabel(par, ['city_val']);
			selectedToLabel(par, ['province_id']);
			btnChange(par, ['edit','delete']);
			bindAll();
		}
		ajax('cityAjax.php', data, success);
	}
	

</script>
<button class="button_link" id="btn_add">Add City</button>
<table id='tbl_city' class='tbl'>
<thead><tr><th></th><th>City</th><th>Province</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['city_id']."</td><td>".$row['city_val']."</td>
	<td><span style='display:none'>".$row['province_id']."</span>".$row['province_val']."</td>
	<td>".getImageTags(array('edit', 'delete'))."</td>
	</tr>");
}?>
</tbody></table>
