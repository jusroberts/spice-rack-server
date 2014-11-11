Pantrify::Application.routes.draw do
  get 'items/:q', to: 'items#index', format: :json

  resources :lists
  resources :list_items, only: [ :create, :update, :destroy ]

  devise_for :users

  root 'lists#index'
end
