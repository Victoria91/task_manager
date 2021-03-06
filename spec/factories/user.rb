FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    password 'qwerty12'
  end

  factory :admin, class: User do
    email
    password 'qwerty12'
    admin true
  end
end