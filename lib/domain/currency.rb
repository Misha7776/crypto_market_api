module Domain
  class Currency
    include AggregateRoot

    attr_accessor :id, :name, :seq_no, :symbol, :exchange_status, :ask, :bid, :trade, :traded_at

    def initialize(id)
      @id = id
    end

    def create(data)
      apply Events::EntityCreated.new(data: data)
    end

    def update(data)
      apply Events::EntityEdited.new(data: data)
    end

    def delete(id)
      apply Events::EntityDeleted.new(data: { id: id })
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
      @name = event.data[:name]
      @seq_no = event.data[:seq_no]
      @symbol = event.data[:symbol]
      @exchange_status = event.data[:exchange_status]
      @ask = event.data[:ask]
      @bid = event.data[:bid]
      @trade = event.data[:trade]
      @traded_at = event.data[:traded_at]
    end
  end
end
