class Trip < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :trip_activities, dependent: :destroy
  has_many :activities, through: :trip_activities
  acts_as_taggable_on :categories
end
