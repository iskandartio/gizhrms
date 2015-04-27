<script>
$(function() {
	var ajaxPage='region_ajax';
	var saveRegionFunc=function(msg) {
		$('#div_province').html('');
	}
	var saveProvinceFunc=function(msg) {
		$('#div_city').html('');
	}
	var tabs=generate_assoc(['region','province','city','nationality','countries']);
	$('#tabs').tabs({
		create: function( event, ui ) {
			$( "#tabs" ).tabs( "option", "active", getCookie('region_tabs'));
			if (tabs['region']==$('#tabs').tabs("option","active")) {
				loadRegion();
			}
			
		},
		activate:function(event, ui) {
			setCookie("region_tabs", $( "#tabs" ).tabs( "option", "active" ), 1);
			if (tabs['region']==$('#tabs').tabs("option","active")) {
				loadRegion();
			} else if (tabs['province']==$('#tabs').tabs("option","active")) {
				loadProvince();
			} else if (tabs['city']==$('#tabs').tabs("option","active")) {
				loadCity();
			} else if (tabs['nationality']==$('#tabs').tabs("option","active")) {
				loadNationality();
			} else if (tabs['countries']==$('#tabs').tabs("option","active")) {
				loadCountries();
			}
		}
	});
	function loadRegion() {
		if ($('#div_region').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			$('#div_region').html(msg);
			var a=new region("#div_region",saveRegionFunc);
			
		}
		ajax(ajaxPage, data, success);
	}
	function loadProvince() {
		if ($('#div_province').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			
			$('#div_province').html(d['result']);
			var a=new province("#div_province", saveProvinceFunc);
			a.region_choice=d['combo_region_def'];
		}
		ajax("province_ajax", data, success);
	}
	function loadCity() {
		if ($('#div_city').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			var d=jQuery.parseJSON(msg);
			$('#div_city').html(d['result']);
			var a=new city("#div_city");
			a.province_choice=d['combo_province_def'];
			
		}
		ajax("city_ajax", data, success);
	}
	function loadNationality() {
		if ($('#div_nationality').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			$('#div_nationality').html(msg);
			var a=new nationality("#div_nationality");
			
		}
		ajax("nationality_ajax", data, success);
	}
	function loadCountries() {
		if ($('#div_countries').html()!='') return;
		var data={}
		data['type']='load';
		var success=function(msg) {
			$('#div_countries').html(msg);
			var a=new countries("#div_countries");
			
		}
		ajax("countries_ajax", data, success);
	}

	
});

</script>

<div id='tabs'>
	<ul>
		<li><a href="#div_region">Region</a></li>
		<li><a href="#div_province">Province</a></li>
		<li><a href="#div_city">City</a></li>
		<li><a href="#div_nationality">Nationality</a></li>
		<li><a href="#div_countries">Countries</a></li>
	</ul>
	<div id='div_region'></div>
	<div id='div_province'></div>
	<div id='div_city'></div>
	<div id='div_nationality'></div>
	<div id='div_countries'></div>
</div>