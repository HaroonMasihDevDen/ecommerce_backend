ActiveAdmin.register Product do

  filter :name
  filter :discount_percentage
  filter :description
  filter :discontinued
  filter :created_at
  filter :updated_at

  permit_params :name,
                :discount_percentage,
                :description,
                :discontinued,
                { category_ids: [] }


  index do
    selectable_column
    id_column
    column :name
    column :description
    column :discount_percentage
    column :discontinued
    column :deleted_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :discount_percentage
      f.input :discontinued
      f.inputs 'Categories' do
        div :class => "categories_list" do
         f.input :categories, as: :check_boxes , collection: Category.all end
        end
      end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :discount_percentage
      row :discontinued
      row :categories
    end
    panel 'Categories' do
      table_for(product.categories) do
        column :name
      end
    end

    # Display the associated CategoryProduct records if needed
    panel 'Category Products' do
      table_for(product.category_products) do
        column :category
        column :product
      end
    end
  end

end
