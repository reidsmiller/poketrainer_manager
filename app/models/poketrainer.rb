class Poketrainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy

  def self.default_order
    order(created_at: :desc)
  end

  def self.sort_by_num_pokemon
    left_outer_joins(:pokemons).group("poketrainers.id").order("COUNT(pokemons.id) DESC")
  end

  def self.search_poketrainers_exact(query)
    where('name = ?', query)
  end
  
  def pokemon_count
    pokemons.count
  end

  def order_pokemons
      pokemons.order(name: :asc)
  end

  def level_filter(level_input)
    level_input = level_input.to_i
    pokemons.where('level > ?', level_input)
  end
end