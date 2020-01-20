# frozen_string_literal: true

FactoryBot.define do
  factory :home_distribution do
    except_homes { false }
    numbers_from_buildings { false }
    number_from_homes_to_distribute { 'MyString' }
    deliver_on_building_for_all { false }
    building_name { 'MyString' }
    volunteer { nil }
  end
end
