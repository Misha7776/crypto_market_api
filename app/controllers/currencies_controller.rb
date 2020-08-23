class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :update, :destroy]

  include Commands::Execute
  include DeletedEntitiesHelper

  def index
    Currency.all.page(params[:page])
  end

  def show
    read_stream("Domain::Currency$#{@currency.uid}")
  end

  def create
    execute(Commands::Currencies::CreateEntity.new(currency_params))
  end

  def update
    execute(Commands::Currencies::EditEntity.new(entity_params.merge!(id: @entity.id)))
  end

  def destroy
    execute(Commands::Currencies::DeleteEntity.new(id: @currency.id))
  end

  private

  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :symbol)
  end

  def error_messages(error)
    error&.message
  end
end