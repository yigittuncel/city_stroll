class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :city
      t.string :starting_point
      t.string :ending_point
      t.text :description
      t.integer :duration
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
