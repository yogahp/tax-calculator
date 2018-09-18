# Generic error serializer
module ErrorSerializer
  def self.serialize(errors, permitted_fields = [])
    return if errors.blank?

    new_hash = filtered_fields(errors, permitted_fields).map do |key, value|
      mapping_id_title(key, value)
    end.flatten

    { errors: new_hash }
  end

  def self.filtered_fields(errors, permitted_fields)
    errors.to_hash(true).select do |error|
      permitted_fields.include? error
    end
  end

  def self.mapping_id_title(key, value)
    value.map do |msg|
      { id: key, title: msg }
    end
  end
end
