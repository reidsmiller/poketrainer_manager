# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Poketrainer.destroy_all
Pokemon.destroy_all

@ash = Poketrainer.create(name: "Ash Ketchum", age: 10, hometown: "Pallet Town", gym_badges: 6, has_bike: false)
@misty = Poketrainer.create(name: "Misty", age: 10, hometown: "Cerulean City", gym_badges: 5, has_bike: true)
@brock = Poketrainer.create(name: "Brock", age: 15, hometown: "Pewter City", gym_badges: 6, has_bike: true)

@ash.pokemons.create(name: 'Pikachu', level: 30, primary_type: 'Electric', secondary_type: 'None', temperment: 'Angsty', bonded_to_trainer: true)
@ash.pokemons.create(name: 'Charizard', level: 40, primary_type: 'Fire', secondary_type: 'Flying', temperment: 'Independent', bonded_to_trainer: false)
@misty.pokemons.create(name: 'Staryu', level: 28, primary_type: 'Water', secondary_type: 'None', temperment: 'Flippant', bonded_to_trainer: true)
@misty.pokemons.create(name: 'Psyduck', level: 20, primary_type: 'Water', secondary_type: 'Psychic', temperment: 'Confused', bonded_to_trainer: true)
@ash.pokemons.create(name: 'Bulbasaur', level: 15, primary_type: 'Grass', secondary_type: 'None', temperment: 'Sweet', bonded_to_trainer: true)
@brock.pokemons.create(name: 'Onyx', level: 32, primary_type: 'Rock', secondary_type: 'Ground', temperment: 'Steady', bonded_to_trainer: true)
@brock.pokemons.create(name: 'Geodude', level: 21, primary_type: 'Rock', secondary_type: 'Ground', temperment: 'Rowdy', bonded_to_trainer: true)
@ash.pokemons.create(name: 'Mew', level: 100, primary_type: 'Psychic', secondary_type: 'None', temperment: 'Enlightened', bonded_to_trainer: false)

p "Created #{Poketrainer.count} Poketrainers and #{Pokemon.count} Pokemon"