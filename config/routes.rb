Rails.application.routes.draw do

	root 'home#index'
  post 'reservees/contact', to: 'reservees#contact'

	resource :home, only: [:search, :show]

  # scope constraints: {format: 'json'}, defaults: {format: 'json'} do

	resource :session, only: [:create, :show, :destroy]

  resources :users


  resources :restaurants, only: [:index, :show, :create] do
  	resources :reservations

    require 'sidekiq/web'
    mount Sidekiq::Web => 'sidekiq', as: :background_jobs
    # root to: ''
  end

  resources :types, only: [:index, :show]

	# end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
