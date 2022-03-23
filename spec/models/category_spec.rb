require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'belong to movie' do
    should belong_to(:movie).optional
  end
  it 'has_many movies'do
    should have_many(:movies)
  end

end