class Notifier < ActionMailer::Base
  default :from => "'Quackbaq Notifications' <notifications@quackbaq.com>"
  default_url_options[:host] = THIS_HOST 

  def password_reset_instructions(user)  
    @password_reset_url = edit_user_url(:id => user.perishable_token, :reset_password => true)  
    mail( :subject => "Password Reset Instructions",
          :to => user.email )
  end  

  def account_validation_instructions(user)
    @account_validation_url = activate_user_url(:id => user.perishable_token, :validate_account => true)  
    mail( :subject => "Account Validation Link",
          :to => user.email )
  end
end