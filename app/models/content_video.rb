class ContentVideo < ContentElement
  include HasVideo
  #constants

  #associations

  #named_scopes

  #special behaviors
  has_attached_file :image,
    :styles => {  :small_thumb => "70x70#",
                  :medium => "270x180>",
                  :large => "600x400>"
                },
    :url => "/system/:class/:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"

  #validations

  #callbacks

  #class methods
  def self.delayed_processing?
    false
  end
  
  def self.human_name
    'video'
  end
  
  #instance methods

  def validate_video
    true
  end
end