class ProductsController < ApplicationController

  def index
    products = Product.where(deleted_at: nil)
    render json: products ,each_serializer: ProductSerializer
  end

  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product, include_sizes: true).as_json
  end
end
