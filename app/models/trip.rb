class Trip < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :trip_activities, dependent: :destroy
  has_many :activities, through: :trip_activities

  acts_as_taggable_on :categories

  has_many :trip_activities
  has_many :activities, through: :trip_activities

  def formated_starting_date
    I18n.l(starting_date, format: "%A %e %B %Y")
  end

  def formated_end_date
    I18n.l(ending_date, format: "%A %e %B %Y")
  end
end
