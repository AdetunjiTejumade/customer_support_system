# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    ticket
    content { Faker::Lorem.paragraph_by_chars(number: 255) }
  end
end
