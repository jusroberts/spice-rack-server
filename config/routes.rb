SpiceRackServer::Application.routes.draw do

  resources :items

  resources :lists

  devise_for :users
  root 'welcome#index'

end
