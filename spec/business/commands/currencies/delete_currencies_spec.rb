require 'rails_helper'

describe Commands::Currencies::DeleteCurrency do
  context 'when currency delete command is run' do
    let(:currency) { create(:currency) }
    let(:event_store) { Rails.configuration.event_store }

    context 'when currency id is passed' do
      let(:command) { described_class.new({ id: currency.id }) }

      it 'deletes the currency' do
        execute(command)

        expect(event_store).to have_published(an_event(Events::CurrencyDeleted).with_data({ id: currency.id }))
      end
    end

    context 'when currency id is missing' do
      let(:command) { described_class.new({ id: nil }) }

      it 'raises an error' do
        expect { execute(command) }.to raise_error(Commands::ValidationError)
      end
    end
  end
end
