Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru|by/ do
    devise_for :users
    resources :reviews
    
    get 'persons/profile', as: 'user_root'

    root to: 'reviews#index'
  end
end
