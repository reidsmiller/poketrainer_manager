class PoketrainersController < ApplicationController

  def index
    @poketrainers = Poketrainer.order(created_at: :desc)
  end

  def show
    @poketrainer = Poketrainer.find(params[:id])
  end

  def new
  end

  def create
    Poketrainer.create(poketrainer_params)
    redirect_to '/poketrainers'
  end
  
  def edit
    @poketrainer = Poketrainer.find(params[:id])
  end
  
  def update
    poketrainer = Poketrainer.find(params[:id])
    poketrainer.update(poketrainer_params)
    redirect_to "/poketrainers/#{poketrainer.id}"
  end

  def destroy
    Poketrainer.destroy(params[:id])
    redirect_to '/poketrainers'
  end

  private
  def poketrainer_params
    params.permit(:name, :age, :hometown, :gym_badges, :has_bike)
  end
end