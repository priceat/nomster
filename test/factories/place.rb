FactoryGirl.define do
  factory :place do
    name "tate"
    address "123 fake"
    description "great"
    latitude(0.0)
    longitude(0.0)
    association :user
  end
end