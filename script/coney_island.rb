#!/usr/bin/env ruby

## Copyright 2011 Eric Draut, all rights reserved

$LOAD_PATH.push '.'
require 'config/environment.rb'
@instance_name = ARGV[0]
@instance_number = ARGV[1] || '0'

@log = Logger.new('log/coney_island.log')
@config = Psych.load(File.read(File.join(Rails.root,"config","coney_island.yml")))

unless @instance_name
  @instance_name = @config['carousels'].keys.first
end
@instance_config = @config['carousels'][@instance_name]
@full_instance_name = @instance_name + @instance_number

@ticket = @instance_config['ticket']
@log.level = @config['log_level']
@log.info("config: #{@config}")

def shutdown
  @queue.unsubscribe
  EventMachine.periodic_timer(1) do
    if @handling_request
      @log.info("Waiting for last request to finish")
    else
      @log.info("Shutting down")
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
	@log.info("Connecting to AMQP broker. Running #{AMQP::VERSION} with config: #{AMQP.config}")
  channel  = AMQP::Channel.new(connection)
  heartbeat_exchange = channel.fanout('quackbaq_heartbeat')
  EventMachine::PeriodicTimer.new(15) do
    heartbeat_exchange.publish({:instance_name => @instance_name, :instance_number => @instance_number}.to_json)
  end

  @queue = channel.queue(@full_instance_name, :auto_delete => false)
  exchange = channel.topic('coney_island')
  @queue.bind(exchange, :routing_key => 'carousels.' + @ticket)
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
        @log.error("Error executing #{class_name}##{method_name} for id #{args['object_id']}:")
        @log.error(e.message)
        @log.error(e.backtrace.join("\n"))
      end
    else
      begin
        if args.any?
          klass.send method_name, args
        else
          klass.send method_name
        end
      rescue Exception => e
        @log.error("Error executing #{class_name}.#{method_name}:")
        @log.error(e.message)
        @log.error(e.backtrace.join("\n"))
      end
    end
    metadata.ack
    @handling_request = false
  end

end