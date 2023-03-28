class Pokemon < ApplicationRecord
  belongs_to :poketrainer

  def self.search_pokemons_exact(query)
    where('name = ?', query)
  end
end