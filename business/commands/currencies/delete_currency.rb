module Commands
  module Currencies
    class DeleteCurrency < Base
      attr_accessor :id

      validates :id, presence: true
    end
  end
end
