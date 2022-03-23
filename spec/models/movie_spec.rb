require 'rails_helper'

RSpec.describe Movie, type: :model do

  it 'belong to category' do
    should belong_to(:category).optional
  end

  it 'have_many categories' do
    should have_many(:categories)
  end

  it 'have_many ratings' do
    should have_many(:ratings)
  end
  subject { described_class.new(title:"Some title",text:"Some text",url:"Some url",category_id:1).(&:save)}

  describe 'validations' do
    describe 'title' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.title = nil
        expect(subject).to_not be_valid
      end
    end
    describe 'text' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.text = nil
        expect(subject).to_not be_valid
      end
    end
    describe 'url' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.url = nil
        expect(subject).to_not be_valid
      end
    end
    describe 'category_id' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.category_id = nil
        expect(subject).to_not be_valid
      end
    end
  end

end