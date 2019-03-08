Rails.application.routes.draw do

  get '/' => 'blogs#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :blogs
end
