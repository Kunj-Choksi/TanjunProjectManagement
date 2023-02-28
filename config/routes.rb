Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    post 'sign_up', via: 'admin#sign_up'
    post 'login', via: 'admin#login'
  end

  namespace :developer do
    post :create
    patch :activate_account, via: 'developer#activate_account'
    post :login, via: 'developer#login'
  end
end
