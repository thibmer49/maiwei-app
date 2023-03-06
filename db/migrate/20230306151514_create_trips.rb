class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :budget
      t.date :starting_date
      t.date :ending_date
      t.string :trip_name

      t.timestamps
    end
  end
end
