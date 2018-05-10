
FactoryGirl.define do
  factory :registration, :class => Refinery::Registrations::Registration do
    sequence(:full_name) { |n| "refinery#{n}" }
  end
end

