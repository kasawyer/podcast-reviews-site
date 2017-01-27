FactoryGirl.define do
  factory :admin do

    name "Luke"
    password "theforce"
    password_confirmation "theforce"

    email "iamyourson@gmail.com"
  end
end
