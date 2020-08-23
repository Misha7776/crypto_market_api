module Serialization
  def record_response(record, *args)
    options = args.extract_options!
    options[:serialize_class] ||= "#{record.class.name}Serializer".constantize

    render_json(serialize_record(record, options), options[:status] || :ok)
  end

  def collection_response(collection, *args)
    options = args.extract_options!
    options[:serialize_class] ||= "#{collection.klass.name}Serializer".constantize

    render_json(serialize_collection(collection, options), options[:status] || :ok)
  end

  def render_json(message = {}, status = :ok)
    render json: message.merge!(success: true), status: status
  end

  def serialize_collection(collection, options = {})
    options[:serialize_class].render_as_hash(collection, options)
  end

  def serialize_record(record, options = {})
    options[:serialize_class].render_as_hash(record, options)
  end
end