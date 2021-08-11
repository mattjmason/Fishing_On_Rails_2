Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/signup', to: 'anglers#new'
    post '/signup', to: 'anglers#create'
  
  resources :fish, only: [:index, :new, :create]
  resources :anglers
  resources :locations do
    resources :fish, shallow: true 
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
