class PoketrainersController < ApplicationController

  def index
    @poketrainers = Poketrainer.order(created_at: :desc)
  end

  def show
    @poketrainer = Poketrainer.find(params[:id])
  end
end