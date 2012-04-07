class ContentImageTmp < ContentImage
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
    temp_file = image.to_file # Paperclips way of getting a File object for the attachment

    # Save it as a regular attachment
    # this will save to S3
    self.class.connection.execute("update content_elements set type = 'ContentImage' where id = #{self.id}")
    s3_upload = ContentImage.find(self.id) # Same db record but we need the S3 version
    s3_upload.image = temp_file  # reset the file - it will assume its a new file
    s3_upload.save!             # Paperclip will upload the file on save

    # Delete the temporary file when we are done
    temp_file.close
    File.delete(temp_path)
    s3_upload.regenerate_styles!
  end

  # detect if our source file has changed
  def image_changed?
    self.image_file_name_changed? ||
    self.image_content_type_changed?
  end
 
end