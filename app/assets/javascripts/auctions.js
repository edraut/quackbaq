var Auction = Class.extend({
	init: function(jq_obj){
		this.jq_obj = jq_obj;
		this.mine_button = new MineButton(jq_obj);
	}
});

var MineButton = Class.extend({
	init: function(auction){
		this.auction = auction;
    this.auction_id = auction.data('auction_id');
		this.jq_obj = auction.find("[data-mine_button]");
    this.on_image = this.jq_obj.find('#duckfootOn');
    this.off_image = this.jq_obj.find('#duckfootOff');
		this.method_map = {'on': 'DELETE', 'off': 'POST'};
		this.url_map = {'on': '/user_auctions/0', 'off': '/user_auctions'};
		this.bindClick();
	},
	setState: function(new_state){
		this.jq_obj.data('state', new_state);
	},
	getState: function(){
		return this.jq_obj.data('state');
	},
	bindClick: function(){
		var mine_button = this;
		this.jq_obj.live('click', function(){mine_button.requestToggleState()});
	},
	requestToggleState: function(){
		var mine_button = this;
    var current_state = this.getState();
		var ajax_method = this.method_map[current_state];
		var ajax_url = this.url_map[current_state];
		jQuery.ajax({
			url: ajax_url,
			type: ajax_method,
      data: {authenticity_token: authenticity_token, _method: ajax_method, auction_id: mine_button.auction_id},
			success: function(){console.log('got success from ajax!');mine_button.toggleState();}
		})
	},
	toggleState: function(){
		var current_state = this.getState();
    console.log(current_state);
    console.log(this.off_image);
    if(current_state == 'off'){
      this.setState('on');
      this.off_image.hide();
      this.on_image.show();
    } else {
      this.setState('off');
      this.on_image.hide();
      this.off_image.show();
    }
	}
})
jQuery(document).ready(function(){
	jQuery('[data-auction_list_item]').each(function(){
		var auction = new Auction(jQuery(this));
	})
})