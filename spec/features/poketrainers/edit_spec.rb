require 'rails_helper'

RSpec.describe '/poketrainers/:poketrainer_id/edit', type: :feature do
  describe 'As a visitor, when I visit a poketrainer edit page' do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
    end

    it 'I see a form to edit Poketrainers attributes' do
      visit "/poketrainers/#{@ash_ketchum.id}/edit"

      expect(page).to have_content('Update Poketrainer Information:')
      expect(page).to have_content('Name')
      expect(page).to have_field('name')
      expect(page).to have_content('Age')
      expect(page).to have_field('age')
      expect(page).to have_content('Hometown')
      expect(page).to have_field('hometown')
      expect(page).to have_content('Gym badges')
      expect(page).to have_field('gym_badges')
      expect(page).to have_content('Has bike')
      expect(page).to have_field('has_bike')
      expect(page).to have_button('Update Poketrainer')
    end

    it 'I can fill out Poketrainers updated attributes, submit and see the updated info' do
      visit "/poketrainers/#{@ash_ketchum.id}/edit"

      fill_in 'name', with: 'Reid Miller'
      fill_in 'age', with: 32
      fill_in 'hometown', with: 'Boulder'
      fill_in 'gym_badges', with: 8000
      fill_in 'has_bike', with: true

      click_button 'Update Poketrainer'

      expect(page).to have_current_path("/poketrainers/#{@ash_ketchum.id}")
      expect(page).to have_content('Reid Miller')
      expect(page).to have_content('Age: 32')
      expect(page).to have_content('Hometown: Boulder')
      expect(page).to have_content('Gym Badges: 8000')
      expect(page).to have_content('Has a bike: true')
    end

    it 'has a link at the top of the page that takes me to Pokemon index' do
      visit "/poketrainers/#{@ash_ketchum.id}/edit"
      expect(page).to have_link('Pokemon Index', href: '/pokemons')

      click_link('Pokemon Index')
      expect(page).to have_current_path('/pokemons')
    end

    it 'has a link at the top of the page that takes me to Poketrainer index' do
      visit "poketrainers/#{@ash_ketchum.id}/edit"
      expect(page).to have_link('Poketrainer Index', href: '/poketrainers')

      click_link('Poketrainer Index')
      expect(page).to have_current_path('/poketrainers')
    end
  end
end