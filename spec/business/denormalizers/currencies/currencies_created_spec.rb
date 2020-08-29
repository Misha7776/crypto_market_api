require 'rails_helper'

describe Denormalizers::Currencies::CurrencyCreated do
  let!(:trade_time) { Time.current }
  let(:event_store) { Rails.configuration.event_store }
  let(:currency_data) do
    {
      seq_no: '55002418713292049494628765042568208228',
      name: Faker::CryptoCoin.coin_name,
      symbol: Faker::CryptoCoin.acronym,
      exchange_status: %w[working suspended].sample,
      ask: [{ price: '9753.00', size: '0.0000000' }],
      bid: [],
      trade: [],
      traded_at: trade_time
    }
  end

  context 'when an entity created event occurs' do
    it 'creates a corresponding read model' do
      expect do
        event_store.publish(Events::CurrencyCreated.new(data: currency_data))
      end.to change { Currency.count }.by 1

      expect(Currency.last).to have_attributes(currency_data)
    end
  end
end
