# frozen_string_literal: true

FactoryBot.define do
  factory :attending_church do
    name { 'MyString' }
    main_leader { 'MyString' }
    volunteer { nil }
  end
end
