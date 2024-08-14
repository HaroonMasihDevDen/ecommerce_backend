class CartItemsSerializer < ActiveModel::Serializer

  attributes :id, :name, :price, :size, :quantity,  :size_id, :product_id

  def name
    object.product.name
  end

  def size
    object.size.name
  end

  def price
    ProductSize.find_by(product_id: object.product_id, size_id: object.size_id).price
  end

end
