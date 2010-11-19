// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function bindLinkToForm(){
	$("[data-behavior='link_to_form']").live('click',function(e){
		var form_string = $('<form method="' + $(e.target).attr('data-method') + '" action="' + $(e.target).attr('href') +'" style="display:none;"><input type="hidden" name="authenticity_token" value="'+ authenticity_token + '"></form>');
		$(e.target).after(form_string);
		form_string.submit();
		e.preventDefault();
		return false;
	})
}
$(document).ready(function(){
	bindLinkToForm();
})