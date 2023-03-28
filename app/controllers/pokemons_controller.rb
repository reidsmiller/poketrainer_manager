class PokemonsController < ApplicationController
  def index
    if params[:commit] == 'Exact Match Search'
      @pokemons = Pokemon.search_pokemons_exact(params[:exact_match_search])
    else
      @pokemons = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update(pokemon_params)
    redirect_to "/pokemons/#{pokemon.id}"
  end

  def destroy
    Pokemon.destroy(params[:id])
    redirect_to '/pokemons'
  end

  private
  def pokemon_params
    params.permit(:name, :level, :primary_type, :secondary_type, :temperment, :bonded_to_trainer)
  end
end