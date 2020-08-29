class CurrenciesController < ApplicationController
  before_action :set_currency, only: %i[show update destroy]

  def index
    collection_response(Currency.all.page(params[:page]))
  end

  def show
    render_json read_stream("Domain::Currency$#{@currency.id}")
  end

  def create
    render_json execute(Commands::Currencies::CreateCurrency.new(currency_params))
  rescue Commands::ValidationError => e
    render_json({ errors: error_messages(e) }, :bad_request)
  end

  def update
    render_json execute(Commands::Currencies::UpdateCurrency.new(currency_update_params))
  rescue Commands::ValidationError => e
    render_json({ errors: error_messages(e) }, :bad_request)
  end

  def destroy
    render_json execute(Commands::Currencies::DeleteCurrency.new(id: @currency.id))
  rescue StandardError => e
    render_json({ errors: error_messages(e) }, 500)
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :symbol)
  end

  def currency_update_params
    params.require(:currency).permit(:name, :symbol, :bid, :ask, :seq_no, :symbol, :exchange_status, :traded_at)
      .merge!(id: @currency.id)
  end

  def error_messages(error)
    error&.message
  end
end
