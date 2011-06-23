class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    if @this_user
      redirect_to auctions_url and return
    end
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_back_or_default auctions_url(:category_id => params[:category_id]) and return
    else
      render :action => :new
    end
  end
  
  def update
    if params[:time_zone_offset]
      session[:time_zone_offset] = params[:time_zone_offset]
    end
    redirect_back_or_default(root_url)
    # render :text => session.inspect and return
  end
  
  def show
    update
  end
  
  def destroy
    current_user_session.destroy
    redirect_back_or_default root_url
  end
end
