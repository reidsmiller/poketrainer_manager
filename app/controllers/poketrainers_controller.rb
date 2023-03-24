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
    poketrainer = Poketrainer.create(
        name: params[:poketrainer][:name],
        age: params[:poketrainer][:age],
        hometown: params[:poketrainer][:hometown],
        gym_badges: params[:poketrainer][:gym_badges],
        has_bike: params[:poketrainer][:has_bike],
      )
    poketrainer.save
    redirect_to '/poketrainers'
  end

  def edit
    @poketrainer = Poketrainer.find(params[:id])
  end

  def update
    poketrainer = Poketrainer.find(params[:id])
    poketrainer.update(
      name: params[:poketrainer][:name],
      age: params[:poketrainer][:age],
      hometown: params[:poketrainer][:hometown],
      gym_badges: params[:poketrainer][:gym_badges],
      has_bike: params[:poketrainer][:has_bike],
    )
  poketrainer.save
  redirect_to "/poketrainers/#{poketrainer.id}"
  end
end