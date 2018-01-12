Rails.application.routes.draw do
  devise_for :users,
             skip: [:registrations, :confirmations], skip_helpers: true
  
  root to: "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # You can have the root of your site routed with "root"
  resources :homes
  resources :users
  resources :vehicles

  resources :orders do
    collection { 
      post :import
      get  :orders_search 
      get :incoming
      post :add_orders_to_bag
    }
  end

  resources :bags do 
    collection {
      get :incoming
    }
  end
  resources :schedules
  
end
