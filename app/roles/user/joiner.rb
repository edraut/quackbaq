module Joiner
  
  def self.extended(object)
    object.extend HasCredentials
    object.class.class_eval do
      before_save :handle_state
    end
  end
 
  def handle_state
    Rails.logger.info("next action: #{self.next_action} step: #{self.step}")
    self.send self.step if self.next_action == self.step
  end
  
end