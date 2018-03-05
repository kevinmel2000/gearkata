FactoryBot.define do
  factory :gear_list do
    sequence(:name) { |n| "Item #{n}" }
  end

end
