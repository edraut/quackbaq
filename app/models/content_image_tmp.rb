class ContentImageTmp < ContentImage
  cattr_accessor :permanent_class

  @@permanent_class = ContentImage
  has_attached_file :image,
    :path => ":rails_root/tmp/uploads/:class/:attachment/:id/:style_:filename"

    # cancel content-processing now, and set flag...
  before_image_post_process do |content_image|
    if content_image.image_changed?
      content_image.processing = true
      return false # halts processing
    end
  end

    # ...and perform after save in background
  after_save do |content_image| 
    if content_image.image_changed?
      Rails.logger.info("sending job to coney island")
      exchange = AMQP.channel.topic('coney_island')
      exchange.publish({:object_id => content_image.id}.to_json, :routing_key => 'carousels.ContentImageTmp.move_to_s3')
    end
  end

  def move_to_s3
    temp_path = image.path
    temp_file = StringIO.new(File.read(temp_path))
    temp_file.class_eval { attr_accessor :original_filename, :content_type}
    temp_file.original_filename = image.original_filename
    temp_file.content_type = image.content_type

    # Save it as a regular attachment
    # this will save to S3
    s3_upload = ContentImage.new(:body => self.body, :container_id => self.container_id, :container_type => self.container_type) # Same db record but we need the S3 version
    s3_upload.image = temp_file  # reset the file - it will assume its a new file
    s3_upload.save             # Paperclip will upload the file on save

    self.permanent_id = s3_upload.id
    self.processing = false
    self.save
  end

  # detect if our source file has changed
  def image_changed?
    self.image_file_name_changed? ||
    self.image_content_type_changed?
  end
 
end