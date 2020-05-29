class Role < ApplicationRecord

  has_many :users

  def self.end_user
    all.find_by(name: 'EndUser')
  end

end
