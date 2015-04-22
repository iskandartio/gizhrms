function menu(home_dir, maxWidth) {
	var self=this;
	var alwaysHide=false;
	self.start=function() {
		$(document).idleTimeout({
			idleTimeLimit: 6000,       // 'No activity' time limit in seconds. 1200 = 20 Minutes
			redirectUrl: home_dir,    // redirect to this url on timeout logout. Set to "redirectUrl: false" to disable redirect
			customCallback: false,     // set to false for no customCallback
			activityEvents: 'click keypress scroll wheel mousewheel mousemove', // separate each event with a space
			enableDialog: true,        // set to false for logout without warning dialog
			dialogDisplayLimit: 30,   // time to display the warning dialog before logout (and optional callback) in seconds. 180 = 3 Minutes
			dialogTitle: 'Session Expiration Warning',
			dialogText: 'Because you have been inactive, your session is about to expire.',
			sessionKeepAliveTimer: 600 // Ping the server at this interval in seconds. 600 = 10 Minutes
		});
		
		if ($(window).width()<maxWidth) {
			AlwaysHideMenu();
			alwaysHide=true;
		}
		bind('.btn_collapse',"click", ExpandCollapse);
		bind('.btn_menu','click',ShowMenu);
		bind('.btn_hide','click',HideMenu);
		
		
		$('.btn_hide').hide();
	}
	self.ShowMenu=function() {
		$('#freeze').show();
		$('div#menu').attr('class', 'menu menu2');
		$('div#menu').show();
		$('.btn_hide').show();
		bind('#freeze','click',HideMenu);
	}
	self.HideMenu=function() {
		$('#freeze').hide();
		if (alwaysHide) {
			AlwaysHideMenu();
		} else {
			$('div#menu').attr('class', 'menu');
			$('div#menu').hide();
			$('.btn_hide').hide();
			
		}
	}
	self.AlwaysHideMenu=function() {
		$('div#menu').attr('class', 'menu2');
		$('div#menu').hide();
		$('div#pagecontent').attr('class','pagecontent small_left_margin');
		$('.btn_menu').show();
		
	}
	self.ExpandCollapse=function() {
		var data={}
		data['type']="set_session";
		data['session_key']=$(this).parent().attr("id");
		data['session_value']=$(this).attr("src")=="images/expand_alt.png";
		var obj=$(this);
		var success=function(msg) {
			if ($(obj).attr("src")=="images/expand_alt.png") {
				$(obj).parent().next().show();
				$(obj).attr("src", "images/collapse_alt.png");
				$(obj).attr("title", "Collapse");
			} else {
				$(obj).parent().next().hide();
				$(obj).attr("src", "images/expand_alt.png");
				$(obj).attr("title", "Expand");
				
			}
			if ($('#menu').css('display')=='none') {
				$('#freeze').css('display','block');
			}
		}
		ajax('index_ajax', data, success);
		
	}
	self.start();
}