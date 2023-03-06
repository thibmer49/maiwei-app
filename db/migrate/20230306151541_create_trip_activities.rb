class CreateTripActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_activities do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
