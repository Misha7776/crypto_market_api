module Commands
  module Currencies
    class UpdateCurrency < Base
      attr_accessor :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at

      validates :symbol, presence: true, allow_blank: false
      validates :name, presence: true, allow_blank: false
    end
  end
end
