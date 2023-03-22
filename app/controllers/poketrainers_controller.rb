class PoketrainersController < ApplicationController

  def index
    @poketrainers = Poketrainer.all
  end

  def show
    @poketrainer = Poketrainer.find(params[:id])
  end
end