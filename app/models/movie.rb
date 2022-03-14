class Movie < ApplicationRecord
  has_one :category
  has_one :rating
  extend FriendlyId
  friendly_id :title, use: :slugged
end
