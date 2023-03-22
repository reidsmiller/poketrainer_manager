class CreatePoketrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :poketrainers do |t|
      t.string :name
      t.integer :age
      t.string :hometown
      t.integer :gym_badges
      t.boolean :has_bike

      t.timestamps
    end
  end
end
