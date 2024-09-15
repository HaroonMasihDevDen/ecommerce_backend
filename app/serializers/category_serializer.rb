class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  def title
    object.name
  end

end
