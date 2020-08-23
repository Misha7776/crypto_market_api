module CommandHandlers
  module Currencies
    class DeleteCurrency
      def call(command)
        EntityRepository.new.with_entity(command.id) do |entity|
          entity.delete(command.aggregate_uid)
        end
      end
    end
  end
end