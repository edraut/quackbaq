class AdminArea::AuctionsController < AdminArea::ApplicationController
  before_filter :get_auction, :only => [:edit,:update,:show,:destroy]
  
  def index
    @auctions = Auction.all
  end
  
  def new
    @auction = Auction.new
  end

  def create
    type = params[:auction][:type].constantize
    @auction = type.new(params[:auction])
    if @auction.save
      render :action => 'show' and return
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
