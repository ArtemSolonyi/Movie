class Rating < ApplicationRecord
  belongs_to :movie, optional: true
end
