ActiveAdmin.register Category do

  filter :name
  filter :created_at
  filter :updated_at
  filter :parent_category_id, as: :select, collection: -> { Category.pluck(:name, :id).map { |name, id| [name, id] } }

  permit_params :name, :description, :parent_category_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :parent_category
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :parent_category_id, as: :select, collection: Category.all.collect { |c| [c.name, c.id] }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :parent_category
    end
  end
end
