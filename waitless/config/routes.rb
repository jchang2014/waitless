Rails.application.routes.draw do

	root 'home#index'

	resource :home, only: [:search, :show]

  # scope constraints: {format: 'json'}, defaults: {format: 'json'} do

  	resource :session, only: [:create, :show, :destroy]

	  resources :users do
	    resources :reservations
	  end

	  resources :restaurants

	  resources :types do
	    resources :restaurants
	  end

	# end

end
