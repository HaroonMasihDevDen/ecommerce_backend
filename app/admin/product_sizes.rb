ActiveAdmin.register ProductSize do

  permit_params :product_id,
                :size_id,
                :price,
                :currency,
                :quantity,
                :deleted_at,
                :created_at,
                :updated_at

  filter :product
  filter :size
  filter :price
  filter :currency
  filter :quantity
  filter :updated_at
  filter :created_at
  filter :deleted_at

  index do
    selectable_column
    id_column
    column :product
    column :size
    column :price
    column :currency
    column :quantity
    column :created_at
    column :updated_at
    column :deleted_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :product, as: :select, collection: Product.order(created_at: :desc).collect { |p| [p.name, p.id] }
      f.input :size, as: :select, collection: Size.order(:order).collect { |s| [s.name, s.id] }
      f.input :price
      f.input :currency
      f.input :quantity
      f.input :deleted_at, as: :datetime_picker
    end
    f.actions
  end

  show do
    attributes_table do
      row :product
      row :size
      row :price
      row :currency
      row :quantity
      row :deleted_at
    end
  end

end
