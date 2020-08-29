module CommandHandlers
  module Currencies
    class UpdateCurrency < CommandHandlers::Currencies::Base
      def call
        update_currency_event_store
      end

      private

      def update_currency_event_store
        Repositories::CurrencyRepo.new.with_entity(command.id) do |currency|
          currency.update(params)
        end
      end

      def record_params(command)
        { id: command.id,
          name: command.name,
          seq_no: command.seq_no,
          symbol: command.symbol,
          exchange_status: command.exchange_status,
          ask: command.ask,
          bid: command.bid,
          trade: command.trade,
          traded_at: command.traded_at }.reject { |_, v| v.nil? }
      end
    end
  end
end
