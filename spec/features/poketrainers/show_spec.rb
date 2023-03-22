require 'rails_helper'

RSpec.describe "/poketrainers/:id", type: :feature do
  before(:each) do
    @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
    @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true) 

    @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: 'None', temperment: 'Angsty', bonded_to_trainer: true)
    @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Mew', level: 100, primary_type: 'Psychic', secondary_type: 'None', temperment: 'Enlightened', bonded_to_trainer: false)
    @pokemon_3 = @misty.pokemons.create!(name: 'Staryu', level: 28, primary_type: 'Water', secondary_type: 'None', temperment: 'Flippant', bonded_to_trainer: true)
    @pokemon_4 = @misty.pokemons.create!(name: 'Psyduck', level: 20, primary_type: 'Water', secondary_type: 'Psychic', temperment: 'Confused', bonded_to_trainer: true)
    @pokemon_5 = @ash_ketchum.pokemons.create!(name: 'Bulbasaur', level: 15, primary_type: 'Grass', secondary_type: 'None', temperment: 'Sweet', bonded_to_trainer: true)
  end

  describe 'as a visitor, when I visit poketrainers/:id' do
    it 'I see the poketrainer with that id including the poketrainers attributes' do
      visit "/poketrainers/#{@ash_ketchum.id}"

      # save_and_open_page
      expect(page).to have_content(@ash_ketchum.name)
      expect(page).to have_content("Age: #{@ash_ketchum.age}")
      expect(page).to have_content("Hometown: #{@ash_ketchum.hometown}")
      expect(page).to have_content("Gym Badges: #{@ash_ketchum.gym_badges}")
      expect(page).to have_content("Has a bike: #{@ash_ketchum.has_bike}")

      visit "/poketrainers/#{@misty.id}"

      # save_and_open_page
      expect(page).to have_content(@misty.name)
      expect(page).to have_content("Age: #{@misty.age}")
      expect(page).to have_content("Hometown: #{@misty.hometown}")
      expect(page).to have_content("Gym Badges: #{@misty.gym_badges}")
      expect(page).to have_content("Has a bike: #{@misty.has_bike}")
    end

    it 'displays a count of the number of pokemon associated with this poketrainer' do
      visit "/poketrainers/#{@ash_ketchum.id}"

      # save_and_open_page
      expect(page).to have_content("Number of Pokemon caught: 3")

      visit "poketrainers/#{@misty.id}"

      # save_and_open_page
      expect(page).to have_content("Number of Pokemon caught: 2")
    end

    it 'has a link at the top of the page that takes me to Pokemon index' do
      visit "/poketrainers/#{@misty.id}"
      
      expect(page).to have_link('Pokemon Index', href: '/pokemons')
    end

    it 'has a link at the top of the page that takes me to Poketrainer index' do
      visit "poketrainers/#{@misty.id}"

      expect(page).to have_link('Poketrainer Index', href: '/poketrainers')
    end
  end
end