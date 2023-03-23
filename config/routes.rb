Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/poketrainers', to: 'poketrainers#index'
  get '/poketrainers/new', to: 'poketrainers#new'
  post '/poketrainers', to: 'poketrainers#create'
  get '/poketrainers/:id', to: 'poketrainers#show'
  get '/poketrainers/:poketrainer_id/pokemons', to: 'poketrainers/pokemons#index'
  get '/pokemons', to: 'pokemons#index'
  get '/pokemons/:id', to: 'pokemons#show'
end
