class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
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

  private
  def pokemon_params
    params.permit(:name, :level, :primary_type, :secondary_type, :temperment, :bonded_to_trainer)
  end
end