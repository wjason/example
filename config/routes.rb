Rails.application.routes.draw do
  resources :ai_product_sorts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "ai_product_sorts#index"
end
