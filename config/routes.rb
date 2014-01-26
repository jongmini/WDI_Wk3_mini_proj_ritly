Ritly::Application.routes.draw do


  get '/', to: 'urls#index', as: :root

  get '/go/:string', to: 'urls#visit', as: :visit

  get '/go/:string/preview', to: 'urls#show', as: :show

  post '/', to: 'urls#create'

  get '/admin', to: 'urls#admin', as: :admin

  delete '/admin', to: 'urls#delete'

  
end





 # get 'go/:string/edit', to: 'urls#edit', as: :edit_url
  # patch '/go/:string', to: 'urls#update'
