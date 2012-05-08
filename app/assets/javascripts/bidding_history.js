
var TabGroup = Class.extend({
  init: function(jq_obj){
    this.jq_obj = jq_obj;
    this.tab_group_name = this.jq_obj.data("bid_history_tab_group");
    this.setTabSelector();
    this.setContentWrapperSelector();
    this.setClasses();
    this.content_wrapper = jQuery(this.content_wrapper_selector);
    this.initTabs();
  },
  setTabSelector: function(){
    if(typeof(this.tab_selector) == 'undefined'){
      this.tab_selector = '[data-tab]';
    }
    this.tab_name_data = this.tab_selector.replace("[data-","").replace("]","");
    if(typeof(this.tab_class) == 'undefined'){
      this.tab_class = Tab;
    }
  },
  setContentWrapperSelector: function(){
    if(typeof(this.content_wrapper_selector) == 'undefined'){
      this.content_wrapper_selector = '[data-tab_content_wrapper="' + this.tab_group_name + '"]';
    }
  },
  setClasses: function(){
    if(typeof(this.selected_class) == 'undefined'){
      this.selected_class = 'selected';
    };
    if(typeof(this.deselected_class) == 'undefined'){
      this.deselected_class = 'deselected';
    }
  },
  initTabs: function(){
    var tab_group = this;
    tab_group.tabs = {};
    tab_group.jq_obj.find(this.tab_selector).each(function(){
      new_tab = new tab_group.tab_class(jQuery(this),tab_group);
      tab_group.tabs[new_tab.tab_name] = new_tab;
    })
    tab_group.tabs[tab_group.default_tab_name].user_select();
  },
  getSiblings: function(tab){
    var siblings = [];
    var this_tab = tab;
    jQuery.each(this.tabs,function(some_tab_name,some_tab){
      if(some_tab_name != this_tab.tab_name){
        siblings.push(some_tab);
      }
    });
    return siblings;
  },
  setContents: function(html){
    this.content_wrapper.html(html);
  }
});
var Tab = Class.extend({
  init: function(jq_obj,tab_group){
    this.tab_group = tab_group;
    this.jq_obj = jq_obj;
    this.tab_name = this.jq_obj.data(this.tab_group.tab_name_data);
    this.url = this.jq_obj.data('url')
    var this_tab = this;
    this.jq_obj.live('click',function(e){
      this_tab.user_select();
    })
  },
  user_select: function(){
    this.jq_obj.removeClass(this.tab_group.deselected_class);
    this.jq_obj.addClass(this.tab_group.selected_class)
    this_tab = this;
    these_siblings = this.getSiblings();
    jQuery.each(these_siblings,function(index,sibling){
      sibling.user_deselect();
    });
    var bid_tab = this;
    jQuery.ajax({
      type: 'GET',
      url: bid_tab.url,
      dataType: 'html',
      success: function(data, textStatus){
        bid_tab.tab_group.setContents(data);
        if(typeof(bid_tab.user_select_success) == 'function'){
          bid_tab.user_select_success();
        }
      },
      error: function(jqXHR, textStatus, errorThrown){
        console.log(textStatus);
        console.log(errorThrown);
      }
    })
  },
  user_deselect: function(){
    this.jq_obj.removeClass(this.tab_group.selected_class);
    this.jq_obj.addClass(this.tab_group.deselected_class);
  },
  getSiblings: function(){
    return this.tab_group.getSiblings(this);
  }
});
var BidHistoryTabGroup = TabGroup.extend({
  init: function(jq_obj){
    this.tab_selector = "[data-bid_history_tab]";
    this.tab_class = BidHistoryTab;
    this.selected_class = "account_gray_background";
    this.deselected_class = "white_background";
    this.default_tab_name = 'auctions_won';
    this.spinner = jq_obj.find("[data-tab_spinner]");
    this._super(jq_obj);
  }
});
var BidHistoryTab = Tab.extend({
  init: function(jq_obj,tab_group){
    this._super(jq_obj,tab_group);
    this.wrapper = this.jq_obj.parent();
    this.jq_obj.corner('top 2px');
    this.wrapper.corner('top 4px');
  },
  user_select: function(){
    this.start_spinner();
    this._super();
  },
  start_spinner: function(){
    console.log("starting spinner for:");
    console.log(this)
    this.tab_group.setContents(this.tab_group.spinner.clone().show());
  }
});
jQuery(document).ready(function(){
  jQuery('[data-bid_history_tab_group]').each(function(){
    var auction = new BidHistoryTabGroup(jQuery(this));
  });
});
