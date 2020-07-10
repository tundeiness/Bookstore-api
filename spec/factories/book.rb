FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    category { Faker::Book.genre }
  end
end
