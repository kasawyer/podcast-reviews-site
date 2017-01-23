FactoryGirl.define do
  factory :review do
    rating 5
    body "Great podcast!"

    user User.create!(name: "Person", email: "person@gmail.com", password: "password")
    podcast
  end
end
