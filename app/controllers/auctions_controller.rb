class AuctionsController < ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  before_filter :require_user, :only => [:my]
  def index
    @auctions = Auction.in_progress
    @hookbox = true
  end
  
  def my
    @my_auctions = true
    @auctions = @this_user.auctions
    @hookbox = true
    render :action => 'index' and return
  end
  
  def show
    @hookbox = true
  end

  def get_auction
    @auction = Auction.find(params[:id])
  end
end
