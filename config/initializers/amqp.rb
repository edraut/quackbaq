module AMQP
	require 'psych'
	def AMQP.config
    @config ||= Psych.load(File.read(File.join(Rails.root,"config","amqp.yml"))).symbolize_keys!
  end
end

def start_amqp
  require 'eventmachine'
  require 'amqp'

  Rails.logger.info "[AMQP] Initializing amqp..."
  amqp_thread = Thread.new {
    failure_handler = lambda {
      Rails.logger.fatal "[AMQP] [FATAL] Could not connect to AMQP broker"
    }
    AMQP.start(AMQP.config, :on_tcp_connection_failure => failure_handler)
  }
  amqp_thread.abort_on_exception = true
  sleep(0.15)

  EventMachine.next_tick do
    AMQP.channel ||= AMQP::Channel.new(AMQP.connection)
  end
end

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      start_amqp
    end
  end
end

if ENV['POW_BIN']
  start_amqp
end
