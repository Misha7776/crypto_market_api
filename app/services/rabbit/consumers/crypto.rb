module Rabbit
  module Consumers
    class Crypto
      include Sneakers::Worker
      include ::Commands::Execute
      from_queue 'crypto_test', env: nil

      def work(msg)
        Sneakers.logger.info("Raw data: #{msg}")
        message = JSON.parse(msg)
        params = Mappers::CurrencyMapper.call(message)
        Xlog.info("Parsed params: #{params}")
        execute(::Commands::Currencies::UpdateCurrency.new(params)) if params.present?

        ack!
      end
    end
  end
end