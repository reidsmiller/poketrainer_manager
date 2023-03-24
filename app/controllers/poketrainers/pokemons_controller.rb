class Poketrainers::PokemonsController < ApplicationController
  def index
    @poketrainer = Poketrainer.find(params[:id])
    @pokemons = @poketrainer.pokemons
  end

  def new
    @poketrainer = Poketrainer.find(params[:id])
  end

  def create
    poketrainer = Poketrainer.find(params[:id])
    pokemon = poketrainer.pokemons.create(
        name: params[:pokemon][:name],
        level: params[:pokemon][:level],
        primary_type: params[:pokemon][:primary_type],
        secondary_type: params[:pokemon][:secondary_type],
        temperment: params[:pokemon][:temperment],
        bonded_to_trainer: params[:pokemon][:bonded_to_trainer]
      )
    pokemon.save
    redirect_to "/poketrainers/#{params[:id]}/pokemons"
  end
end