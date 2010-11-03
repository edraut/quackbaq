class AdminArea::AuctionsController < AdminArea::ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  
  def index
    @auctions = Auction.all
  end
  
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new({:user_id => @current_user.id}.merge(params[:auction]))
    if @auction.save
      render :action => 'edit' and return
    else
      render :action => 'new' and return
    end
  end

  def edit
    
  end

  def update
  end

  def show
  end

  def destroy
  end

  def get_auction
    @auction = Auction.find(params[:id])
  end
end
