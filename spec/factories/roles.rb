FactoryBot.define do
  factory :role do
    factory :end_user_role do
      name { 'EndUser' }
    end

    factory :admin_role do
      name { 'Admin' }
    end
  end
end