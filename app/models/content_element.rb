class ContentElement < ActiveRecord::Base
  TEXT_CONTAINERS = []
  IMAGE_CONTAINERS = ['Item']
  VIDEO_CONTAINERS = []
  COLUMNS = 3
  include FormatsErrors
  belongs_to :container, :polymorphic => true

  def image_specifications
    case self.container_type
    when 'Item'
		  ['525px x 316px','Maximum	size:	3	MB','JPG or PNG']
	  end
  end

end