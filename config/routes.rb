Rails.application.routes.draw do
  devise_for :users,
             skip: [:registrations, :confirmations], skip_helpers: true
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # You can have the root of your site routed with "root"
  resources :home
  resources :users
end
