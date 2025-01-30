class CartItemsSerializer < ActiveModel::Serializer

  attributes :id, :name, :price, :size, :quantity,  :size_id, :product_id, :base64_image

  def name
    object.product.name
  end

  def size
    object.size.name
  end

  def price
    ProductSize.find_by(product_id: object.product_id, size_id: object.size_id).price
  end

  def base64_image
    if object.product.images.attached?
      image = object.product.images.first
      
      "data:#{image.content_type};base64,#{Base64.strict_encode64(image.download)}"
    end
  end

end
