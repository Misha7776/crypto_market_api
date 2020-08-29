module Rabbit
  module Consumers
    class Crypto
      include Sneakers::Worker
      include ::Commands::Execute
      from_queue 'crypto_test', env: nil

      def work(msg)
        Sneakers.logger.info("Raw data: #{msg}")
        message = JSON.parse(msg)
        Mappers::CurrencyMapper.call(message)

        ack!
      end
    end
  end
end
