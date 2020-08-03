class CreateCoffee < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :origin
      t.string :variety
      t.string :notes
      t.string :intensifier

      t.timestamps null: false
    end
  end
end
