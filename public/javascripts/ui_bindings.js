/* All Code Copyright 2008 Eric Draut all rights reserved
*/
function getActualLinkTarget(alleged_link_target){
	if (alleged_link_target.is('a')){
		return alleged_link_target;
	} else {
		return alleged_link_target.parents('a');
	}
}
function bindSortables(){
	jQuery("[data-behavior='sortable']").sortable({
		update: function(e,ui){
			jQuery.ajax({
				type: 'POST', 
				url: jQuery(this).attr('data-sort_url'),
				data: jQuery(this).sortable('serialize')
			});
			if(jQuery(this).attr('data-sort_callback')){
				eval(jQuery(this).attr('data-sort_callback'));
			}
		},
		handle: (jQuery(this).find("[data-role='sortable_drag_handle']").length == 0) ? false : "[data-role='sortable_drag_handle']"
	});
}
function bindLimitedTextAreas(){
	jQuery("[validation_binding='textarea_limit']").keyup(function(e){
		limitChars(jQuery(e.target), parseInt(jQuery(e.target).attr('validation_limit')),jQuery(e.target).attr('validation_feedback_element'));
	});
};
function limitChars(textarea, limit, infodiv){
	var text = textarea.val(); 
	var textlength = text.length;
	if(textlength > limit){
		jQuery('#' + infodiv).html('You exceeded the limit of '+limit+' characters, your content was truncated.');
		textarea.css({'background-color':'#FF9999'});
		jQuery('#' + infodiv).css({'text-decoration':'blink','color':'#FF0000'});
		textarea.val(text.substr(0,limit));
		return false;
	} else {
		jQuery('#' + infodiv).html('You have '+ (limit - textlength) +' characters left.');
		textarea.css({'background-color':'white'});
		jQuery('#' + infodiv).css({'text-decoration':'none','color':'#000000'});
		return true;
	}
};
function hiddenFieldProxy(e){
	target = jQuery(e.target);
	if(!(target.data("behavior") == 'hidden_field_proxy')){
		target = target.parents("[data-behavior='hidden_field_proxy']");
	}
	hidden_field = jQuery('#' + target.data('hidden_field'));
	hidden_field.val(target.data('value'));
}
function bindClickToSelect(){
	jQuery("[data-click_to_select='true']").click(function(e){
		target = jQuery(this);
		jQuery("[data-click_to_select='true'][data-click_id='" + target.data('click_id') + "']").removeClass('selected');
		target.addClass('selected');
	})
}
