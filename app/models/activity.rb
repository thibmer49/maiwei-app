class Activity < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_taggable_on :categories
  has_one_attached :photo
  has_one_attached :video
   has_many :trip_activities, dependent: :destroy
end
