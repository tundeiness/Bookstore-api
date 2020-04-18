FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    Category { Faker::Book.genre }
  end
end
