require 'open-uri'
module HasVideo
  def self.included(klass)
    klass.send(:attr_accessor, :embed_params, :api_type)
    klass.send(:before_create, :import_thumbnail)
    klass.send(:before_validation, :clean_url)
  end

  def after_initialize
    self.embed_params = nil
  end
  
  def not_available
    !self.embed_info
  end
  
  def embed_info
    if self.embed_params
      self.embed_params
    else
      if Youtube.verify_url(video_url)
        begin
          self.embed_params ||= Youtube.new(self.video_url)
        rescue
          return nil
        end
      else
        begin
          self.embed_params = OembedVideo.new(self.video_url)
        rescue
          return nil
        end
      end
    end
  end

  def service_name
    case verify_api_type.to_s
    when 'Youtube'
      return 'Youtube'
    else
      return oembed_service_name
    end
  end
  
  def oembed_service_name
    case OEmbed::Providers.find(self.video_url)
    when VIMEO
      return 'Vimeo'
    end
  end
  
  def verify_api_type
    if self.api_type
      return self.api_type
    elsif Youtube.verify_url(video_url)
      return self.api_type = Youtube
    elsif 
      OEmbed::Providers.find( video_url )
      return self.api_type = OEmbed::Providers
    else
      return false
    end
  end
  
  def thumbnail_url
    embed_info.thumbnail_url if embed_info
  end
  
  def title
    embed_info.title if embed_info
  end
  
  def embed_html(width = 550)
    if self.verify_api_type and embed_info
      case self.verify_api_type.name
      when 'Youtube'
        height = ((9.0 / 16.0) * width).to_i + 25
      when 'OEmbed::Providers'
        height = ((self.embed_info.height.to_f / self.embed_info.width.to_f) * width).to_i
      end
      this_html = embed_info.html.gsub(/width="([0-9]+)"/,"width=\"#{width}\"")
      this_html.gsub(/height="([0-9]+)"/,"height=\"#{height}\"")
    else
      return "This video has been removed."
    end
  end
  
  def validate
    if self.validate_video
      unless OEmbed::Providers.find( video_url ) or Youtube.verify_url( video_url )
        self.errors.add(:video_url, "That URL isn't from a supported video site. Double-check the URL and try again.") and return false
      end
      self.errors.add(:video_url, "We couldn't find a video at that address. Double-check the URL and try again.") unless embed_info
    end
  end
  
  def import_thumbnail
    io = open(URI.parse(thumbnail_url))
    def io.original_filename; base_uri.path.split('/').last; end
    self.image = io.original_filename.blank? ? nil : io
  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end

  def clean_url
    # swap vimeo high def video urls for the corresponding non-high def url, since vimeo doesn't support high def over oembed
    if self.video_url =~ /^http:\/\/[^\/]+\/hd#.*/
      self.video_url.sub!(/hd#/,'')
    end
    
  end
end