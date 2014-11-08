SpiceRackServer::Application.routes.draw do
  get 'items/:q', to: 'items#index', format: :json

  get 'list/:list_id/item', to: 'list_items#new', as: :new_list_item

  resources :lists
  resources :list_items

  devise_for :users

  root 'lists#index'
end
