require 'json'
require 'pry'
require 'json'
require 'xlog'

module Rabbit
  module Consumers
    class Crypto
      include Sneakers::Worker
      from_queue 'crypto_test', env: nil

      def work(msg)
        Sneakers.logger.info("Raw data: ##{msg}")
        message = JSON.parse(msg)
        Xlog.info("Message received: #{message}")

        ack!
      end
    end
  end
end