class AdminArea::ItemsController < AdminArea::ApplicationController
  before_filter :get_item, :only => [:edit,:update,:show,:destroy]
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      render :action => 'show' and return
    else
      render :action => 'new' and return
    end
  end

  def edit
    
  end

  def update
    if @item.update_attributes(params[:item])
      render :action => 'show'
    else
      render :action => 'edit'
    end
  end

  def show
  end

  def destroy
  end

  def get_item
    @item = Item.find(params[:id])
  end
end
