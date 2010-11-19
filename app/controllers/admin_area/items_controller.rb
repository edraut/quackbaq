class AdminArea::ItemsController < AdminArea::ApplicationController
  before_filter :get_item, :only => [:edit,:update,:show,:destroy]
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    prepare_params
    manage_money
    @item = Item.new(@editable_params)
    if @item.save
      index
      render :action => 'index' and return
    else
      render :action => 'new' and return
    end
  end

  def edit
    
  end

  def update
    prepare_params
    manage_money
    if @item.update_attributes(@editable_params)
      render :action => 'show'
    else
      render :action => 'edit'
    end
  end

  def show
  end

  def destroy
  end

  def prepare_params
    @editable_params = params[:item].dup
    @money_attributes = [:full_price,:shipping_cost]
  end
  
  def get_item
    @item = Item.find(params[:id])
  end
end
