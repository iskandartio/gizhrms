<script src='js/others.js'></script>

<script>
	var tabs=['gender','relation','title'];
	
	$(function() {
		prepareTabs('others');
	});
	function load(active) {
		if ($('#div_'+tabs[active]).html()!='') return;
		var data={}
		data['type']='load';
		data['tbl']=tabs[active];
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			var div='#div_'+tabs[active];
			$(div).html(d['result']);
			var a=new others($('#div_'+tabs[active]), tabs[active]);
			a.adder=d['adder'];
		}
		ajax("others_ajax", data, success);
	}


</script>
<div id="tabs">
	<ul>
		<li><a href="#div_gender">Gender</a></li>
		<li><a href="#div_relation">Relation</a></li>
		<li><a href="#div_title">Title</a></li>
	</ul>
	<div id="div_gender"></div>
	<div id="div_relation"></div>
	<div id="div_title"></div>
</div>

