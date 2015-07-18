Rails.application.routes.draw do

  resource :session, only: [:create, :show, :destroy]

  resources :users do 
    resources :reservations 
  end
  
  resources :restaurants
  
  resources :types do
    resources :restaurants
  end

end
