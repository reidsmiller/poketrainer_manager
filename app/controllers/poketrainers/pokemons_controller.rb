class Poketrainers::PokemonsController < ApplicationController
  def index
    @poketrainer = Poketrainer.find(params[:id])
    if params[:sort_by] != nil
      @pokemons = @poketrainer.order_pokemons(params[:sort_by])
    elsif params[:level_input] != nil
      @pokemons = @poketrainer.level_filter(params[:level_input])
    else
      @pokemons = @poketrainer.pokemons
    end
  end

  def new
    @poketrainer = Poketrainer.find(params[:id])
  end

  def create
    poketrainer = Poketrainer.find(params[:id])
    pokemon = poketrainer.pokemons.create(pokemon_params)
    redirect_to "/poketrainers/#{params[:id]}/pokemons"
  end

  private
  def pokemon_params
    params.permit(:name, :level, :primary_type, :secondary_type, :temperment, :bonded_to_trainer)
  end
end