
FactoryGirl.define do
  factory :publication, :class => Refinery::Publications::Publication do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

