Rails.application.routes.draw do
  resources :photos
  resources :cart
  devise_for :users

  get 'add_to_cart/:photo_id', to: "cart#add_to_cart", as: :add_to_cart

  root to: 'photos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
