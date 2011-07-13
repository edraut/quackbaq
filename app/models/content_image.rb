class ContentImage < ContentElement
  #constants

  #associations

  #named_scopes

  #special behaviors
  has_attached_file :image,
    :styles => {  :tiny => "105x75#",
                  :small_thumb => "140x75#",
                  :medium => "270x150>",
                  :large => "600x320>"
                },
    :storage => :s3, 
    :s3_credentials => S3_CREDENTIALS,
    :bucket => S3_BUCKET,
    :path => "/:class/:attachment/:id/:style_:filename"


  #validations

  #callbacks

  #class methods

  def self.delayed_processing?
    true
  end
  
  def self.human_name
    'image'
  end
  
  #instance methods

    # generate styles (downloads original first)
    def regenerate_styles!
      self.image.reprocess! 
      self.processing = false   
      self.save(false)
    end

    
end
