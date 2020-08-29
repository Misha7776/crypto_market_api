module Serialization
  def record_response(record, *args)
    options = args.extract_options!
    options[:serialize_class] ||= "#{record.class.name}Serializer".constantize
    hash = serialize_record(record, options)

    status = if record.errors.none?
               options[:status] || :ok
             else
               hash[:errors] = record.errors.messages
               :bad_request
             end

    render_json(hash, status)
  end

  def collection_response(collection, *args)
    options = args.extract_options!
    options[:serialize_class] ||= "#{collection.klass.name}Serializer".constantize

    render_json(serialize_collection(collection, options), options[:status] || :ok)
  end

  def render_json(message = {}, status = :ok)
    render json: message, status: status
  end

  def serialize_collection(collection, options = {})
    options[:serialize_class].render_as_hash(collection, options)
  end

  def serialize_record(record, options = {})
    options[:serialize_class].render_as_hash(record, options)
  end
end
