class ProductsController < ApplicationController

  def index
    productWithSizeQuantity=ProductSize.where('quantity > ?',0).pluck(:product_id).uniq
    products = Product.where(deleted_at: nil).where(id: productWithSizeQuantity)
    render json: products ,each_serializer: ProductSerializer
  end

  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product, include_sizes: true).as_json
  end

  def search
    query = params[:query]
    @products = Product.ransack(name_cont: query, description_cont: query).result

    render json: @products, each_serializer: ProductSerializer , status: :ok
  end
end
