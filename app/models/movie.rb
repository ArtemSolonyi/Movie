class Movie < ApplicationRecord
  belongs_to :category, optional: true
  has_many :category
  has_one :rating
  extend FriendlyId
  friendly_id :title, use: :slugged
end
