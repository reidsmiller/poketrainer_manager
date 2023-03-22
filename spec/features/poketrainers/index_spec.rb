require 'rails_helper'

RSpec.describe "/poketrainers", type: :feature do
  describe "as a visitor, when I visit the poketrainer index page" do
    let!(:ash_ketchum) { Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false) }
    let!(:misty) { Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true) }

    it 'displayes the name of each poketrainer' do
      visit '/poketrainers'

      # save_and_open_page
      expect(page).to have_content(ash_ketchum.name)
      expect(page).to have_content(misty.name)
    end
  end
end