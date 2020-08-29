module Denormalizers
  module Currencies
    class CurrencyUpdated
      def call(event)
        entity = ::Currency.find_by(id: event.data[:id])
        entity&.update(event.data)
      end
    end
  end
end
