class PoketrainersController < ApplicationController

  def index
    @poketrainers = Poketrainer.all
  end
end