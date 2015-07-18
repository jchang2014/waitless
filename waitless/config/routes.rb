Rails.application.routes.draw do


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resource :session, only: [:create, :show, :destroy]

  resources :users do
    resources :reservations
  end

  resources :restaurants

  resources :types do
    resources :restaurants
  end

end
