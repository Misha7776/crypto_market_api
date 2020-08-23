module Repositories
  class CurrencyRepo
    def initialize(event_store = Rails.configuration.event_store)
      @repository = AggregateRoot::Repository.new(event_store)
    end

    def with_entity(currency_id, &block)
      repository.with_aggregate(Domain::Currency.new(currency_id), "Domain::Currency$#{currency_id}", &block)
    end

    private

    attr_reader :repository
  end
end
