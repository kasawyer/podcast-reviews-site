FactoryGirl.define do
  factory :podcast do
    name "This American Life"
    description "Ira Glass doing what he does best - telling us great stories."
    release_year 2017
    itunes_url "http://www.apple.com/itunes"
    soundcloud_url "https://soundcloud.com"

    user
    provider
  end
end
