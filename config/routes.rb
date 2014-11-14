Pantrify::Application.routes.draw do
  get 'items/:q', to: 'items#index'

  resources :lists
  resources :list_items, only: [ :create, :update, :destroy ]

  devise_for :users

  root 'lists#index'

  devise_scope :user do
    post 'magic', to: 'user#magic', as: :magic
  end
end
