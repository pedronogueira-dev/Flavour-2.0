class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :zomato_restaurant_id
      t.string :name
      t.string :address
      t.float :rating
      t.integer :avg_price
      t.string :currency
      t.string :location
      t.float :longitude
      t.float :latitude
      t.string :website

      t.timestamps
    end
  end
end
