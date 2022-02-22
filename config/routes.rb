Rails.application.routes.draw do
  get 'tours/index'
  devise_for :users
  root to: 'pages#home'
  get "tours", to: "tours#index"
end
