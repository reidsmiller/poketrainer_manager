class Poketrainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy

  def pokemon_count
    pokemons.count
  end

  def order_pokemons(sort_by)
    if sort_by == "name_asc"
      pokemons.order(name: :asc)
    end
  end

  def level_filter(level_input)
    level_input = level_input.to_i
    pokemons.where('level > ?', level_input)
  end
end