module Denormalizers
  module Currencies
    class CurrencyCreated
      def call(event)
        ::Currency.create!(event.data)
      end
    end
  end
end
