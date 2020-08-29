module Denormalizers
  module Currencies
    class CurrencyDeleted
      def call(event)
        entity = ::Currency.find_by(id: event.data[:id])
        entity&.destroy
      end
    end
  end
end
