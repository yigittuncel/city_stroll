Rails.application.routes.draw do
  get 'tours/index'
  devise_for :users
  root to: 'pages#home'
  resources :tours, only: [:index, :show]
end
