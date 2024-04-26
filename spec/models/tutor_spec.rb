require 'rails_helper'

RSpec.describe Tutor, type: :model do
  before(:all) do
    @tutor = FactoryBot.create(:tutor)
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryBot.build(:tutor)).to be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    describe 'email uniquness' do
      it 'should save successfully if uniq' do
        expect(FactoryBot.build(:tutor)).to be_valid
      end
      it 'should not save successfully if already exists' do
        tutor1 = FactoryBot.create(:tutor, email: 'tutor.uniq@gmail.com')
        tutor2 = FactoryBot.build(:tutor, email: 'tutor.uniq@gmail.com')
        tutor2.valid?
        expect(tutor2.errors.full_messages).to eq(['Email has already been taken'])
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:course) }
  end
end
