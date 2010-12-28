class HookboxController < ApplicationController
  protect_from_forgery :except => [:connect,:disconnect,:create_channel,:subscribe,:unsubscribe,:poll,:destroy_channel,:publish]
  def connect
    Rails.logger.info("Hookbox reports a connection from a user.")
    render :json => [true, {"name" => current_user ? @this_user.email : session["id"]}] and return
  end
  def disconnect
    render :json => [true, {}] and return
  end
  def create_channel
    render :json => [true, {:history_size => 5}] and return
  end
  def subscribe
    render :json => [true, {}] and return
  end
  def unsubscribe
    render :json => [true, {}] and return
  end
  def publish
    render :json => [true, {}] and return
  end
  def destroy_channel
    render :json => [true, {}] and return
  end
end
