module Mappers
  class CurrencyMapper
    EVENT_TYPE = { incremental_refresh: :MarketDataIncrementalRefresh,
                   snapshot: :MarketDataSnapshotFullRefresh }.freeze

    def initialize(data)
      @data = data['MarketDataIncrementalRefresh']
    end

    def self.call(data)
      new(data).call
    end

    def call
      return if @data.blank?

      get_currency
      return if currency.blank?

      map_currency_params
    end

    private

    attr_reader :data, :currency

    def get_currency
      @currency = Currency.find_by(symbol: @data['symbol'])
    end

    def map_currency_params
      { id: currency.id,
        name: data['name'],
        seq_no: data['seqNo'],
        symbol: data['symbol'],
        exchange_status: data['exchangeStatus'],
        ask: data['ask'],
        bid: data['bid'],
        trade: data['trade'],
        traded_at: data['timestamp'] }
    end

    def traded_at
      Time.zone.at(data['timestamp']/1000)
    end
  end
end