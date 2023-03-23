require 'rails_helper'

RSpec.describe '/poketrainers/new', type: :feature do
  describe 'As a visitor, when I visit the /poketrainers/new page' do
    it 'I see a form for a new parent record' do
      visit '/poketrainers/new'

      expect(page).to have_content('Enter New Poketrainer Information:')
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
      expect(page).to have_button('Create Poketrainer')
    end

    it 'I can fill out a form with new Poketrainers attributes and click Create Parent, a POST request is sent, new record created, and I am redirected to Parent Index' do
      visit '/poketrainers/new'

      fill_in 'name', with: 'Ash Ketchum'
      fill_in 'hometown', with: 'Pallet Town'
      fill_in 'gym_badges', with: 6
      fill_in 'has_bike', with: true

      click_button 'Create Poketrainer'

      expect(page).to have_current_path('/poketrainers')
      expect(page).to have_content('Poketrainer Index Page')
      expect(page).to have_content('Ash Ketchum')
    end
  end
end