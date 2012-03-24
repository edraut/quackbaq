class UserAuctionsController < ApplicationController
  before_filter :handle_broken_browser_methods, :only => [:index,:show,:create]

  def index
  end
  
  def show
  end
  
  def create
    @user_auction = UserAuction.new(:user_id => @this_user,:auction_id => params[:auction_id])
    if @user_auction.save
      render :nothing => true, :status => 200
    else
      render :json => {:error => @user_auction.errors}
    end
  end

  def destroy
    @user_auction = UserAuction.where(:auction_id => params[:auction_id], :user_id => @this_user.id)
    @user_auction.each {|ua| ua.destroy}
    render :nothing => true, :status => 200
  end
end