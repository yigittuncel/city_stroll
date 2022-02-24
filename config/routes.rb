Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tours, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
  get "/dashboard", to: "pages#dashboard"
end
