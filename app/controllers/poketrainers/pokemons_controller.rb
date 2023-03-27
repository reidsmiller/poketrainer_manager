class Poketrainers::PokemonsController < ApplicationController
  def index
    @poketrainer = Poketrainer.find(params[:id])
    if params[:sort_by] == "name_asc"
      @pokemons = @poketrainer.pokemons.order(name: :asc)
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

  def level_filter
    level_input = params[:level_input].to_i
    @poketrainer = Poketrainer.find(params[:id])
    @pokemons = @poketrainer.pokemons.where('level > ?', level_input)

    render 'index'
  end

  private
  def pokemon_params
    params.permit(:name, :level, :primary_type, :secondary_type, :temperment, :bonded_to_trainer)
  end
end