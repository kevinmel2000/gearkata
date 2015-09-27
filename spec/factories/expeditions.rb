FactoryGirl.define do
  factory :expedition do
    sequence(:name) { |n| "Item #{n}" }
  end

end
