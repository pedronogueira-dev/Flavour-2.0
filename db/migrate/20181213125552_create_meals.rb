class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.references :restaurant, foreign_key: true
      t.integer :capacity, default: 8
      t.date :reservation_date

      t.timestamps
    end
  end
end
