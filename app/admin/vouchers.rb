ActiveAdmin.register Voucher do

    permit_params :token, :applied_type, :discount_type, :discount_value, :cap_amount, :discontinued, :deleted_at

    filter :token
    filter :applied_type
    filter :discount_type
    filter :discount_value
    filter :cap_amount
    filter :discontinued

    index do
        selectable_column
        id_column
        column :token
        column :applied_type
        column :discount_type
        column :discount_value
        column :cap_amount
        column :discontinued
        column :deleted_at
        actions
    end

    form do |f|
        f.inputs do
            f.input :token
            f.input :applied_type, as: :radio, collection: %w[Product Order]
            f.input :discount_type, as: :radio, collection: %w[Percentage Amount]
            f.input :discount_value
            f.input :cap_amount
            f.input :discontinued
            f.input :deleted_at
            actions
        end
    end

    show do
        attributes_table do
          row :token
          row :applied_type
          row :discount_type
          row :discount_value
          row :cap_amount
          row :discontinued
        end
    end

end
