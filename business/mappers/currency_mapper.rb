module Mappers
  class CurrencyMapper
    include Commands::Execute

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

      fetch_currency
      map_currency_params
      Xlog.info("Parsed params: #{params}")
      currency.present? ? update_currency : create_currency
    end

    private

    attr_reader :data, :currency, :params

    def fetch_currency
      @currency = Currency.find_by(symbol: @data['symbol'])
    end

    def map_currency_params
      @params = { name: data['name'],
                  seq_no: data['seqNo'],
                  symbol: data['symbol'],
                  exchange_status: data['exchangeStatus'],
                  ask: data['ask'],
                  bid: data['bid'],
                  trade: data['trade'],
                  traded_at: traded_at }
    end

    def traded_at
      Time.zone.at(data['timestamp'].to_i / 1000)
    end

    def update_currency
      execute(::Commands::Currencies::ExternalUpdateCurrency.new(params.merge!(id: currency.id)))
    end

    def create_currency
      execute(::Commands::Currencies::CreateCurrency.new(params))
    end
  end
end
