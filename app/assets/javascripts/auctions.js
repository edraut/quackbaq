var AuctionPage = Class.extend({
  init: function(jq_obj){
    this.jq_obj = jq_obj;
    this.logged_in = this.jq_obj.data('logged_in');
    this.tick_count = 0;
    this.start_time = new Date().getTime();
    this.timer_handle = 0;
    this.initAuctions();
    var auction_page = this;
    this.timer_handle = setTimeout(function(){auction_page.cycleTimer()},1000);
  },
  initAuctions: function(){
    var auction_page = this;
    auction_page.auctions = {};
    this.jq_obj.find("[data-auction_type]").each(function(){
      push_channel = jQuery(this).data('push_channel');
      auction_type = eval(jQuery(this).data('auction_type'));
      auction_page.auctions[push_channel] = new auction_type(jQuery(this),auction_page);
    })
    this.jq_obj.find("[data-auction]").each(function(){
      push_channel = jQuery(this).data('push_channel');
      auction_page.auctions[push_channel] = new AnyAuction(jQuery(this),auction_page);
    })
    this.jq_obj.find("[data-my_auction]").each(function(){
      push_channel = jQuery(this).data('push_channel');
      auction_page.auctions[push_channel] = new MyAuction(jQuery(this),auction_page);
    })
  },
  cycleTimer: function (){
    this.tick_count += 1000;
    slew = (new Date().getTime() - this.start_time) - this.tick_count;
    jQuery.each(this.auctions,function(push_channel,auction){
      auction.cycleTimer();
    });
    var auction_page = this;
    timer_handle = setTimeout(function(){auction_page.cycleTimer()},(1000 - slew));
  },
  secondsLeft: function (seconds_left){
    return seconds_left - (this.tick_count / 1000);
  },
  checkAllClosed: function(){
    if(this.allClosed()){
      clearTimeout(this.timer_handle);
    }
  },
  allClosed: function(){
    jQuery.each(this.auctions,function(push_channel,auction){
      if(!auction.is_closed){
        return false;
      }
    });
    return true;
  },
});
var Auction = Class.extend({
	init: function(jq_obj,auction_page){
		this.jq_obj = jq_obj;
    this.auction_page = auction_page;
    this.time_left_wrapper = this.jq_obj.find('[data-role="time_left"]');
    this.seconds_left = this.time_left_wrapper.data('seconds_left');
    this.is_closed = this.seconds_left <= 0;
    this.did_i_win_url = this.jq_obj.data('did_i_win_url');
    this.channel_name = this.jq_obj.data('push_channel');
    this.updateTimer();
    if(this.auction_page.logged_in){
      this.bid_link = new PlaceBidLink(this);
    };
    var auction = this;
    PUBNUB.subscribe({
      channel  : auction.channel_name,
      callback : function(message) {
        auction.refreshStats(message);
      },
      error    : function(e) {
          // Do not call subscribe() here!
          // PUBNUB will auto-reconnect.
        console.log(e);
      }
    });
	},
  cycleTimer: function(){
    if(!this.checkIfDone()){
      this.updateTimer();
    };
  },
  updateTimer: function (){
    this.time_left_wrapper.html(humanize_interval(this.auction_page.secondsLeft(this.seconds_left)));
  },
  checkIfDone: function(){
    if(this.is_closed){
      return true;
    };
    if(this.auction_page.secondsLeft(this.seconds_left) <= 0){
      this.closeAuction();
      return true;
    };
    return false;
  },
  closeAuction: function(){
    var auction = this;
    auction.bid_link.hide();
    auction.is_closed = true;
    auction.auction_page.checkAllClosed();
    jQuery.ajax({
      url: this.did_i_win_url,
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        if(data.did_i_win){
          auction.time_left_wrapper.html('YOU WON!')
        } else {
          auction.time_left_wrapper.html('CLOSED');
        }
      }
    })
  }
});
var AnyAuction = Auction.extend({
  init: function(jq_obj,auction_page){
    this._super(jq_obj,auction_page);
    this.mine_button = new MineButton(this.jq_obj);
  },
  refreshStats: function(message){
    this.jq_obj.find("[data-push_data_type='current_price']").html(message.new_price);
    this.jq_obj.find("[data-push_data_type='highest_bidder']").html(message.bidder_name);
  }

});
var MyAuction = Auction.extend({
  init: function(jq_obj,auction_page){
    this._super(jq_obj,auction_page);
    this.not_mine_button = new NotMineButton(this.jq_obj);
  }
});
var SingleAuction = Auction.extend({
  init: function(jq_obj,auction_page){
    this._super(jq_obj,auction_page);
    auction = this;
    PUBNUB.history(
      {channel:auction.channel_name,limit: 5},
      function(info){
        for(i=0;i < info.length;i++){
          auction.refreshStats(info[i]);
        }
      }
    );
  },
  refreshStats: function (new_history){
    new_history_item = jQuery("[data-id='bid_history_item_template']").clone();
    new_history_item.attr("data-id",'');
    jQuery('#bid_history').prepend(new_history_item);
    new_history_item.find('.bid_history_amount').html(new_history.new_price);
    new_history_item.find('.bid_history_name').html(new_history.bidder_name);
    jQuery('#current_price').html(new_history.new_price);
    jQuery('#highest_bidder').html(new_history.bidder_name);
    jQuery('.bid_history_text').removeClass('current');
    jQuery('.bid_history_item').removeClass('current');
    new_history_item.find('.bid_history_text').addClass('current');
    new_history_item.addClass('current');
    if(jQuery('#bid_history').children().length > 5){
      jQuery('#bid_history').children(':last').remove();
    }
    new_history_item.show();
  }
});
var PlaceBidLink = Class.extend({
  init: function(auction){
    this.auction = auction;
    this.jq_obj = auction.jq_obj.find('[data-behavior="place_bid_link"]');
    this.url = this.jq_obj.attr('href');
    var bid_link = this;
    this.jq_obj.live('click',function(e){
      jQuery.ajax({
        url: bid_link.url,
        type: 'PUT',
        dataType: 'json',
        data: {authenticity_token: authenticity_token},
        success: function(data,textStatus) {
          jQuery('#available_bids').html(data.bid_count);
          if(data.bid_count == 0){
            jQuery("[data-behavior='place_bid_link']").hide();
            jQuery("[data-behavior='buy_bids_link']").show();
          }
        }
      });
      return false;
    })
  },
  hide: function(){
    this.jq_obj.hide();
  }
});
var GenericMineButton = Class.extend({
  init: function(auction){
    this.auction = auction;
    this.auction_id = auction.data('auction_id');
  }
});
var MineButton = GenericMineButton.extend({
	init: function(auction){
    this._super(auction);
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
});
var NotMineButton = GenericMineButton.extend({
  init: function(auction){
    this._super(auction);
    this.jq_obj = auction.find("[data-not_mine_button]");
    this.bindClick();
  },
  bindClick: function(){
    var not_mine_button = this;
    this.jq_obj.live('click',function(e){
      jQuery.ajax({
        url: '/user_auctions/0',
        type: 'DELETE',
        data: {authenticity_token: authenticity_token, _method: 'DELETE', auction_id: not_mine_button.auction_id},
        success: function(){console.log('got success from ajax!');not_mine_button.auction.remove();}
      })
    })
  }
});
jQuery(document).ready(function(){
	jQuery('[data-auction_page]').each(function(){
		var auction = new AuctionPage(jQuery(this));
	});
  if(jQuery('#my_auction_list')){
    jQuery('body').height(jQuery('#my_auction_list').outerHeight() + 400);
  }
})
