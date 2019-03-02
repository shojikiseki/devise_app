Rails.application.routes.draw do

  get '/' => 'pages#top'
  devise_for :users
end
