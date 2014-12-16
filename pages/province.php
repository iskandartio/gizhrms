<?php
	$res=db::select('region','*','','sort_id');
	$combo_region=shared::select_combo($res, 'region_id', 'region_val');
	$res=db::select('province a 
	left join region b on a.region_id=b.region_id','a.*, b.region_val', '', 'b.sort_id, a.sort_id');
	
?>
<script>
	var fields=generate_assoc(['province_id','province_val','region_id','btn']);
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_edit',"click", Edit);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		bind('.btn_cancel',"click", Cancel);
		hideColumnsArr('tbl', ['province_id']);
	}
	function Delete() {
		par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data['province_id']=getChild(par, 'province_id');
		var success=function(msg) {
			
			par.remove();
		}
		ajax('provinceAjax.php', data, success);
	}
	
	function Add() {
		var a='';
		a+="<tr><td></td><td><?php _t("province_val")?></td><td><select id='region_id'><option>-Region-</option><?php _p($combo_region)?></select>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl').append(a);
		bindAll();
	}
	function Edit() {
		var par=$(this).closest("tr");
		labelToText(par, {'province_val':0});
		labelToSelect(par, 'region_id', ' -Region- ', "<?php _p($combo_region)?>");
		btnChange(par, ['save','cancel']);
		bindAll();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['province_val']);
		selectedToDefaultLabel(par,['region_id']);
		btnChange(par, ['edit','delete']);
		bindAll();
	}
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['province_val'])) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['province_id']=getChild(par,'province_id');
		data['province_val']=getChild(par,'province_val');
		data['region_id']=getChild(par,'region_id');
		var success= function(msg) {
			setHtmlText(par, 'province_id', msg);
			textToLabel(par, ['province_val']);
			selectedToLabel(par, ['region_id']);
			btnChange(par, ['edit','delete']);
			bindAll();
		}
		ajax('provinceAjax.php', data, success);
	}
	

</script>
<button class="button_link" id="btn_add">Add Province</button>
<table id='tbl' class='tbl'>
<thead><tr><th></th><th>Province</th><th>Region</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['province_id']."</td><td>".$row['province_val']."</td>
	<td><span style='display:none'>".$row['region_id']."</span>".$row['region_val']."</td>
	<td>".getImageTags(array('edit', 'delete'))."</td>
	</tr>");
}?>
</tbody></table>
