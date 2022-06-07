class Scalars::Version < Scalars::BaseScalar
  description "A semantic version string representing a version of Animal Crossing: New Horizons."

  def self.coerce_input(input_value, context)
    # Parse the incoming object into a version
    version = Gem::Version.new(input_value)
  rescue ArgumentError
    raise GraphQL::CoercionError, "#{input_value.inspect} is not a valid semantic version string."
  end

  def self.coerce_result(ruby_value, context)
    # It's transported as a string, so stringify it
    ruby_value.to_s
  end
end
