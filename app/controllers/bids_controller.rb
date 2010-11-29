class BidsController < ApplicationController
  before_filter :require_user
  
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
  
  def update
    @bid = @this_user.bids.available.first
    @bid.placed_auction_id = params[:placed_auction_id].to_i
    @bid.placed_at = Time.now
    @bid.save
    Nestful.post("#{HOOKBOX_URL}/web/publish", :params => {:security_token => 'secret', :channel_name => @bid.placed_auction.channel_name, :originator => @this_user.email, :payload => @bid.placed_auction.current_price.format.to_json})
    render :json => {:bid_count => @this_user.bids.available.count}
  end
end
