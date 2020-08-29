module CommandHandlers
  module Currencies
    class DeleteCurrency < CommandHandlers::Currencies::Base
      def call
        destroy_currency
      end

      private

      def destroy_currency
        Repositories::CurrencyRepo.new.with_entity(command.id) do |currency|
          currency.delete(command.id)
        end
      end
    end
  end
end
