Ritly::Application.routes.draw do


  get '/', to: 'urls#index', as: :root

  get '/go/:string/preview', to: 'urls#show', as: :show

  # get 'go/:string/edit', to: 'urls#edit', as: :edit_url

  post '/', to: 'urls#create'

  # patch '/go/:string', to: 'urls#update'


  
end
