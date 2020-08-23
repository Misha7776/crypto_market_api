module Denormalizers
  module Currencies
    class CurrencyDeleted
      def call(event)
        entity = ::Currency.find_by(id: event.data[:id])
        entity.destroy if entity
      end
    end
  end
end