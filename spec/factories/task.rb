FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence(3) }
    user_id { create(:user).id }
  end
end
