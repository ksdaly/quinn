Quinn::Application.routes.draw do

  devise_for :users
  root 'users#index'

  resources :users

end
