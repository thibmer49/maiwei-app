class Trip < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :categories

  has_many :trip_activities
  has_many :activities, through: :trip_activities
end
