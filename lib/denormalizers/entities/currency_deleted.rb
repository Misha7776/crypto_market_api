module Denormalizers
  module Currency
    class EntityDeleted
      def call(event)
        entity = ::Currency.find_by(id: event.data[:id])
        entity.destroy if entity
      end
    end
  end
end