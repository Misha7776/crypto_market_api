module Denormalizers
  module Currency
    class EntityCreated
      def call(event)
        ::Currency.create!(event.data)
      end
    end
  end
end