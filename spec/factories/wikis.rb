FactoryGirl.define do
  factory :wiki do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph
  end
end
