class CreateAteendees < ActiveRecord::Migration[5.2]
  def change
    create_table :ateendees do |t|
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
