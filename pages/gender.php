<?php
	$res=db::select('gender','*','','sort_id');
	
?>

<script>
	var fields=generate_assoc(['gender_id','gender_val','btn']);
	$(function() {
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		bind('.btn_up',"click", Up);
		bind('.btn_down',"click", Down);
		hideColumnsArr('tbl', ['gender_id']);
	}

	function Delete() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['gender_id']=getChild($(this).closest("tr"), 'gender_id');
		var success=function(msg) {
		}
		ajax('genderAjax.php', data, success);
	}
	
	function Add() {
		var a='';
		a+='<tr><td></td>';
		a+="<td><?php _t("gender_val")?></td>";
		a+="<td>"+getImageTags(['save','delete','up','down'])+"</td>";
		a+="</tr>";
		
		$('#tbl').append(a);
		bindAll();
	}
	function Up() {
		var par=$(this).closest("tr");
		$(par).prev().before($(par));
		var success=function(msg) {
		}
		var data={}
		data['type']="up";
		data['gender_id']=getChild(par, 'gender_id');
		ajax('genderAjax.php', data, success);
	}
	function Down() {
		var par=$(this).closest("tr");
		$(par).next().after($(par));
				var success=function(msg) {
		}
		var data={}
		data['type']="down";
		data['gender_id']=getChild(par, 'gender_id');
		ajax('genderAjax.php', data, success);
	}
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['gender_val'])) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['gender_id']=getChild(par,'gender_id');
		data['gender_val']=getChild(par,'gender_val');
		
		
		var success= function(msg) {
			setHtmlText(par, 'gender_id', msg);
			bindAll();
		}
		ajax('genderAjax.php', data, success);
	}
	

	

</script>
<button class="button_link" id="btn_add">Add</button>
<table id='tbl' class='tbl'>
<thead><tr><th></th><th>Gender</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['gender_id']."</td>
	<td>"._t2("gender_val", $row['gender_val'])."</td>
	<td>".getImageTags(array('save', 'delete', 'up','down'))."</td>
	</tr>");
}?>

</tbody></table>
<div id='show_detail'/>