class AuctionsController < ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  
  def index
    @auctions = Auction.all
  end
  
  def show
    @hookbox = true
  end

  def get_auction
    @auction = Auction.find(params[:id])
  end
end
