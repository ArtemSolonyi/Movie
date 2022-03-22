class Movie < ApplicationRecord
  belongs_to :category, optional: true
  has_many :categories
  has_many :ratings, :dependent => :destroy


  extend FriendlyId
  friendly_id :title, use: :slugged
end
