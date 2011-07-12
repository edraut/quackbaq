class AuctionsController < ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  before_filter :require_user, :only => [:my]
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
    @hookbox = true
    unless @this_user
      @user_session = UserSession.new
    end
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
    @category = @auction.category
  end
end
