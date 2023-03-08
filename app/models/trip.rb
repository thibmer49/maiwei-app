class Trip < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :categories
end
