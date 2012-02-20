class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
  before_filter :get_this_user
  before_filter :handle_time_zone
  before_filter :set_nav_tab
  
  def string_to_money(string)
    Money.new(string.to_f * 100)
  end
  
  def manage_money
    for money_attribute in @money_attributes
      @editable_params[money_attribute] = string_to_money(@editable_params[money_attribute])
    end
  end

  def handle_broken_browser_methods
    if params[:_method]
      case params[:_method].downcase
      when 'put'
        update and return
      when 'delete'
        destroy and return
      when 'post'
        create and return
      end
    end
  end

  def set_nav_tab
    case controller_name
    when 'auctions'
      case action_name
      when 'index'
        @nav_tab = 'auctions'
      end
    when 'users'
      case action_name
      when 'show'
        @nav_tab = 'account'
      end
    end
  end
  
  private
  
    def handle_time_zone
      unless session[:time_zone_offset]
        store_location
      end
    end
    
    def get_this_user
      @this_user = current_user
    end
    
    def require_active_user
      return false unless require_user
      unless @this_user.active?
        redirect_to next_sign_up_page
        return false
      end
    end

    def next_sign_up_page
      case @this_user.state
      when :step_one
        sign_up_2_user_url(@this_user)
      when :step_two
        sign_up_3_user_url(@this_user)
      when :step_three
        sign_up_4_user_url(@this_user)
      end
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      Time.zone = ActiveSupport::TimeZone[-session[:time_zone_offset].to_i]
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    def require_user 
      unless current_user 
        store_location 
        flash[:notice] = "You must be logged in to access this page" 
        redirect_to sign_in_url
        return false 
      end
      return true
    end
    def require_admin
      if require_user
        if current_user.class.name != 'Admin'
          flash[:notice] = "You don't have the right privileges to view that page."
          redirect_to root_url
          return false
        else
          return true
        end
      else
        return false
      end
    end
    
    def require_no_user 
      if current_user 
        store_location 
        flash[:notice] = "You must be logged out to access this page" 
        redirect_to root_url 
        return false 
      end 
    end 
    def store_location
      session[:return_to] = request.url
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
