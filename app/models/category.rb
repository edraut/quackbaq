class Category < ActiveRecord::Base
  has_many :items
  has_many :auctions, :through => :items
  
  scope :ordered, order('position')
  has_attached_file :image,
    :styles => {  :small_thumb => "70x70#",
                  :medium => "270x180>",
                  :large => "600x400>"
                },
    :storage => :s3, 
    :s3_credentials => S3_CREDENTIALS,
    :bucket => S3_BUCKET,
    :path => "/:class/:attachment/:id/:style_:filename"
end