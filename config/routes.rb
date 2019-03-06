Rails.application.routes.draw do

  get '/' => 'pages#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users
end
