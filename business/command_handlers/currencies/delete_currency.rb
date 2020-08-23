module CommandHandlers
  module Currencies
    class DeleteCurrency
      def call(command)
        Repositories::CurrencyRepo.new.with_entity(command.id) do |entity|
          entity.delete(command.id)
        end
      end
    end
  end
end