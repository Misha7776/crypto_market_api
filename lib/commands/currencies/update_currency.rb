module Commands
  module Currencies
    class UpdateCurrency < Base
      attr_accessor :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at

      validates :name, presence: true, allow_blank: false
      validates :seq_no, presence: true, allow_blank: false

      def aggregate_id
        id
      end
    end
  end
end