class AddDurationToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :duration, :float
  end
end
