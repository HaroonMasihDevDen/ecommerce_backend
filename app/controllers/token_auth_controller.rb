class TokenAuthController < ApplicationController
  before_action :authenticate_user_from_token!

  # GET /validate_token
  def validate
    if @current_user
      render json: {
        status: { code: 200, message: 'Token is valid' },
        data: {
          email: @current_user.email,
          name: @current_user.name,
          # Include other user fields as needed
        }
      }, status: :ok
    else
      if @missing_auth_token ==true
        render json: { status: 401, message: 'missing token' }, status: :unauthorized
      else
        render json: { status: 401, message: 'Invalid or expired token' }, status: :unauthorized
      end
    end
  end

  private

  def authenticate_user_from_token!
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      begin
        jwt_payload = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key!).first
        @current_user = User.find(jwt_payload['sub'])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        @current_user = nil
      end
    else
      begin
       @current_user = nil
       @missing_auth_token = true
      end
    end
  end
end
