Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    post :sign_up
    post :login
  end

  namespace :developer do
    post :create
    patch :activate_account
    post :login
  end

  namespace :project do
    post :create
    post :add_developer
  end
end
