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
                { category_ids: [] },
                { images: [] }

  controller do
    def create
      @product = Product.new(permitted_params[:product])

      if params[:product][:images].present?
        params[:product][:images].each do |image|
          @product.images.attach(image)
        end
      end

      if @product.save
        redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
      else
        render :new, alert: 'Failed to create product.'
      end
    end

    def update
      @product = Product.find(params[:id])

      if params[:product][:images].present?
        params[:product][:images].each do |image|
          @product.images.attach(image)
        end
      end

      if @product.update(permitted_params[:product].except(:images))
        redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit, alert: 'Failed to update product.'
      end
    end
  end

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
      
      # Categories section
      f.inputs 'Categories' do
        div class: "categories_list" do
          f.input :categories, 
                  as: :check_boxes, 
                  collection: Category.all.map { |c| [c.name, c.id] }
        end
      end

      f.input :images, 
        as: :file, 
        input_html: { 
          multiple: true,
          accept: 'image/*'
        }
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

    panel 'Category Products' do
      table_for(product.category_products) do
        column :category
        column :product
      end
    end

    panel 'Images' do
      div class: 'product-images-flex' do
        product.images.each do |image|
          div class: 'image-preview' do
            image_tag(url_for(image), size: '100x100')
          end
        end
      end
    end
  end
end
