class ApplicationController < ActionController::API
  include Serialization
  include Commands::Execute

  def read_stream(stream_name)
    Rails
      .configuration
      .event_store
      .read
      .backward
      .stream(stream_name)
      .to_a
  end

  def load_entity_aggregate(id)
    AggregateRoot::Repository.new.load(Domain::Currency.new(id), "Domain::Currency$#{id}")
  end
end
