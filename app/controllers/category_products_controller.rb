class CategoryProductsController < ApplicationController

  def show
    subCategoriesIDs = Category.find_all_child_ids(params[:id])
    puts "child catg list : #{subCategoriesIDs}"
    category_products = CategoryProduct.where(category_id:subCategoriesIDs)
    products = Product.where(id: category_products.pluck(:product_id))
    render json: products

  end
end
