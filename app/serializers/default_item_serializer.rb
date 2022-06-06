class DefaultItemSerializer < Blueprinter::Base
  field :item do |default, _|
    item = case default.item
      when Item, Creature then default.item
      when ItemVariant then default.item.item
    end

    item.serializer.render_as_hash(item)
  end

  field :variant, unless: ->(_, default, _) {
    default.item.is_a?(Creature) || (default.item.is_a?(Item) && default.item.variants.count > 1)
  } do |default, _|
    variant = case default.item
      when Item then default.item.variants.first
      when ItemVariant then default.item
    end
  end
end
