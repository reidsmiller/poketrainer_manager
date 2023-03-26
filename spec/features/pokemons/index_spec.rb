require 'rails_helper'

RSpec.describe "/pokemons", type: :feature do
  describe "As a visitor, when I visit the pokemons index page" do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)

      @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: nil, temperment: 'Angsty', bonded_to_trainer: true)
      @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Lugia', level: 100, primary_type: 'Flying', secondary_type: 'Psychic', temperment: 'Enlightened', bonded_to_trainer: false)
    end

    it 'I see the attributes of each pokemon' do
      visit '/pokemons'

      expect(page).to have_content("Pokemon Index Page")
      expect(page).to have_content(@pokemon_1.name)
      expect(page).to have_content("Level: #{@pokemon_1.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_1.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_1.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_1.temperment}")
      # expect(page).to have_content("Bonded to trainer?: #{@pokemon_1.bonded_to_trainer}")
      
      expect(page).to have_content(@pokemon_2.name)
      expect(page).to have_content("Level: #{@pokemon_2.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_2.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_2.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_2.temperment}")
      # expect(page).to have_content("Bonded to trainer?: #{@pokemon_2.bonded_to_trainer}")
    end
    
    it 'has a link at the top of the page that takes me to Poketrainer index' do
      visit '/pokemons'
      
      expect(page).to have_link('Poketrainer Index', href: '/poketrainers')

      click_link('Poketrainer Index')

      expect(page).to have_current_path('/poketrainers')
    end

    it 'only shows boolean columns when true' do
      visit '/pokemons'

      expect(page).to have_content("Bonded to trainer?: #{@pokemon_1.bonded_to_trainer}")
      expect(page).to have_no_content("Bonded to trainer?: #{@pokemon_2.bonded_to_trainer}")
    end

    it 'I see a link next to each pokemon to edit its info' do
      visit "/pokemons"
      expect(page).to have_link("Edit #{@pokemon_1.name}", href: "/pokemons/#{@pokemon_1.id}/edit")
      click_link "Edit #{@pokemon_1.name}"
      expect(current_path).to eq("/pokemons/#{@pokemon_1.id}/edit")

      visit "/pokemons"
      expect(page).to have_link("Edit #{@pokemon_2.name}", href: "/pokemons/#{@pokemon_2.id}/edit")
      click_link "Edit #{@pokemon_2.name}"
      expect(current_path).to eq("/pokemons/#{@pokemon_2.id}/edit")
    end
  end
end