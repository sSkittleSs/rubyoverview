Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru|be/ do
    devise_for :users
    resources :users do
      member do
        post :make_admin, as: :make_admin
      end
    end
    resources :reviews do
      member do
        post '/add_user_rating/:rating(.:format)', to: 'reviews#add_user_rating', as: :add_user_rating
      end
    end
    
    get 'ban_page', to: 'ban_page#index', as: :ban_page
    get 'search', to: 'search#search', as: :search
    root to: 'home#index'
  end
end
