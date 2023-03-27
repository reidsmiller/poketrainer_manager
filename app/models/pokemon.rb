class Pokemon < ApplicationRecord
  belongs_to :poketrainer

  def order_pokemons(sort_by)
    require 'pry'; binding.pry
    if sort_by == "name_asc"

    end
  end
  
end