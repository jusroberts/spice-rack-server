SpiceRackServer::Application.routes.draw do
  get 'items/:q', to: 'items#index', format: :json

  get 'list/:list_id/item', to: 'list_items#new', as: :new_list_item
  post 'list/item', to: 'list_items#create', as: :list_items
  get 'list_item/:id', to: 'list_items#edit', as: :edit_list_item
  patch 'list_item', to: 'list_items#update', as: :list_item

  resources :lists

  devise_for :users
  root 'lists#index'
end
