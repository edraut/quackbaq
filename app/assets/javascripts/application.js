//= require jquery-1.6.2.min
//= require_self
//= require_tree .

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
};
function humanize_interval(seconds){
	if (seconds < 1) {
		return 'CLOSED';
	}
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
};
function checkForFinishedImage(id){
	old_href = jQuery('#refresh_images_link').attr('href');
	jQuery('#refresh_images_link').attr('href',jQuery('#refresh_images_link').attr('href') + '/' + id);
	jQuery('#refresh_images_link').attr('data-ajax_success_element','content_element_' + id)
	jQuery('#refresh_images_link').click();
	jQuery('#refresh_images_link').attr('href',old_href);
};
function clickRefreshImageLink(id,columns){
  console.log("clicking refresh!");
	new_item = jQuery('#content_element_container_template').clone();
	new_item.attr('id','content_element_' + id);
	new_item.appendTo('#content_element_list');
	if((jQuery("[data-role='content_element_container']").length % columns) == 0){
		new_item.addClass('last');
	}
	new_item.show();
	checkForFinishedImage(id);
	jQuery('#content_element_new').empty();
	jQuery('#content_element_new_links').show();
};
function roundCorners(){
	jQuery('.auto_bid_block').corner('3px');
	jQuery('.bid_history_text').corner('4px left');
	jQuery('.field_entry, .field_entry_half').corner('5px');
	jQuery('.account_gray_background').corner('5px');
};
jQuery(document).ready(function(){
	bindLinkToForm();
	bindClickToSelect();
	jQuery("[data-button]").live('click',buttonControl);
	roundCorners();
  //change this to true to enable troubleshooting mode
  var myfont_webfont_test = false;
  // change this to false if you're having trouble with WOFFs
  var woffEnabled = true;
  // to place your webfonts in a custom directory, uncomment this and set it to where your webfonts are.
  //var customPath = "/themes/fonts";
});
/* Simple JavaScript Inheritance
 * By John Resig http://ejohn.org/
 * MIT Licensed.
 */
// Inspired by base2 and Prototype
(function(){
  var initializing = false, fnTest = /xyz/.test(function(){xyz;}) ? /\b_super\b/ : /.*/;
  // The base Class implementation (does nothing)
  this.Class = function(){};
  
  // Create a new Class that inherits from this class
  Class.extend = function(prop) {
    var _super = this.prototype;
    
    // Instantiate a base class (but only create the instance,
    // don't run the init constructor)
    initializing = true;
    var prototype = new this();
    initializing = false;
    
    // Copy the properties over onto the new prototype
    for (var name in prop) {
      // Check if we're overwriting an existing function
      prototype[name] = typeof prop[name] == "function" && 
        typeof _super[name] == "function" && fnTest.test(prop[name]) ?
        (function(name, fn){
          return function() {
            var tmp = this._super;
            
            // Add a new ._super() method that is the same method
            // but on the super-class
            this._super = _super[name];
            
            // The method only need to be bound temporarily, so we
            // remove it when we're done executing
            var ret = fn.apply(this, arguments);        
            this._super = tmp;
            
            return ret;
          };
        })(name, prop[name]) :
        prop[name];
    }
    
    // The dummy class constructor
    function Class() {
      // All construction is actually done in the init method
      if ( !initializing && this.init )
        this.init.apply(this, arguments);
    }
    
    // Populate our constructed prototype object
    Class.prototype = prototype;
    
    // Enforce the constructor to be what we expect
    Class.prototype.constructor = Class;

    // And make this class extendable
    Class.extend = arguments.callee;
    
    return Class;
  };
})();