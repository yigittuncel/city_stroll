Rails.application.routes.draw do
  get 'tours/index'
  devise_for :users
  root to: 'pages#home'
  resources :tour, only: [:index]
end
