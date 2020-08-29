require 'rails_helper'

describe Denormalizers::Currencies::CurrencyUpdated do
  let!(:trade_time) { Time.current }
  let!(:currency) { create(:currency) }
  let!(:event_store) { Rails.configuration.event_store }
  let(:currency_data) do
    {
      id: currency.id,
      seq_no: '5500241871328',
      name: Faker::CryptoCoin.coin_name,
      symbol: Faker::CryptoCoin.acronym,
      exchange_status: %w[working suspended].sample,
      ask: [{ price: '9753.00', size: '0.0000000' }],
      bid: [],
      trade: [],
      traded_at: trade_time
    }
  end

  context 'when an currency updated event occurs' do
    context 'and there is a corresponding read model for that entity' do
      it 'updates the data on the read model' do
        event_store.publish(Events::CurrencyUpdated.new(data: currency_data))
        expect(currency.reload).to have_attributes(currency_data)
      end
    end
  end
end
