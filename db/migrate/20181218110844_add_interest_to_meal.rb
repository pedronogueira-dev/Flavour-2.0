class AddInterestToMeal < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :interest, foreign_key: true
  end
end
