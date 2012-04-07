class AdminArea::AuctionsController < AdminArea::ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  
  def index
    @auctions = Auction.all
  end
  
  def new
    @auction = Auction.new
  end

  def create
    auction_params = params[:auction].dup
    type = auction_params.delete :type
    type = type.constantize
    @auction = type.new(auction_params)
    if @auction.save
      index
      render :action => 'index' and return
    else
      render :action => 'new' and return
    end
  end

  def edit
    
  end

  def update
    if @auction.update_attributes(params[@auction.class.name.underscore.to_sym])
      render :action => 'show'
    else
      render :action => 'edit'
    end
  end

  def show
  end

  def destroy
  end

  def get_auction
    @auction = Auction.find(params[:id])
  end
end
