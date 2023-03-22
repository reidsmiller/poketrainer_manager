require 'rails_helper'

RSpec.describe "/pokemons/:id", type: :feature do
  before(:each) do
    @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)

    @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: nil, temperment: 'Angsty', bonded_to_trainer: true)
    @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Lugia', level: 100, primary_type: 'Flying', secondary_type: 'Psychic', temperment: 'Enlightened', bonded_to_trainer: false)
  end

  describe 'as a visitor, when I visit /pokemons/:id' do
    it 'I see the pokemon with that id including its attributes' do
      visit "/pokemons/#{@pokemon_1.id}"

      # save_and_open_page
      expect(page).to have_content(@pokemon_1.name)
      expect(page).to have_content("Level: #{@pokemon_1.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_1.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_1.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_1.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_1.bonded_to_trainer}")

      visit "/pokemons/#{@pokemon_2.id}"

      # save_and_open_page
      expect(page).to have_content(@pokemon_2.name)
      expect(page).to have_content("Level: #{@pokemon_2.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_2.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_2.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_2.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_2.bonded_to_trainer}")
    end
  end
end