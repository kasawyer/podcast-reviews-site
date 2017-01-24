FactoryGirl.define do
  factory :user do

    name "Chewy"
    password "password"
    password_confirmation "password"

    email "chewy@gmail.com"
  end
end
