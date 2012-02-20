module HasCredentials
  def self.extended(object)
    object.class.class_eval do
      before_validation :clear_old_attempts
      before_validation :update_authlogic_config
    end
  end
  
  def update_authlogic_config
    Rails.logger.info("updating authlogic config: #{self.state}")
    validate_password_field = should_validate_password
    true
  end
  
  def clear_old_attempts
    Rails.logger.info("clearing old attempts? #{self.new_record?}")
    if self.new_record?
      User.where(:email => self.email, :state => ['step_one','step_two']).destroy_all
    end
  end
    
end