Quinn::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'home#index'

  resources :users

end
