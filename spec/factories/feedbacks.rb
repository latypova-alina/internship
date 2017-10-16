FactoryGirl.define do
  factory :feedback do
    name { Faker::Name.name }
    email
    text { Faker::Lorem.words }
  end
end
