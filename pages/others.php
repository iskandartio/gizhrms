<script src='js/others.js'></script>
<script>
	var tabs=['gender','relation','title','job_title','job_position','language_skill','vacancy_type','filter_choice'];
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

<div id='tabs'>
</div>
