class Poketrainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy

  def pokemon_count
    pokemons.count
  end
end