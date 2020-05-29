FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    password { 'Password@123' }

    factory :end_user do
      association :role, factory: :end_user_role
    end

    factory :admin do
      association :role, factory: :admin_role
    end
  end
end