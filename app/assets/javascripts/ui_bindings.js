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
	hidden_field = jQuery('#' + target.data('hiddenField'));
	hidden_field.val(target.data('value'));
}
function hiddenMultiProxy(e){
	target = jQuery(this);
	hidden_field = jQuery("input[type='hidden'][name='" + target.attr('data-hidden_field') + "[]'][value='" + target.attr('data-value') + "'][data-id='" + target.attr('data-id') + "']");
	if(hidden_field.length == 0){
		hidden_field = jQuery('<input type="hidden" name="' + target.attr('data-hidden_field') + '[]" value="' + target.attr('data-value') + '" data-id="' + target.attr('data-id') + '"/>');
		target.parents('form').append(hidden_field);
	} else {
		hidden_field.remove();
	}
	if(target.parents("[data-behavior='expander']").length > 0){
		save_button = jQuery("[data-hidden_proxy_save='true'][data-id='" + target.parents("[data-behavior='expander']:first").attr('data-id') + "']");
		close_button = jQuery("[data-hidden_proxy_close='true'][data-id='" + target.parents("[data-behavior='expander']:first").attr('data-id') + "']");
	} else {
		save_button = jQuery("[data-hidden_proxy_save='true']");
		close_button = jQuery("[data-hidden_proxy_close='true']");
	}
	close_button.hide();
	save_button.show();
}
function bindHiddenFieldProxy(){
	jQuery("[data-behavior='hidden_field_proxy']").die('click');
	jQuery("[data-behavior='hidden_field_proxy']").live('click',hiddenFieldProxy);
}
function bindHiddenMultiProxy(){
	jQuery("[data-behavior='hidden_multi_proxy']").die('click');
	jQuery("[data-behavior='hidden_multi_proxy']").live('click',hiddenMultiProxy);
}
function bindClickToSelect(){
	jQuery("[data-click_to_select='true']").click(function(e){
		target = jQuery(this);
		jQuery("[data-click_to_select='true'][data-click_id='" + target.data('clickId') + "']").removeClass('selected');
		target.addClass('selected');
	})
}
function buttonControl(e){
	target = jQuery(e.target);
	if(!target.attr('data-button')){
		target = target.parents("[data-button]");
	}
	if(target.data('confirm')){
		if(!confirm(target.data('confirm'))){
			e.preventDefault();
			return false;
		};
	}
	if(target.attr('data-submit')){
		target.parents('form').submit();
		e.preventDefault();
		e.stopPropagation();
		return false;
	}
	if(target.attr('href')){
		document.location = target.attr('href');
		return false;
	}
	link = target.find("[data-behavior='link_to_form']");
	if(link.length == 0){
		link = target.find("[data-role='delete']");
	}
	if(link.length == 0){
		link = target.find("[data-ajax_behavior='ajax_link']");
	}
	if(link.length == 0){
		link = target.find("[data-behavior='expander'][data-action]");
	}
	if(link.length > 0){
		e.stopPropagation();
		e.preventDefault();
		link.click();
		return false;
	}
	if(link.length == 0){
		link = target.find('[href]');
		if(link.length > 0){
			document.location.href = link.attr('href');
			return true;
		}
	}
	if(link.length == 0){
		form = target.find('form');
		if(form.length > 0){
			form.submit();
		}
	}
}
