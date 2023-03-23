require 'rails_helper'

RSpec.describe '/poketrainers/:poketrainer_id/edit', type: :feature do
  describe 'As a visitor, when I visit a poketrainer edit page' do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
    end

    it 'I see a form to edit Poketrainers attributes' do
      visit "/poketrainers/#{@ash_ketchum}/edit"

      expect(page).to have_content('Update Poketrainer Information:')
      expect(page).to have_content('Name:')
      expect(page).to have_field('name')
      expect(page).to have_content('Age:')
      expect(page).to have_field('age')
      expect(page).to have_content('Hometown:')
      expect(page).to have_field('hometown')
      expect(page).to have_content('Gym Badges:')
      expect(page).to have_field('gym_badges')
      expect(page).to have_content('Has a Bike?:')
      expect(page).to have_field('has_bike')
      expect(page).to have_button('Update Poketrainer')
    end

    it 'I can fill out Poketrainers updated attributes, submit and see the updated info' do
      visit "/poketrainers/#{@ash_ketchum}/edit"

      fill_in 'name', with: 'Reid Miller'
      fill_in 'hometown', with: 'Boulder'
      fill_in 'gym_badges', with: 8000
      fill_in 'has_bike', with: true

      click_button 'Update Poketrainer'

      expect(page).to have_current_path("/poketrainers/#{@ash_ketchum}")
      expect(page).to have_content('Reid Miller')
      expect(page).to have_content('Hometown: Boulder')
      expect(page).to have_content('Gym Badges: 8000')
      expect(page).to have_content('Has a bike: true')
    end
  end
end