require 'rails_helper'

describe Denormalizers::Currencies::CurrencyDeleted do
  context 'when currency delete denormalizer is applied' do
    let(:event_store) { Rails.configuration.event_store }
    let!(:currency) { create(:currency) }

    it 'deletes the entity' do
      expect do
        event_store.publish(Events::CurrencyDeleted.new(data: { id: currency.id }))
      end.to change { Currency.count }.by(-1)
    end
  end
end
