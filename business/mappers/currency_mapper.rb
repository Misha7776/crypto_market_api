module Mappers
  class CurrencyMapper
    EVENT_TYPE = { incremental_refresh: :MarketDataIncrementalRefresh,
                   snapshot: :MarketDataSnapshotFullRefresh }.freeze

    def initialize(data)
      @data = data[EVENT_TYPE[:incremental_refresh]]
      @currency = Currency.find_by(symbol: @data[:symbol])
    end

    def self.call(data)
      new(data).call
    end

    def call
      return if currency.blank?

      map_currency_params
    end

    private

    attr_reader :data, :currency

    def map_currency_params
      { id: currency.id,
        name: data[:name],
        seq_no: data[:seqNo],
        symbol: data[:symbol],
        exchange_status: data[:exchangeStatus],
        ask: data[:ask],
        bid: data[:bid],
        trade: data[:trade],
        traded_at: data[:timestamp] }
    end
  end
end