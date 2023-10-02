Rails.application.routes.draw do
  resources :my_contact_cards
  resources :ai_product_tags
  mount Ckeditor::Engine => '/ckeditor'
  resources :ai_products,param: :uuid
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :ai_product_sorts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "ai_products#index"
end
