class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :opening_time
      t.string :closing_time
      t.string :created_by

      t.timestamps
    end
  end
end
