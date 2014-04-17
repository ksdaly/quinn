Quinn::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'home#index'

  resources :users
  resources :posts

  # mandrill test route
  # get "/email_processor", to: proc { [200, {}, ["OK"]] }, as: "mandrill_head_test_request"

end
