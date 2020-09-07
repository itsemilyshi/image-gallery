Rails.application.routes.draw do
  resources :photos do
    collection do
      delete 'bulk_destroy'
    end
  end
  resources :cart
  devise_for :users

  get 'add_to_cart/:photo_id', to: "cart#add_to_cart", as: :add_to_cart
  get 'remove_from_cart/:photo_id', to: "cart#remove_from_cart", as: :remove_from_cart
  get 'checkout', to: "cart#checkout"

  root to: 'photos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
