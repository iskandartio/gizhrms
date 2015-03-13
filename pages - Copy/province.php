<?php
	$res=db::select('region','*','','sort_id');
	$combo_region_def=shared::select_combo_complete($res, 'region_id', '-Region-','region_val');
	$res=db::select('province a 
	left join region b on a.region_id=b.region_id','a.*, b.region_val', '', 'b.sort_id, a.sort_id');
	
?>
<script>
	var fields=generate_assoc(['province_id','province_val','region_id','btn']);
	var region_choice="<?php _p($combo_region_def)?>";
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_edit',"click", Edit);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		bind('.btn_cancel',"click", Cancel);
		hideColumnsArr('tbl_province', ['province_id']);
		fixSelect();
	}
	function Delete() {
		par=$(this).closest("tr");
		var data={}
		data['type']='delete';
		data['province_id']=getChildHtml(par, 'province_id', fields);
		var success=function(msg) {
			
			par.remove();
		}
		ajax('provinceAjax.php', data, success);
	}
	
	function Add() {
		var a='';
		a+="<tr><td></td><td><?php _t("province_val")?></td><td>"+region_choice;
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl_province tbody').prepend(a);
		bindAll();
	}
	function Edit() {
		var par=$(this).closest("tr");
		labelToText(par, {'province_val':0});
		labelToSelect(getChildObj(par, 'region_id', fields), region_choice);
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
		data['province_id']=getChildHtml(par,'province_id', fields);
		data['province_val']=getChild(par,'province_val', fields);
		data['region_id']=getChild(par,'region_id',fields);
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
<table id='tbl_province' class='tbl'>
<thead><tr><th></th><th>Province</th><th>Region</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['province_id']."</td><td>".$row['province_val']."</td>
	<td><span style='display:none'>".$row['region_id']."</span>".$row['region_val']."</td>
	<td>".getImageTags(array('edit', 'delete'))."</td>
	</tr>");
}?>
</tbody></table>
