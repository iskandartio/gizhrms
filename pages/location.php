<?php
	$res=db::select('location','*');

?>
<script src="js/tinymce/tinymce.min.js"></script>

<script>
	var fields=generate_assoc(['location_id','location_code','location_val','btn']);
	$(function() {
		$.widget("ui.dialog", $.ui.dialog, {
			_allowInteraction: function(event) {
			return !!$(event.target).closest(".mce-container").length || this._super( event );
			}
		});
		bindAll();
		
	});
	function bindAll() {
		bind('#btn_add','click',Add);
		bind('.btn_delete',"click", Delete);
		bind('.btn_save',"click", Save);
		hideColumnsArr('tbl', ['location_id']);
		
		tinymce.remove();
		
		tinymce.init({
			selector: "div.location_val",
			inline:true,
			theme: "modern",
			plugins: [
				"advlist autolink lists link image charmap print preview hr anchor pagebreak",
				"searchreplace wordcount visualblocks visualchars code fullscreen",
				"insertdatetime media nonbreaking save table contextmenu directionality",
				"emoticons template paste textcolor colorpicker textpattern"
			],
			toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
			toolbar2: "preview | forecolor backcolor emoticons",
			image_advtab: true,

		});
		
	}

	function Delete() {
		par=$(this).closest("tr");
		par.remove();
		var data={}
		data['type']='delete';
		data['location_id']=getChildHtml($(this).closest("tr"), 'location_id', fields);
		var success=function(msg) {
		}
		ajax('location_ajax', data, success);
	}
	
	function Add() {
		var a='';
		a+='<tr><td></td>';
		a+="<td><?php _t("location_code")?></td>";
		a+="<td><div class='location_val' style='border-style:dotted'>&nbsp;</div> &nbsp;</td>";
		a+="<td>"+getImageTags(['save','delete'])+"</td>";
		a+="</tr>";
		
		$('#tbl').append(a);
		bindAll();
		
	}
	
	function Save() {
		var par=$(this).closest("tr");
		if (!validate_empty_tbl(par, ['location_code'])) {
			return;
		}
		
		var data={};
		data['type']='save';
		data['location_id']=getChildHtml(par,'location_id', fields);
		data['location_code']=getChild(par,'location_code', fields);
		data['location_val']=getChildObj(par,'location_val', fields).children().html();
		
		
		var success= function(msg) {
			setHtmlText(par, 'location_id', msg);
			bindAll();
		}
		ajax('location_ajax', data, success);
	}
	

	

</script>

<button class="button_link" id="btn_add">Add</button>
<table id='tbl' class='tbl'>
<thead><tr><th></th><th>Location Code</th><th>Location</th><th></th></tr><tbody>
<?php foreach ($res as $row) {
	_p("<tr><td>".$row['location_id']."</td><td>"._t2("location_code", $row['location_code'])."</td>
	<td><div class='location_val' style='border-style:dotted'>".$row['location_val']."</div></td>
	<td>".getImageTags(array('save', 'delete'))."</td>
	</tr>");
}?>

</tbody></table>
<div id='show_detail'/>