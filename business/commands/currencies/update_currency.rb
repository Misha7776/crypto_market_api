module Commands
  module Currencies
    class UpdateCurrency < Base
      attr_accessor :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at

      validates :seq_no, presence: true, allow_blank: false
      validates :symbol, presence: true, allow_blank: false
      validates :exchange_status, presence: true, allow_blank: false
      validates :traded_at, presence: true
    end
  end
end
