<?php
	$res=db::select('region','*','','sort_id');
	
?>
<script>
	var fields=generate_assoc(['region_id','region_val','btn']);
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_edit',"click", Edit);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		bind('.btn_cancel',"click", Cancel);
		bind('.btn_up',"click", Up);
		bind('.btn_down',"click", Down);
		hideColumnsArr('tbl', ['region_id']);
	}
	function Delete() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['region_id']=getChild($(this).closest("tr"), 'region_id');
		var success=function(msg) {
		}
		ajax('regionAjax.php', data, success);
	}
	
	function Add() {
		var a='';
		a+="<tr><td></td><td><?php _t("region_val")?></td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl').append(a);
		bindAll();
	}
	function Edit() {
		var par=$(this).closest("tr");
		labelToText(par, {'region_val':0});
		btnChange(par, ['save','cancel']);
		bindAll();
	}
	function Cancel() {
		var par=$(this).closest("tr");
		textToDefaultLabel(par,['region_val']);
		btnChange(par, ['edit','delete']);
		bindAll();
	}
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['region_val'])) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['region_id']=getChild(par,'region_id');
		data['region_val']=getChild(par,'region_val');
		var success= function(msg) {
			setHtmlText(par, 'region_id', msg);
			textToLabel(par, ['region_val']);
			btnChange(par, ['edit','delete']);
			bindAll();
		}
		ajax('regionAjax.php', data, success);
	}
	function Up() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up";
		data['region_id']=getChild(par, 'region_id');
		ajax('regionAjax.php', data, success);
	}
	function Down() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
				var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['region_id']=getChild(par, 'region_id');
		ajax('regionAjax.php', data, success);
	}

</script>
<button class="button_link" id="btn_add">Add Region</button>
<table id='tbl' class='tbl'>
<thead><tr><th></th><th>Region</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['region_id']."</td><td>".$row['region_val']."</td>
	<td>".getImageTags(array('edit', 'delete', 'up', 'down'))."</td>
	</tr>");
}?>
</tbody></table>
