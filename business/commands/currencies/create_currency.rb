module Commands
  module Currencies
    class CreateCurrency < Base
      attr_accessor :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at

      validates :symbol, presence: true
      validates :seq_no, presence: true
    end
  end
end
