require 'json'
require 'pry'
require 'json'
require 'xlog'

module Rabbit
  module Consumers
    class Crypto
      include Sneakers::Worker
      include Commands::Execute
      from_queue 'crypto_test', env: nil

      def work(msg)
        message = JSON.parse(msg)
        Sneakers.logger.info("Raw data: ##{message}")
        Xlog.info("Message received: #{message}")
        params = Mappers::CurrencyMapper.call(message)
        execute(Commands::Currencies::UpdateCurrency.new(params)) if params.present?

        ack!
      end
    end
  end
end