FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Item #{n}" }
  end

end
