class ProductSerializer < ActiveModel::Serializer

  attributes :id,
              :name,
              :description,
              :discountPercentage,
              :price,
              :sizes

  def discountPercentage
    object.discount_percentage
  end

  def sizes
    if instance_options[:include_sizes]
        object.product_sizes.map do |size|
        ProductSizeSerializer.new(size, scope: scope, root: false)
      end
    end
  end
end
