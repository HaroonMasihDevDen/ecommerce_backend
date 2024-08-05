ActiveAdmin.register Size do

  filter :name

  permit_params :name,
                :created_at,
                :deleted_at,
                :updated_at

  index do
    selectable_column
    id_column
    column :name
  end

  form do |f|
    f.input :name

    f.actions
  end

  show do
    attributes_table do
      row :name
    end
  end


end
