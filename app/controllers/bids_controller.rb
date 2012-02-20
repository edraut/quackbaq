class BidsController < ApplicationController
  before_filter :require_active_user
  
  def index
    @bids = @this_user.bids
  end
  
  def create
    @bid_package = BidPackage.find(params[:bid_package_id].to_i)
    for i in (1..@bid_package.quantity)
      @bid = Bid.create(:price_paid => @bid_package.price_per_bid, :user_id => @this_user.id)
    end
    index
    render :action => 'index'
  end
  
  def show
    update and return
  end
  
  def update
    @bid = @this_user.bids.available.first
    if @bid
      @auction = Auction.find(params[:placed_auction_id].to_i)
      if @auction.in_progress?
        @bid.placed_auction_id = params[:placed_auction_id].to_i
        @bid.placed_at = Time.now
        @bid.save
        if @auction.time_left_in_seconds <= 20
          @auction.reset_timer
          @auction.save
        end
        pubnub = Pubnub.new(PUBNUB_PUBLISH, PUBNUB_SUBSCRIBE,PUBNUB_SECRET, false)
        pubnub.publish('channel' => @auction.channel_name, 'message' => {'new_price' => @auction.current_price.format,'time_left' => @auction.time_left_in_seconds,'bidder_name' => @this_user.name})
        # begin
        #   Nestful.post("#{HOOKBOX_URL}/web/get_channel_info", :params => {:security_token => 'secret', :channel_name => @auction.channel_name})
        # rescue
        #   @auction.create_channel
        # end
        # Nestful.post("#{HOOKBOX_URL}/web/publish", :params => {:security_token => 'secret', :channel_name => @auction.channel_name, :originator => @this_user.email, :payload => {:new_price => @auction.current_price.format,:time_left => @auction.time_left_in_seconds}.to_json})
        render :json => {:bid_count => @this_user.bids.available.count,:auction_id => @auction.id}, :content_type => 'text/plain' and return
      else
        pubnub.publish('channel' => @auction.channel_name, 'message' => {'event' => 'WINNER', 'winner' => @auction.winner.name})
        # Nestful.post("#{HOOKBOX_URL}/web/publish", :params => {:security_token => 'secret', :channel_name => @auction.channel_name, :originator => 'quackbaq', :payload => {:event => 'WINNER', :winner => @auction.winner.email} })
        # Nestful.post("#{HOOKBOX_URL}/web/destroy_channel", :params => {:security_token => 'secret', :channel_name => @auction.channel_name })
      end
    else
      render :json => {:auction_status => 'closed'}
    end
  end
end
