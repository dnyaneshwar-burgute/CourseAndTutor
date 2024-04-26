require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:all) do
    @course = FactoryBot.create(:course)
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.build(:course)).to be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    describe 'title uniquness' do
      it 'should save successfully if uniq' do
        expect(FactoryBot.build(:course)).to be_valid
      end
      it 'should not save successfully if already exists' do
        course1 = FactoryBot.create(:course, title: 'Maths')
        course2 = FactoryBot.build(:course, title: 'Maths')
        course2.valid?
        expect(course2.errors.full_messages).to eq(['Title has already been taken'])
      end
    end
  end

  describe 'associations' do
    it { should have_many(:tutors) }
  end
end
