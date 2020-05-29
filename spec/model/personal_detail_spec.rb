require 'rails_helper'

describe PersonalDetail, type: :model do


  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

end