class Movie < ApplicationRecord
  belongs_to :category, optional: true
  has_many :categories
  has_many :ratings, :dependent => :destroy
  validates :title, presence: true
  validates :text, presence: true
  validates :url, presence: true
  validates :category_id, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
end
