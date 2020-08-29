class CurrencySerializer < ApplicationSerializer
  identifier :id
  fields :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at
end
