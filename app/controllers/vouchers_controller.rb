class VouchersController < ApplicationController

    def validate
        voucher = Voucher.find_by(token: params[:voucher_token])
        if voucher && !voucher.discontinued
            if (voucher.applied_type == "Order" && params[:applied_type] == "Order") ||
                (voucher.applied_type == "Product" && params[:applied_type] == "Product")
                    render json:
                    {
                        valid: true,
                        discount_type: voucher.discount_type,
                        discount_value: voucher.discount_value,
                        cap_amount: voucher.cap_amount
                    },
                    status: 200
                    return
            else
                render json:
                    {
                        valid: false,
                        message: 'Voucher does not apply to selected type'
                    },
                    status: 404
                return
            end
        else
          render json: { valid: false, message: 'Invalid or expired voucher' }, status: 404
        end
    end

end
