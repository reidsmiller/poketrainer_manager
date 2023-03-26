require 'rails_helper'

RSpec.describe '/poketrainers/:id/pokemons', type: :feature do
  
  describe 'as a visitor, when I visit /poketrainers/:id/pokemons' do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
      @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true) 
  
      @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: 'None', temperment: 'Angsty', bonded_to_trainer: true)
      @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Lugia', level: 100, primary_type: 'Flying', secondary_type: 'Psychic', temperment: 'Enlightened', bonded_to_trainer: false)
      @pokemon_3 = @misty.pokemons.create!(name: 'Staryu', level: 28, primary_type: 'Water', secondary_type: 'None', temperment: 'Flippant', bonded_to_trainer: true)
      @pokemon_4 = @misty.pokemons.create!(name: 'Psyduck', level: 20, primary_type: 'Water', secondary_type: 'Psychic', temperment: 'Confused', bonded_to_trainer: true)
      @pokemon_5 = @ash_ketchum.pokemons.create!(name: 'Bulbasaur', level: 15, primary_type: 'Grass', secondary_type: 'None', temperment: 'Sweet', bonded_to_trainer: true)
    end

    it 'I see each pokemon that is associated with that poketrainer and each pokemons attributes' do
      visit "/poketrainers/#{@ash_ketchum.id}/pokemons"

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

    it 'has a link at the top of the page that takes me to Pokemon index' do
      visit "/poketrainers/#{@misty.id}/pokemons"
      expect(page).to have_link('Pokemon Index', href: '/pokemons')

      click_link('Pokemon Index')
      expect(page).to have_current_path('/pokemons')
    end

    it 'has a link at the top of the page that takes me to Poketrainer index' do
      visit "/poketrainers/#{@misty.id}/pokemons"
      expect(page).to have_link('Poketrainer Index', href: '/poketrainers')

      click_link('Poketrainer Index')
      expect(page).to have_current_path('/poketrainers')
    end

    it 'has a link to add a new pokemon for that poketrainer' do
      visit "/poketrainers/#{@ash_ketchum.id}/pokemons"
      expect(page).to have_link('Catch Pokemon', href: "/poketrainers/#{@ash_ketchum.id}/pokemons/new")

      click_link('Catch Pokemon')
      expect(page).to have_current_path("/poketrainers/#{@ash_ketchum.id}/pokemons/new")
    end

    it 'has a link to sort children in alphabetical order' do
      visit "/poketrainers/#{@ash_ketchum.id}/pokemons"
      expect(page).to have_link('Sort Alphabetically', href: false)

      click_link('Sort Alphabetically')
      
      expect(page).to have_current_path("/poketrainers/#{@ash_ketchum.id}/pokemons?sort_by=name_asc")
      expect(@pokemon_5.name).to appear_before(@pokemon_2.name)
      expect(@pokemon_5.name).to appear_before(@pokemon_1.name)
      expect(@pokemon_2.name).to appear_before(@pokemon_1.name)
    end
  end
end