require 'rails_helper'

RSpec.describe '/poketrainers/:poketrainer_id/pokemons', type: :feature do
  
  describe 'as a visitor, when I visit /poketrainers/:poketrainer_id/pokemons' do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
      @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true) 
  
      @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: 'None', temperment: 'Angsty', bonded_to_trainer: true)
      @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Lugia', level: 100, primary_type: 'Flying', secondary_type: 'Psychic', temperment: 'Enlightened', bonded_to_trainer: false)
      @pokemon_3 = @misty.pokemons.create!(name: 'Staryu', level: 28, primary_type: 'Water', secondary_type: 'None', temperment: 'Flippant', bonded_to_trainer: true)
      @pokemon_4 = @misty.pokemons.create!(name: 'Psyduck', level: 20, primary_type: 'Water', secondary_type: 'Psychic', temperment: 'Confused', bonded_to_trainer: true)
    end

    it 'I see each pokemon that is associated with that poketrainer and each pokemons attributes' do
      visit "/poketrainers/#{@ash_ketchum.id}/pokemons"

      # save_and_open_page
      expect(page).to have_content("#{@ash_ketchum.name}'s Pokemon")
      expect(page).to have_content(@pokemon_1.name)
      expect(page).to have_content("Level: #{@pokemon_1.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_1.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_1.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_1.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_1.bonded_to_trainer}")
      expect(page).to have_content(@pokemon_2.name)
      expect(page).to have_content("Level: #{@pokemon_2.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_2.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_2.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_2.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_2.bonded_to_trainer}")

      visit "/poketrainers/#{@misty.id}/pokemons"

      # save_and_open_page
      expect(page).to have_content("#{@misty.name}'s Pokemon")
      expect(page).to have_content(@pokemon_3.name)
      expect(page).to have_content("Level: #{@pokemon_3.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_3.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_3.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_3.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_3.bonded_to_trainer}")
      expect(page).to have_content(@pokemon_4.name)
      expect(page).to have_content("Level: #{@pokemon_4.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_4.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_4.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_4.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_4.bonded_to_trainer}")
    end

    it 'has a link at the top of the page that takes me to Poketrainer index' do
      visit "/poketrainers/#{misty.id}/pokemons"

      expect(page).to have_link('Poketrainer Index', href: '/poketrainers')
    end
  end
end