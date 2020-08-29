require 'rails_helper'

describe Commands::Currencies::UpdateCurrency do
  context 'when running update command' do
    let!(:currency) { create(:currency) }
    let(:event_store) { Rails.configuration.event_store }
    let(:command) { described_class.new(update_data) }

    let(:data) { { symbol: 'BITCOIN', name: 'Bitok' } }

    context 'and the command includes all needed data' do
      let(:update_data) { { symbol: 'New symbol', name: 'New name', id: currency.id } }

      it 'applies the updated data to the currency' do
        execute(command)

        expect(event_store).to have_published(an_event(Events::CurrencyUpdated)
                                                .with_data(name: update_data[:name],
                                                           symbol: update_data[:symbol]))
      end
    end

    context 'param is missing' do
      let(:update_data) { { name: 'sample', symbol: '', id: currency.id } }

      it 'raises a validation exception' do
        expect { execute(command) }.to raise_error(Commands::ValidationError)
      end
    end
  end
end
