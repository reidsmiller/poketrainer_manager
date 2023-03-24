class Poketrainer < ApplicationRecord
  has_many :pokemons

  def pokemon_count
    pokemons.count
  end
end