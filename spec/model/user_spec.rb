require 'rails_helper'

describe User, type: :model do

  let(:admin_user) { create :admin}
  let(:end_user) {create :end_user}

  describe 'associations' do
    it { should belong_to(:role).class_name('Role') }
    it { should have_many(:education_details) }
    it { should have_many(:professional_details) }
    it { should have_one(:personal_detail) }
  end

  describe 'validation' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
  end

  describe '#is_admin?' do

    it 'Should Return True when User is Admin' do
      expect(admin_user.is_admin?).to be_truthy
    end
    it 'Should Not Return True when User is Not Admin' do
      expect(end_user.is_admin?).to be_falsey
    end

  end

end