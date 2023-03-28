class PoketrainersController < ApplicationController

  def index
    if params[:sort_by] == "pokemon_caught_desc"
      @poketrainers = Poketrainer.sort_by_num_pokemon
    else
      @poketrainers = Poketrainer.default_order# order(created_at: :desc)
    end
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