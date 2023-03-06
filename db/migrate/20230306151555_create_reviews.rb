class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.references :trip, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
