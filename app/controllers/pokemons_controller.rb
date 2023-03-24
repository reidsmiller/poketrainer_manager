class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update(
      name: params[:pokemon][:name],
      level: params[:pokemon][:level],
      primary_type: params[:pokemon][:primary_type],
      secondary_type: params[:pokemon][:secondary_type],
      temperment: params[:pokemon][:temperment],
      bonded_to_trainer: params[:pokemon][:bonded_to_trainer]
    )
    pokemon.save
    redirect_to "/pokemons/#{pokemon.id}"
  end
end