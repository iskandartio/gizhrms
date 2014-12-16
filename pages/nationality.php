<?php
	$res=db::select('nationality','*','','sort_id');
	
?>
<script>
	var fields=generate_assoc(['nationality_id','nationality_val','btn']);
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		bind('.btn_up',"click", Up);
		bind('.btn_down',"click", Down);
		hideColumnsArr('tbl', ['nationality_id']);
	}
	function Up() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up";
		data['nationality_id']=getChild(par, 'nationality_id');
		ajax('nationalityAjax.php', data, success);
	}
	function Down() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
				var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['nationality_id']=getChild(par, 'nationality_id');
		ajax('nationalityAjax.php', data, success);
	}
	function Delete() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['nationality_id']=getChild($(this).closest("tr"), 'nationality_id');
		var success=function(msg) {
		}
		ajax('nationalityAjax.php', data, success);
	}
	
	function Add() {
		var a='';
		a+="<tr><td></td><td><?php _t("nationality_val")?>";
		a+="<td>"+getImageTags(['save','delete','up','down'])+"</td>";
		a+="</tr>";
		
		$('#tbl').append(a);
		bindAll();
	}
	
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['nationality_val'])) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['nationality_id']=getChild(par,'nationality_id');
		data['nationality_val']=getChild(par,'nationality_val');
		var success= function(msg) {
			setHtmlText(par, 'nationality_id', msg);
			bindAll();
		}
		ajax('nationalityAjax.php', data, success);
	}
	

	

</script>
<button class="button_link" id="btn_add">Add</button>
<table id='tbl' class='tbl'>
<thead><tr><th></th><th>Nationality</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['nationality_id']."</td><td>"._t2("nationality_val", $row['nationality_val'])."</td>
	<td>".getImageTags(array('save', 'delete','up','down'))."</td>
	</tr>");
}?>

</tbody></table>
