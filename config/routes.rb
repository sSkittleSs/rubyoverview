Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru|by/ do
    devise_for :users
    resources :users
    resources :reviews do
      member do
        post '/add_user_rating/:rating(.:format)', to: 'reviews#add_user_rating', as: :add_user_rating
      end
    end
    
    get 'search', to: 'search#search', as: :search
    root to: 'home#index'
  end
end
