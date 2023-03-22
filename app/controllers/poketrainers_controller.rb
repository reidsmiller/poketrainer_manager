class PoketrainersController < ApplicationController

  def index
    @poketrainers = Poketrainer.order(created_at: :desc)
  end

  def show
    @poketrainer = Poketrainer.find(params[:id])
  end

  def show_pokemons
    @poketrainer = Poketrainer.find(params[:id])
    @pokemons = Poketrainer.find(params[:id]).pokemons.all
  end
end