class AuctionsController < ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  before_filter :require_active_user, :only => [:my]
  def index
    if params[:category_id]
      if params[:category_id].to_i > 0
        @category = Category.find(params[:category_id])
      else
        if @this_user
          @category = Category.first
        else
          redirect_to sign_in_url and return
        end
      end
    else
      if @this_user
        @category = Category.first
      else
        redirect_to sign_in_url and return
      end
    end
    if @category
      @auctions = @category.auctions.in_progress
    end
    @auctions ||= Auction.in_progress
    @pubnub = true
    unless @this_user
      @user_session = UserSession.new
    end
  end
  
  def my
    @my_auctions = true
    @auctions = @this_user.auctions
    @pubnub = true
    @nav_tab = 'my_account'
    @my_account_sub_nav = 'my_auctions'
  end
  
  def show
    @pubnub = true
  end

  def get_auction
    @auction = Auction.find(params[:id])
    @category = @auction.category
  end
end
