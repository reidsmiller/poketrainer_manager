class Poketrainers::PokemonsController < ApplicationController
  def index
    @poketrainer = Poketrainer.find(params[:id])
    @pokemons = @poketrainer.pokemons
  end

  def new
    @poketrainer = Poketrainer.find(params[:id])
  end

  def create
    poketrainer = Poketrainer.find(params[:id])
    pokemon = poketrainer.pokemons.create(pokemon_params)
    redirect_to "/poketrainers/#{params[:id]}/pokemons"
  end

  def sort
    poketrainer = Poketrainer.find(params[:id])
    pokemons = poketrainer.pokemons.order(:name)
  end

  private
  def pokemon_params
    params.permit(:name, :level, :primary_type, :secondary_type, :temperment, :bonded_to_trainer)
  end
end