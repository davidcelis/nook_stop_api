class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def serializer
    "#{self.class.name}Serializer".constantize
  end
end
