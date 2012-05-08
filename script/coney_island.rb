#!/usr/bin/env ruby

## Copyright 2011 Eric Draut, all rights reserved
ON_CONEY_ISLAND = true
$LOAD_PATH.push '.'
require 'config/environment.rb'

class ConeyIsland
  cattr_accessor :instance_name, :full_instance_name, :instance_number, :ticket, :logger

  @@instance_name = ARGV[0]
  @@instance_number = ARGV[1] || '0'
  @@logger = Logger.new('log/coney_island.log')

  @@config = Psych.load(File.read(File.join(Rails.root,"config","coney_island.yml")))
  unless @@instance_name
    @@instance_name = @@config['carousels'].keys.first
  end
  @@instance_config = @@config['carousels'][@@instance_name]

  @@full_instance_name = @@instance_name + @@instance_number

  @@ticket = @@instance_config['ticket']
  @@logger.level = @@config['log_level']
  @@logger.info("config: #{@@config}")

end

def shutdown
  @queue.unsubscribe
  EventMachine::PeriodicTimer.new(1) do
    if @handling_request
      ConeyIsland.logger.info("Waiting for last request to finish")
    else
      ConeyIsland.logger.info("Shutting down")
      EventMachine.stop
    end
  end
end

EventMachine.run do
  Signal.trap('INT') do
    shutdown
  end
  Signal.trap('TERM') do
    shutdown
  end
	connection = AMQP.connect(AMQP.config)
	ConeyIsland.logger.info("Connecting to AMQP broker. Running #{AMQP::VERSION} with config: #{AMQP.config}")
  channel  = AMQP::Channel.new(connection, AMQP::Channel.next_channel_id,:auto_recovery => true)

  connection.on_tcp_connection_loss do |connection|
    ConeyIsland.logger.info "Lost connection to AMQP broker, attempting reconnect"
    connection.reconnect(false, 60)
  end

  heartbeat_exchange = channel.fanout('quackbaq_heartbeat')
  EventMachine::PeriodicTimer.new(60) do
    heartbeat_exchange.publish({:instance_name => ConeyIsland.instance_name, :instance_number => ConeyIsland.instance_number}.to_json)
  end

  @queue = channel.queue(ConeyIsland.full_instance_name, :auto_delete => false)
  exchange = channel.topic('coney_island')
  @queue.bind(exchange, :routing_key => 'carousels.' + ConeyIsland.ticket)
  @queue.subscribe(:ack => true) do |metadata,payload|
    @handling_request = true
    args = JSON.parse(payload)
    class_name, method_name = metadata.routing_key.split('.')[1..-1]
    klass = class_name.constantize
    if args.has_key? 'object_id'
      begin
        object_id = args.delete 'object_id'
        object = klass.find(object_id)
        if args.any?
          object.send method_name, args
        else
          object.send method_name
        end
      rescue Exception => e
        ConeyIsland.logger.error("Error executing #{class_name}##{method_name} for id #{args['object_id']}:")
        ConeyIsland.logger.error(e.message)
        ConeyIsland.logger.error(e.backtrace.join("\n"))
      end
    else
      begin
        if args.any?
          klass.send method_name, args
        else
          klass.send method_name
        end
      rescue Exception => e
        ConeyIsland.logger.error("Error executing #{class_name}.#{method_name}:")
        ConeyIsland.logger.error(e.message)
        ConeyIsland.logger.error(e.backtrace.join("\n"))
      end
    end
    metadata.ack
    @handling_request = false
  end

end