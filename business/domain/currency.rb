module Domain
  class Currency
    include AggregateRoot

    attr_accessor :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at

    def initialize(id)
      @id = id
    end

    def create(data)
      apply Events::CurrencyCreated.new(data: data)
    end

    def update(data)
      apply Events::CurrencyUpdated.new(data: data)
    end

    def delete(id)
      apply Events::CurrencyDeleted.new(data: { id: id })
    end

    private

    def apply_currency_created(event)
      currency_attributes(event)
    end

    def apply_currency_updated(event)
      currency_attributes(event)
    end

    def apply_currency_deleted(_event)
      @deleted = true
    end

    def currency_attributes(event)
      event.data.each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end
