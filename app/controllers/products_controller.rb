class ProductsController < ApplicationController

  def index
    productWithSizeQuantity=ProductSize.where('quantity > ?',0).pluck(:product_id).uniq
    products = Product.active.where(id: productWithSizeQuantity)
    
    render json: products, each_serializer: ProductSerializer
  end

  def show
    product = Product.find(params[:id])
    render json: ProductSerializer.new(product).as_json
  end

  def search
    query = params[:query]
    products = Product.active.where(deleted_at: nil).ransack(name_cont: query, description_cont: query).result

    render json: products, each_serializer: ProductSerializer , status: :ok
  end

  def filter
    sizes = params[:sizes]
    min_price = params[:min_price]
    max_price = params[:max_price]
    categories = params[:categories]

    if sizes.blank? && min_price.blank? && max_price.blank? && categories.blank?
      products = Product.active
    else
      products = Product.active.ransack(
        product_sizes_price_gteq: min_price.to_i,
        product_sizes_price_lteq: max_price.to_i,
        category_products_category_id_in: categories,
        sizes_key_in: sizes
      ).result(distinct: true)

      products = products.joins(:product_sizes) unless sizes.blank?
      products = products.joins(:category_products) unless categories.blank?
      products = products.joins(:sizes) unless (max_price.blank? && min_price.blank?)
    end

    render json: products, each_serializer: ProductSerializer , status: :ok
  end
end
