Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru|by/ do
    resources :reviews

    root to: 'reviews#index'
  end
end
