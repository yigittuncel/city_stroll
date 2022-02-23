Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tours, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
  get "/dashboard", to: "pages#dashboard"
end
