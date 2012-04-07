module User::Joiner
  
  def self.included(klass)
    klass.class_eval do
      before_save :handle_state
    end
  end
 
  def handle_state
  	if self.next_action
	    self.send self.step if self.next_action == self.step
	end
  end
  
end