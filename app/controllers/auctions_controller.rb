class AuctionsController < ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:did_i_win,:destroy]
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
  
  def my_bid_history
    @my_account_sub_nav = 'bidding_history'
  end

  def my_won
    @auctions = Auction.won_by(@this_user)
    render :partial => 'bid_history_list' and return
  end

  def my_bid
    @auctions = Auction.won.bid_on_by(@this_user)
    render :partial => 'bid_history_list' and return
  end

  def show
    @pubnub = true
  end

  def did_i_win
    @did_i_win = (@auction.finished? and @auction.winner == @this_user)
    render :json => {:did_i_win => @did_i_win} and return
  end

  def get_auction
    @auction = Auction.find(params[:id])
    @category = @auction.category
  end
end
