class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
  PASSWORD_FORMAT = /\A
    (?=.{8,})
    (?=.*[A-Z])
    (?=.*\W)
  /x

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password,
    presence: true,
    length: { in: (7..60) },
    format: { with: PASSWORD_FORMAT },
    confirmation: true,
    on: :create

  has_many :education_details, dependent: :destroy
  has_many :professional_details, dependent: :destroy
  has_one :personal_detail, dependent: :destroy
  belongs_to :role

  scope :end_users, -> { where(role_id: Role.find_by(name: 'EndUser').id) }

  delegate :name, to: :role, prefix: true, allow_nil: true

  accepts_nested_attributes_for :education_details, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :professional_details, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :personal_detail, reject_if: :all_blank, allow_destroy: true

  validate :max_education_details, :max_professional_details

  def is_admin?
    role_name == 'Admin'
  end

  def is_end_user?
    role_name == 'EndUser'
  end

  def max_education_details
    if education_details.size > 5
      self.errors.add(:base, "Total Education Details cannot be greater than 5")
    end
  end

  def max_professional_details
    if professional_details.size > 10
      self.errors.add(:base, "Total Professional Details cannot be greater than 10")
    end
  end


  class << self

    def advance_search(search_params)
      users = all
      if search_params[:degree].present?
        users = users.references(:education_details).where("education_details.degree=?", "#{search_params[:degree]}")
      end
      if search_params[:college_name].present?
        users = users.references(:education_details).where("education_details.college_name=?", "#{search_params[:college_name]}")
      end
      users
    end

  end

end
