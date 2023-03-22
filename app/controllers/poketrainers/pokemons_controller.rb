class Poketrainers::PokemonsController < ApplicationController
  def index
    @poketrainer = Poketrainer.find(params[:poketrainer_id])
    @pokemons = @poketrainer.pokemons
  end
end