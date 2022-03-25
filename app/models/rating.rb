class Rating < ApplicationRecord
  belongs_to :movie, optional: true
  validates :user_id, presence: true
end
