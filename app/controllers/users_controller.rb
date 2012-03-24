class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :show
  before_filter :get_user, :only => [:update, :show, :payment_options, :credit_card, :account_settings]

  def new
    @user = User.new
    render :template => '/users/sign_up_1' and return
  end
  
  def create
    @user = User.new
    @user.attributes = params[:user]
    if @user.save
      render :template => '/users/sign_up_2' and return
    else
      render :template => '/users/sign_up_1' and return
    end
  end
  
  def show
    @user = @this_user
  end

  def edit
    if params[:reset_password]
      load_user_using_perishable_token
      render :template => 'users/reset_password' and return
    else
      require_user
      @user = @this_user
    end
  end
  
  def update
    if params[:reset_password]
      load_user_using_perishable_token
      @user.password = params[@user.class.name.underscore.to_sym][:password]  
      @user.password_confirmation = params[@user.class.name.underscore.to_sym][:password_confirmation]  
      if @user.save  
        flash[:notice] = "Password successfully updated"  
        redirect_to root_url and return
      else  
        render :action => :edit and return
      end
    end

    if params[:user].has_key? :card
      if update_card && @user.save
        render :template => '/users/show' and return
      else
        render :template => '/users/credit_card' and return
      end
    end
    
    if @user.update_attributes(params[@user.class.name.underscore.to_sym])
      if !@this_user and 'finish_sign_up' == params[@user.class.name.underscore.to_sym][:step]
        @user_session = UserSession.new(@user, true)
        render :template => '/users/sign_up_4' and return
      end
      set_sub_nav_tab 'account_settings'
      render :template => next_template and return
    else
      set_sub_nav_tab 'account_settings'
      render :template => this_template and return
    end
  end

  def forgot_password
    @user = User.new
  end

  def request_password_reset
    @user = User.find_by_email(params[:user][:email])
    @user.prepare_password_reset
    flash[:notice] = "We sent password reset instructions to your email address."
    redirect_to root_url and return
  end
  
  def payment_options
    set_sub_nav_tab 'payment_options'
  end
  
  def credit_card
    set_sub_nav_tab 'payment_options'
  end

  def update_card
    set_sub_nav_tab 'payment_options'
    @user.handle_card_update(params[:user])
  end
  
  def sign_up_4
  end
  
  def sign_up_3
  end

  def account_settings
    set_sub_nav_tab 'account_settings'
  end
  
  def activate
    if params[:validate_account]
      load_user_using_perishable_token
      @user.validate_account
      flash[:notice] = "We validated your account, welcome!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
  private
  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])  
    unless @user  
    flash[:notice] = "We're sorry, but we could not locate your account. " +  
    "If you are having issues try copying and pasting the URL " +  
    "from your email into your browser or restarting the " +  
    "reset password process."  
    redirect_to root_url  
    end  
  end
  
  def set_sub_nav_tab(name)
    @my_account_sub_nav = name
    set_nav_tab(name)
  end

  def set_nav_tab(name)
    if ['payment_options','account_settings'].include? name
      @nav_tab = 'my_account'
    end
  end

  def get_user
    @user = @this_user || User.find_by_id(params[:id])
  end
  
  def next_template
    case @user.state
    when 'step_one'
      '/users/sign_up_2'
    when 'step_two'
      '/users/sign_up_3'
    when 'active'
      '/users/account_settings'
    end
  end
  
  def this_template
    case @user.state
    when 'step_one'
      '/users/sign_up_2'
    when 'step_two'
      '/users/sign_up_3'
    when 'active'
      '/users/account_settings'
    end
  end
end
