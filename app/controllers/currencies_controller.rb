class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :update, :destroy]

  def index
    collection_response(Currency.all.page(params[:page]))
  end

  def show
    render_json read_stream("Domain::Currency$#{@currency.id}")
  end

  def create
    execute(Commands::Currencies::CreateCurrency.new(currency_params))
  end

  def update
    execute(Commands::Currencies::UpdateCurrency.new(currency_params.merge!(id: @currency.id)))
  end

  def destroy
    execute(Commands::Currencies::DeleteCurrency.new(id: @currency.id))
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :symbol)
  end
end