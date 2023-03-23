require 'rails_helper'

RSpec.describe "/poketrainers", type: :feature do
  describe "as a visitor, when I visit the poketrainer index page" do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false, created_at: 2.days.ago)
      @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true, created_at: Time.current)
      @brock = Poketrainer.create!(name: "Brock", age: 15, hometown: "Somewhere", gym_badges: 6, has_bike: true, created_at: 1.day.ago)
    end

    it 'displayes the name of each poketrainer' do
      visit '/poketrainers'

      expect(page).to have_content(@ash_ketchum.name)
      expect(page).to have_content(@misty.name)
      expect(page).to have_content(@brock.name)
    end

    it 'orders the records by most recently created' do
      #Added different created_at timestamps in the before(:each) for each poketrainer
      visit "/poketrainers"

      expect(@misty.name).to appear_before(@brock.name)
      expect(@misty.name).to appear_before(@ash_ketchum.name)
      expect(@brock.name).to appear_before(@ash_ketchum.name)
    end

    it 'has a link at the top of the page that takes me to Pokemon index' do
      visit '/poketrainers'
      expect(page).to have_link('Pokemon Index', href: '/pokemons')

      click_link('Pokemon Index')
      expect(page).to have_current_path('/pokemons')
    end

    it 'has a link to create a new poketrainer record' do
      visit "/poketrainers"
      expect(page).to have_link("New Poketrainer", href: '/poketrainers/new')

      click_link('New Poketrainer')
      expect(page).to have_current_path('/poketrainers/new')
    end
  end
end