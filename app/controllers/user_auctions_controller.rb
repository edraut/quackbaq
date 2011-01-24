class UserAuctionsController < ApplicationController
  before_filter :handle_broken_browser_methods, :only => [:index,:show,:create]

  def index
  end
  
  def show
  end
  
  def create
    @user_auction = UserAuction.new(:user_id => @this_user,:auction_id => params[:auction_id])
    @user_auction.save
    redirect_to auction_url(params[:auction_id].to_i)
  end
end