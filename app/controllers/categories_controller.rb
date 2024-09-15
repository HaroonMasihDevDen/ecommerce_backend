class CategoriesController < ApplicationController

  def index
    categories = Category.where(deleted_at: nil)
    render json: categories, each_serializer: CategorySerializer
  end

end
