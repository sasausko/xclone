Rails.application.routes.draw do
  get "pages/home"
  get "pages/about"
  get "pages/contact"
  get "pages/terms"
  get "pages/privacy"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
  resources :posts
end
