
FactoryGirl.define do
  factory :author, :class => Refinery::Publications::Author do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

