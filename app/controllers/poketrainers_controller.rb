class PoketrainersController < ApplicationController

  def index
    @poketrainers = Poketrainer.all
  end

  def show
    @poketrainer = Poketrainer.find(params[:id])
  end

  def show_pokemons
    @poketrainer = Poketrainer.find(params[:id])
    @pokemons = Poketrainer.find(params[:id]).pokemons.all
  end
end