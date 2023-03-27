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

      expect(page).to have_content(@pokemon_1.name)
      expect(page).to have_content("Level: #{@pokemon_1.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_1.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_1.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_1.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_1.bonded_to_trainer}")

      visit "/pokemons/#{@pokemon_2.id}"

      expect(page).to have_content(@pokemon_2.name)
      expect(page).to have_content("Level: #{@pokemon_2.level}")
      expect(page).to have_content("Primary Type: #{@pokemon_2.primary_type}")
      expect(page).to have_content("Secondary Type: #{@pokemon_2.secondary_type}")
      expect(page).to have_content("Temperment: #{@pokemon_2.temperment}")
      expect(page).to have_content("Bonded to trainer?: #{@pokemon_2.bonded_to_trainer}")
    end

    it 'has a link at the top of the page that takes me to Pokemon index' do
      visit "/pokemons/#{@pokemon_2.id}"
      expect(page).to have_link('Pokemon Index', href: '/pokemons')

      click_link('Pokemon Index')
      expect(page).to have_current_path('/pokemons')
    end

    it 'has a link at the top of the page that takes me to Poketrainer index' do
      visit "/pokemons/#{@pokemon_2.id}"
      expect(page).to have_link('Poketrainer Index', href: '/poketrainers')

      click_link('Poketrainer Index')
      expect(page).to have_current_path('/poketrainers')
    end

    it 'has a link to update Pokemon' do
      visit "/pokemons/#{@pokemon_2.id}"
      expect(page).to have_link('Update Pokemon', href: "/pokemons/#{@pokemon_2.id}/edit")

      click_link('Update Pokemon')
      expect(page).to have_current_path("/pokemons/#{@pokemon_2.id}/edit")
    end

    it 'I see a link to delete pokemon' do
      visit "pokemons/#{@pokemon_1.id}"
      expect(page).to have_link('Delete Pokemon', href:"/pokemons/#{@pokemon_1.id}")

      click_link('Delete Pokemon')
      expect(current_path).to eq('/pokemons')
      expect(page).to have_no_content(@pokemon_1.name)
    end
  end
end