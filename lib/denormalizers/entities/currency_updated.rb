module Denormalizers
  module Currency
    class EntityEdited
      def call(event)
        entity = ::Currency.find_by(id: event.data[:id])
        entity.update(event.data) if entity
      end
    end
  end
end