<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="sv">

<head>
<title>Tiny Inline Editing</title>
<link rel="stylesheet" href="css/jquery-ui-1.10.3.custom.min.css"/>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
$(function() {

$(function() {
	$.widget("ui.dialog", $.ui.dialog, {
        _allowInteraction: function(event) {
		return !!$(event.target).closest(".mce-container").length || this._super( event );
		}
	});
	$('.letter').click(function() {
		$('#show_detail').dialog({
			autoOpen:false,
			height:500,
			width:750,
			modal:true,
			open:setTimeout(initTinyMCE(),2000),
		});
		$('#show_detail').dialog("open");
	});
});

function initTinyMCE() {
	tinymce.init({
		selector: "div#email",
		fontsize_formats: "8pt 9pt 10pt 11pt 12pt 26pt 36pt",
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
		paste_retain_style_properties : "color background text-align font-size display",
		forced_root_block : false,
		force_br_newlines : true,
		force_p_newlines : false,

	});
}

});
</script>
<div  id='show_detail'><div id='email' style='border-style:dotted'>a</email></div>
<input type='button' class='letter'/>
