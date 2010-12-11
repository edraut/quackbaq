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
function humanize_interval(seconds){
	denominations = [60,60,24,1000];
	time_string = "";
	for(i in denominations){
      if(seconds > 0){
		n = seconds % denominations[i];
        seconds -= n;
		seconds = seconds / denominations[i];
		if(seconds > 0){
			if(n < 10){
				n = "0" + n;
			}
		}
		if(time_string.length == 0){
        	time_string = n;
		} else {
			time_string = n + ":" + time_string;
		}
	  }
	}
	return time_string;
}
