require 'rails_helper'

RSpec.describe "/poketrainers", type: :feature do
  describe "as a visitor, when I visit the poketrainer index page" do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false, created_at: 2.days.ago)
      @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true, created_at: Time.current)
      @brock = Poketrainer.create!(name: "Brock", age: 15, hometown: "Somewhere", gym_badges: 6, has_bike: true, created_at: 1.day.ago)

      @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: 'None', temperment: 'Angsty', bonded_to_trainer: true)
      @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Lugia', level: 100, primary_type: 'Psychic', secondary_type: 'Flying', temperment: 'Enlightened', bonded_to_trainer: false)
      @pokemon_3 = @misty.pokemons.create!(name: 'Staryu', level: 28, primary_type: 'Water', secondary_type: 'None', temperment: 'Flippant', bonded_to_trainer: true)
      @pokemon_4 = @misty.pokemons.create!(name: 'Psyduck', level: 20, primary_type: 'Water', secondary_type: 'Psychic', temperment: 'Confused', bonded_to_trainer: true)
      @pokemon_5 = @misty.pokemons.create!(name: 'Mew', level: 100, primary_type: 'Psychic', secondary_type: 'None', temperment: 'Enlightened', bonded_to_trainer: false)
      @pokemon_6 = @brock.pokemons.create!(name: 'Onyx', level: 35, primary_type: 'Rock', secondary_type: 'Ground', temperment: 'Stubborn', bonded_to_trainer: true)
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

    it 'I can see a link next to every poketrainer to edit its info' do
      visit "/poketrainers"
      expect(page).to have_button("Edit #{@ash_ketchum.name}")
      click_button "Edit #{@ash_ketchum.name}"
      expect(current_path).to eq("/poketrainers/#{@ash_ketchum.id}/edit")

      visit "/poketrainers"
      expect(page).to have_button("Edit #{@misty.name}")
      click_button "Edit #{@misty.name}"
      expect(current_path).to eq("/poketrainers/#{@misty.id}/edit")

      visit "/poketrainers"
      expect(page).to have_button("Edit #{@brock.name}")
      click_button "Edit #{@brock.name}"
      expect(current_path).to eq("/poketrainers/#{@brock.id}/edit")
    end

    it 'I see a link to delete each poketrainer next to each poketrainer' do
      visit "/poketrainers"
      expect(page).to have_button("Delete #{@ash_ketchum.name}")
      click_button "Delete #{@ash_ketchum.name}"
      expect(current_path).to eq("/poketrainers")

      visit "/poketrainers"
      expect(page).to have_button("Delete #{@misty.name}")
      click_button "Delete #{@misty.name}"
      expect(current_path).to eq("/poketrainers")

      visit "/poketrainers"
      expect(page).to have_button("Delete #{@brock.name}")
      click_button "Delete #{@brock.name}"
      expect(current_path).to eq("/poketrainers")
    end

    it 'I see a link to sort parents by number of pokemon they have' do
      visit "/poketrainers"
      expect(page).to have_link("Sort by Number of Pokemon Caught", href: false)
      click_link "Sort by Number of Pokemon Caught"
      expect(current_path).to eq("/poketrainers")
      expect(@misty.name).to appear_before(@ash_ketchum.name)
      expect(@misty.name).to appear_before(@brock.name)
      expect(@ash_ketchum.name).to appear_before(@brock.name)
    end

    it 'I see the number of pokemon next to each poketrainer' do
      visit "/poketrainers"

      expect(page).to have_content("Pokemon Caught: #{@ash_ketchum.pokemon_count}")
      expect(page).to have_content("Pokemon Caught: #{@misty.pokemon_count}")
      expect(page).to have_content("Pokemon Caught: #{@brock.pokemon_count}")
    end

    it 'I see a text box to filter results by keyword for exact match' do
      visit "/poketrainers"
      expect(page).to have_field('exact_match_search')
      expect(page).to have_button('Exact Match Search')

      fill_in 'exact_match_search', with: 'Misty'
      click_button 'Exact Match Search'

      expect(current_path).to eq('/poketrainers')
      expect(page).to have_content(@misty.name)
      expect(page).to have_no_content(@ash_ketchum.name)
      expect(page).to have_no_content(@brock.name)
    end
  end
end