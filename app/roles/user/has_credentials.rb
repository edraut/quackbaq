module User::HasCredentials
  def self.included(klass)
    klass.class_eval do
      before_validation :clear_old_attempts
      before_validation :update_authlogic_config
    end
  end
  
  def update_authlogic_config
    validate_password_field = should_validate_password
    true
  end
  
  def clear_old_attempts
    if self.new_record?
      User.where(:email => self.email, :state => ['step_one','step_two']).destroy_all
    end
  end
    
end