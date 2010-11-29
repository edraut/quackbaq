/* All Code Copyright 2008 Eric Draut all rights reserved
*/

function bindLinkToForm(){
	jQuery("[data-behavior='link_to_form']").live('click',function(e){
		var form_string = jQuery('<form method="' + jQuery(e.target).attr('data-method') + '" action="' + jQuery(e.target).attr('href') +'" style="display:none;"><input type="hidden" name="authenticity_token" value="'+ authenticity_token + '"></form>');
		jQuery(e.target).after(form_string);
		form_string.submit();
		e.preventDefault();
		return false;
	})
}
jQuery(document).ready(function(){
	bindLinkToForm();
})