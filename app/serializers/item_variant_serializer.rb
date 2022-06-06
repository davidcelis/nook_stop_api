class ItemVariantSerializer < Blueprinter::Base
  identifier :id do |item, _|
    item.unique_internal_id
  end

  fields :image_url, :body_name, :pattern_name, :colors, :genuine
end
