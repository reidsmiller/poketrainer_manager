require 'rails_helper'

RSpec.describe "/pokemons/:id/edit", type: :feature do
  describe "When I visit the pokemon edit page" do
    before(:each) do
      @ash = Poketrainer.create!(Poketrainer.create!(name: "Ash Ketchum", age: 10, hometown: "Pallet Town", gym_badges: 6, has_bike: false))
      @pokemon_1 = @ash.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: nil, temperment: 'Angsty', bonded_to_trainer: true)
    end

    it 'I see a form to add a new pokemon' do
      visit "/pokemons/#{@pokemon_1.id}/edit"

      expect(page).to have_content("Update Pokemon")
      expect(page).to have_content("Name:")
      expect(page).to have_field('name')
      expect(page).to have_content("Level:")
      expect(page).to have_field('level')
      expect(page).to have_content("Primary Type:")
      expect(page).to have_field('primary_type')
      expect(page).to have_content("Secondary Type:")
      expect(page).to have_field('secondary_type')
      expect(page).to have_content("Temperment:")
      expect(page).to have_field('temperment')
      expect(page).to have_content("Bonded to trainer?:")
      expect(page).to have_field('bonded_to_trainer')
      expect(page).to have_button('Update Pokemon')
    end

    it 'I can fill out the form and create a new pokemon that belongs to the specified trainer' do
      visit "/pokemons/#{@pokemon_1.id}/edit"

      fill_in 'name', with: 'Butterfree'
      fill_in 'level', with: 25
      fill_in 'primary_type', with: 'Bug'
      fill_in 'secondary_type', with: 'Flying'
      fill_in 'temperment', with: 'Carefree'
      fill_in 'bonded_to_trainer', with: true

      click_button 'Update Pokemon'

      expect(page).to have_current_path("/pokemons/#{@pokemon_1.id}")
      expect(page).to have_content("Butterfree")
      expect(page).to have_content('Level: 25')
      expect(page).to have_content('Primary Type: Bug')
      expect(page).to have_content('Secondary Type: Flying')
      expect(page).to have_content('Temperment: Carefree')
      expect(page).to have_content('Bonded to trainer?: true')
    end
  end
end