<script src='js/region.js'></script>
<script>
	var tabs=['region','province','city','nationality','countries'];
	var ajaxPage='region_ajax';
	$(function() {
		var a="<ul>";
		for (i in tabs) {
			a+="<li><a href='#div_"+tabs[i]+"'>"+toggleCase(tabs[i])+"</a></li>";
		}
		a+="</ul>";
		for (i in tabs) {
			a+="<div id='div_"+tabs[i]+"'></div>";
		}
		$('#tabs').html(a);
		prepareTabs('region');
	});
	function load(active) {
		if ($('#div_'+tabs[active]).html()!='') return;
		var data={}
		var tbl=tabs[active];
		data['type']='load';
		data['tbl']=tbl;
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			var div='#div_'+tabs[active];
			$(div).html(d['result']);
			var a=new region($('#div_'+tbl), tbl);
			a.adder=d['adder'];
			if (tbl=='province') a.region_choice=d['region_choice'];
			if (tbl=='city') a.province_choice=d['province_choice'];
		}
		ajax(ajaxPage, data, success);
	}
</script>

<div id='tabs'>
</div>
