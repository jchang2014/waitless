Rails.application.routes.draw do

	root 'home#index'

	resource :home, only: [:search, :show]

  # scope constraints: {format: 'json'}, defaults: {format: 'json'} do

  	resource :session, only: [:create, :show, :destroy]

	  resources :users do
	    resources :reservations
	  end

	  resources :restaurants, defaults: { format: 'json' }

	  resources :types do
	    resources :restaurants
	  end

	# end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
