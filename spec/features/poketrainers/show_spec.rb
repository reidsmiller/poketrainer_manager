require 'rails_helper'

RSpec.describe "/poketrainers/:id", type: :feature do
  before(:each) do
    @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
    @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true)
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
  end
end