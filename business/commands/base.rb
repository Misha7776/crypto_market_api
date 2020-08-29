module Commands
  class Base
    include ActiveModel::Model
    include ActiveModel::Validations
    include ActiveModel::Conversion

    def initialize(attributes = {})
      super
    end

    def validate!
      raise ValidationError, errors.full_messages, caller unless valid?
    end

    def persisted?
      false
    end
  end
end
