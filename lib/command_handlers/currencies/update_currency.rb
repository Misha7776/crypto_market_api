module CommandHandlers
  module Currencies
    class UpdateCurrency
      def call(command)
        entity_data = {
          name: command.name,
          seq_no: command.seq_no,
          symbol: command.symbol,
          exchange_status: command.exchange_status,
          ask: command.ask,
          bid: command.bid,
          trade: command.trade,
          traded_at: command.traded_at
        }.reject{ |_, v| v.nil? }

        EntityRepository.new.with_entity(command.aggregate_uid) do |entity|
          entity.edit(entity_data)
        end
      end
    end
  end
end