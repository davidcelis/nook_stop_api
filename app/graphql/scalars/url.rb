class Scalars::URL < Scalars::BaseScalar
  description "A valid, formatted URL"

  def self.coerce_input(input_value, context)
    url = URI.parse(input_value)

    return url if url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)

    raise GraphQL::CoercionError, "#{input_value.inspect} is not a valid URL"
  end

  def self.coerce_result(ruby_value, context)
    ruby_value.to_s
  end
end
