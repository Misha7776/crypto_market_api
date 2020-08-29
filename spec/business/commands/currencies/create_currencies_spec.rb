require 'rails_helper'

describe Commands::Currencies::CreateCurrency do
  let(:event_store) { Rails.configuration.event_store }
  let(:command) { described_class.new(currency_data) }

  context 'when the required fields are provided' do
    let(:currency_data) do
      {
        name: 'Bit Coin',
        symbol: 'BITCON'
      }
    end

    it 'creates the entity' do
      execute(command)

      expect(event_store).to have_published(an_event(Events::CurrencyCreated)
                                              .with_data(currency_data))
    end
  end

  context 'when passed data is incorrect - name is missing' do
    let(:currency_data) do
      {
        name: 'Bit Coin',
        symbol: nil
      }
    end

    it 'returns an error' do
      expect { execute(command) }.to raise_error(Commands::ValidationError)
    end
  end
end
