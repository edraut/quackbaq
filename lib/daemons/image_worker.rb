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

