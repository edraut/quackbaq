#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

require File.dirname(__FILE__) + "/../../config/application"
Rails.application.require_environment!
include Minion
Minion.amqp_url = IMAGE_PROCESSING_QUEUE_URL

$running = true
Signal.trap("TERM") do 
  $running = false
end

job "image.upload" do |args|
  post_image = ContentImageTmp.find(args["image_id"])
  post_image.move_to_s3
  {"image_id" => args["image_id"]}
end
job "image.process" do |args|
  post_image = ContentImage.find(args["image_id"])
  post_image.regenerate_styles!
end
