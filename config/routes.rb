Rails.application.routes.draw do
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end  
  resources :line_items
  resources :carts
  resources :products
  resources :purchases
  resources :categories
  root 'products#index'
  devise_for :users
end
