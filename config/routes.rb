Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/poketrainers', to: 'poketrainers#index'
  get '/poketrainers/new', to: 'poketrainers#new'
  post '/poketrainers', to: 'poketrainers#create'
  get '/poketrainers/:id', to: 'poketrainers#show'
  get '/poketrainers/:id/edit', to: 'poketrainers#edit'
  patch '/poketrainers/:id', to: 'poketrainers#update'
  delete '/poketrainers/:id', to: 'poketrainers#destroy'
  get '/pokemons', to: 'pokemons#index'
  get '/pokemons/:id', to: 'pokemons#show'
  get '/pokemons/:id/edit', to: 'pokemons#edit'
  patch '/pokemons/:id', to: 'pokemons#update'
  delete '/pokemons/:id', to: 'pokemons#destroy'
  get '/poketrainers/:id/pokemons', to: 'poketrainers/pokemons#index'
  get '/poketrainers/:id/pokemons/new', to: 'poketrainers/pokemons#new'
  post '/poketrainers/:id/pokemons', to: 'poketrainers/pokemons#create'
  get 'poketrainers/:id/pokemons/level_filter', to: 'poketrainers/pokemons#level_filter'
end
