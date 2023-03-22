class CreatePokemon < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :level
      t.string :primary_type
      t.string :secondary_type
      t.string :temperment
      t.boolean :bonded_to_trainer
      t.references :poketrainer, foreign_key: true

      t.timestamps
    end
  end
end
