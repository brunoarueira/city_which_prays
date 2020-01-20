# frozen_string_literal: true

FactoryBot.define do
  factory :volunteer do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }

    terms_to_receive { true }

    association :cellphone, factory: :phone
    association :residential_phone, factory: :phone
  end
end
