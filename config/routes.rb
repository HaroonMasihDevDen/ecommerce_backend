Rails.application.routes.draw do
  get 'token_auth/validate'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "up" => "rails/health#show", as: :rails_health_check
  get 'validate_token', to: 'token_auth#validate'

  resources :categories
  resources :products
  resources :category_products do
    collection do
      get :'category_products_with_multiple_category_ids', to: 'category_products#category_products_with_multiple_category_ids'
    end
  end
  resources :cart_items
  resources :vouchers
  post 'validate_voucher', to: 'vouchers#validate'




end
