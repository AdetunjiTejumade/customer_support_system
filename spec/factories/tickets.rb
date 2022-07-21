# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    user
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph_by_chars(number: 255) }
  end
end
