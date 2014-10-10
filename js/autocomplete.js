
	function autocomplete(name, source) {
		$('#'+name+'_name').autocomplete({
			minlength: 0,
			source: source,
			html: true,
			delay:500,
			autoFocus:true,
      		select: function( event, ui ) {
				$("#"+name+"_id" ).val(ui.item.id);
				$(this).val(ui.item.value);
				
				return false;
			}
		}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
			var newText = String(item.value).replace(
                new RegExp(this.term, "gi"),
                "<span class='ui-state-highlight'>$&</span>");
			return $( "<li>" )
			.data( "ui-autocomplete-item", item )
			.append( "<a>" + newText+"</a>" )
			.appendTo(ul);
			
		};
	}