FactoryGirl.define do
  factory :comment do
    message "Gary Vaynerchuk"
    rating "1_star"
    association :place
    association :user
  end
end