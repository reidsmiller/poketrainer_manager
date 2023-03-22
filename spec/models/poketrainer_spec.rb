require 'rails_helper'

RSpec.describe Poketrainer, type: :model do
  describe "relationships" do
    it { should have_many :pokemons }
  end

  # User Story 7
  describe 'instance methods' do
    before(:each) do
      @ash_ketchum = Poketrainer.create!(name: "Ash Ketchum", age: 14, hometown: "Cerulean", gym_badges: 6, has_bike: false)
      @misty = Poketrainer.create!(name: "Misty", age: 13, hometown: "Somewhere", gym_badges: 5, has_bike: true) 

      @pokemon_1 = @ash_ketchum.pokemons.create!(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: 'None', temperment: 'Angsty', bonded_to_trainer: true)
      @pokemon_2 = @ash_ketchum.pokemons.create!(name: 'Mew', level: 100, primary_type: 'Psychic', secondary_type: 'None', temperment: 'Enlightened', bonded_to_trainer: false)
      @pokemon_3 = @misty.pokemons.create!(name: 'Staryu', level: 28, primary_type: 'Water', secondary_type: 'None', temperment: 'Flippant', bonded_to_trainer: true)
      @pokemon_4 = @misty.pokemons.create!(name: 'Psyduck', level: 20, primary_type: 'Water', secondary_type: 'Psychic', temperment: 'Confused', bonded_to_trainer: true)
      @pokemon_5 = @ash_ketchum.pokemons.create!(name: 'Bulbasaur', level: 15, primary_type: 'Grass', secondary_type: 'None', temperment: 'Sweet', bonded_to_trainer: true)
    end

    it '#pokemon_count' do
      expect(@ash_ketchum.pokemon_count).to eq(3)
    end
  end
end