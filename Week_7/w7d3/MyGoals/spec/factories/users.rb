FactoryBot.define do
  factory :user do
    username {'Dog'}
    email {Faker::Internet.email}
    password { 'password' }
  end
end
