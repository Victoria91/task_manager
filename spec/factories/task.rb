FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence(3) }
    user { create(:user) }
  end
end