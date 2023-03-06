class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.datetime :opening_hour
      t.datetime :closing_hour
      t.float :average_rating
      t.float :latitude
      t.float :longitude
      t.float :price_per_visitor
      t.integer :closed_day
      t.string :name
      t.string :address
      t.string :description
      t.string :phone_number
      t.string :website
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
