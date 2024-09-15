class CategoryProductsController < ApplicationController

  def show
    subCategoriesIDs = Category.find_all_child_ids(params[:id])
    puts "child catg list : #{subCategoriesIDs}"
    category_products = CategoryProduct.where(category_id:subCategoriesIDs)
    products = Product.where(id: category_products.pluck(:product_id))

    render json: products
  end

  def category_products_with_multiple_category_ids
    category_ids = params[:category_ids]
    if category_ids.include?('0')
      category_products = CategoryProduct.all
    else
      category_products = CategoryProduct.where(category_id: category_ids)
    end
    products = Product.where(id: category_products.pluck(:product_id))

    render json: products
  end
end
