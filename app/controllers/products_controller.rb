class ProductsController < ApplicationController

  def index
    productWithSizeQuantity=ProductSize.where('quantity > ?',0).pluck(:product_id).uniq
    products = Product.not_deleted.where(id: productWithSizeQuantity)
    render json: products ,each_serializer: ProductSerializer
  end

  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product, include_sizes: true).as_json
  end

  def search
    query = params[:query]
    products = Product.where(deleted_at: nil).ransack(name_cont: query, description_cont: query).result

    render json: products, each_serializer: ProductSerializer , status: :ok
  end

  def filter
    sizes = params[:sizes]
    min_price = params[:min_price]
    max_price = params[:max_price]
    products = Product.where(deleted_at: nil).include_size_titles(sizes)
    render json: products, each_serializer: ProductSerializer , status: :ok
  end
end
