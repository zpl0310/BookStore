Rails.application.routes.draw do
  get 'admin', to:'admin#index'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'


  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'shopper/index'
  resources :products
  root "shopper#index",as:'shopper'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
