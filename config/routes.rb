Rails.application.routes.draw do

  devise_for :users
  resources :posts do
    get :profile, on: :member
    resources :comments do
      patch :change_status, on: :member
      get :manage_comment, on: :member
    end
  end

  root "posts#index"

  get '/about', to: 'pages#about'
  get '/profile', to: 'pages#profile'
  get '/dashboard', to: 'dashboards#index'
end
