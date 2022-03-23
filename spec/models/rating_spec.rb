require 'rails_helper'

RSpec.describe Rating, type: :model do

  it 'belong to category' do
    should belong_to(:movie).optional
  end

  subject { described_class.new(user_id:1)}
  describe 'validations' do
    describe 'title' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.user_id = nil
        expect(subject).to_not be_valid
      end
    end
    describe 'rating' do
      it 'must be default value nil' do
        expect(subject.rating).to eq(nil)
      end
    end
  end

end