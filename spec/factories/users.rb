FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password 'random_password'
    password_confirmation 'random_password'
  end

end
