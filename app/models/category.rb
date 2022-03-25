class Category < ApplicationRecord
  belongs_to :movie, optional: true
  has_many :movies, :dependent => :destroy
end
