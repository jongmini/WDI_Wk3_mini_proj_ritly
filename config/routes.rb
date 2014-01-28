Ritly::Application.routes.draw do


  root 'urls#index'

  get '/go/:string', to: 'urls#visit', as: :visit

  get '/go/:string/preview', to: 'urls#show', as: :show

  post '/', to: 'urls#create'

  get '/admin', to: 'urls#admin', as: :admin

  delete '/admin', to: 'urls#delete'

  resources :users, :sessions

  get '/signup' => 'users#new'

  delete '/signout', to: 'sessions#destroy'
  
  get'/signin' => 'sessions#new'

  
end






