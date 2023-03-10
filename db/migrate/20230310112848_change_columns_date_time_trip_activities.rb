class ChangeColumnsDateTimeTripActivities < ActiveRecord::Migration[7.0]
  def change
    change_column :trip_activities, :start_at, :datetime
    change_column :trip_activities, :end_at, :datetime
  end
end
