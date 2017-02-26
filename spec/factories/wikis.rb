FactoryGirl.define do
  factory :wiki do
    title Faker::StarWars.quote
    body Faker::Lorem.paragraphs.join(". ")
    private false
    user
  end
end
