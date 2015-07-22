require 'sidekiq/web'

Rails.application.routes.draw do
  require 'sidekiq/web'
  root 'home#index'
  mount Sidekiq::Web, at: '/sidekiq'
  resource :home, only: [:search, :show]

  resource :session, only: [:create, :show, :destroy]

  resources :users


  resources :restaurants, only: [:index, :show, :create] do
  	resources :reservations
  end

  resources :types, only: [:index, :show]


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
