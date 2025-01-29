ActiveAdmin.register Size do

  filter :name
  filter :key

  permit_params :name,
                :key,
                :order,
                :created_at,
                :deleted_at,
                :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :key
    column :order
    actions
  end

  form do |f|
    f.input :name
    f.input :key
    f.input :order
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :key
      row :order
    end
  end


end
