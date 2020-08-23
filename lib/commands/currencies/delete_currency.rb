module Commands
  module Currencies
    class DeleteCurrency < Base
      attr_accessor :id

      def aggregate_id
        id
      end
    end
  end
end