FactoryGirl.define do
 factory :user do
    sequence :email do |n|
      "hil.tfhp#{n}@gmail.com"
    end
    password "12345678"
    password_confirmation "12345678"
  end
end