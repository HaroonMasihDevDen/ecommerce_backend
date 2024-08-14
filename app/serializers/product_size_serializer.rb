class ProductSizeSerializer < ActiveModel::Serializer
  attributes :price, :currency, :quantity, :size_id , :size_title

  def size_title
    object.size.name
  end
end
