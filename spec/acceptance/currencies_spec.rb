require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Currencies' do
  explanation 'Currencies resource'
  describe 'GET #index' do
    let!(:currency) { create(:currency) }

    get '/currencies' do
      it 'should return all available currencies' do
        do_request

        expect(response_status).to eq 200
        expect(json.size).to eq 1
        expect(json[0]['name']).to be_present
      end
    end
  end

  describe 'GET #show' do
    get 'currencies/:id' do
      let!(:currency) { create(:currency) }
      let!(:id) { currency.id }
      let(:params) do
        { currency: { name: 'Test Name', symbol: 'FGESCON' } }
      end

      before(:each) do
        execute(Commands::Currencies::UpdateCurrency.new(params[:currency].merge!(id: id)))
      end

      it 'should return events associated with this currency' do
        do_request

        expect(json.size).to eq 1
        expect(json[0]['data']['name']).to eq params[:currency][:name]
        expect(json[0]['data']['symbol']).to eq params[:currency][:symbol]
        expect(response_status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    post '/currencies' do
      context 'valid parameters' do
        let(:params) do
          { currency: { seq_no: Faker::Config.random.seed,
                        name: Faker::CryptoCoin.coin_name,
                        symbol: Faker::CryptoCoin.acronym } }
        end

        it 'should create a new currency in the db' do
          expect { do_request }.to change { Currency.count }.by(1)
          expect(response_status).to eq 200
        end
      end

      context 'invalid parameters' do
        let(:params) do
          { currency: { name: Faker::CryptoCoin.coin_name,
                        symbol: nil } }
        end

        it 'should not create a new currency in the db' do
          expect { do_request }.to change { Currency.count }.by(0)
          expect(response_status).to eq 400
        end
      end
    end
  end

  describe 'PATCH #update' do
    patch '/currencies/:id' do
      let!(:currency) { create(:currency) }
      let!(:id) { currency.id }

      context 'valid parameters' do
        let(:params) do
          { currency: { name: 'Test Name', symbol: 'FGESCON' } }
        end

        it 'should create a new currency in the db' do
          do_request

          expect(currency.reload.name).to eq params[:currency][:name]
          expect(currency.reload.symbol).to eq params[:currency][:symbol]
          expect(response_status).to eq 200
        end
      end

      context 'invalid parameters' do
        let(:params) do
          { currency: { name: '', symbol: 'FGESCON' } }
        end

        it 'should not create a new currency in the db' do
          do_request

          expect(currency.reload.name).to eq currency.name
          expect(currency.reload.symbol).to eq currency.symbol
          expect(response_status).to eq 400
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    delete '/currencies/:id' do
      let!(:currency) { create(:currency) }
      let!(:id) { currency.id }

      context 'valid parameters' do
        it 'should delete an existing currency from the db' do
          expect { do_request }.to change { Currency.count }.by(-1)
          expect(response_status).to eq 200
        end
      end
    end
  end
end
