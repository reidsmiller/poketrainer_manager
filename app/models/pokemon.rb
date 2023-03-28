class Pokemon < ApplicationRecord
  belongs_to :poketrainer

  def self.search_pokemons_exact(query)
    where('name = ?', query)
  end

  def self.search_pokemons_partial(query)
    where('name LIKE ?', "%#{query}%")
  end
end