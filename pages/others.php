<script src='js/gender.js'></script>
<script src='js/relation.js'></script>

<script>
	var tabs=['gender','relation'];
	var jsTabs=[gender, relation];
	$(function() {
		prepareTabs('others');
	});
	function load(active) {
		if ($('#div_'+tabs[active]).html()!='') return;
		var data={}
		
		data['type']='load_'+tabs[active];
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			var div='#div_'+tabs[active];
			$(div).html(d['result']);
			var a=new jsTabs[active]($('#div_'+tabs[active]));
			a.adder=d['adder'];
		}
		ajax("others_ajax", data, success);
	}


</script>
<div id="tabs">
	<ul>
		<li><a href="#div_gender">Gender</a></li>
		<li><a href="#div_relation">Relation</a></li>
	</ul>
	<div id="div_gender"></div>
	<div id="div_relation"></div>
</div>

