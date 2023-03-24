require 'rails_helper'

RSpec.describe '/poketrainer/:id/pokemons/new', type: :feature do
  describe 'As a visitor, when I am directed here' do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
    end

    it 'I see a form to add a new pokemon' do
      visit "/poketrainers/#{@ash_ketchum.id}/pokemons/new"

      expect(page).to have_content("Catch New Pokemon")
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
      expect(page).to have_link("Catch Pokemon")
    end

    it 'I can fill out the form and create a new pokemon that belongs to the specified trainer' do
      visit "/poketrainers/#{@ash_ketchum.id}/pokemons/new"

      fill_in 'name', with: 'Butterfree'
      fill_in 'level', with: 25
      fill_in 'primary_type', with: 'Bug'
      fill_in 'secondary_type', with: 'Flying'
      fill_in 'temperment', with: 'Carefree'
      fill_in 'bonded_to_trainer', with: true

      click_button 'Catch Pokemon'

      expect(page).to have_current_path("/poketrainers/#{@ash_ketchum.id}/pokemons")
      expect(page).to have_content("Butterfree")
      expect(page).to have_content('Level: 25')
      expect(page).to have_content('Primary Type: Bug')
      expect(page).to have_content('Secondary Type: Flying')
      expect(page).to have_content('Temperment: Carefree')
      expect(page).to have_content('Bonded to Trainer?: true')
    end
  end
end