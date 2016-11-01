class AttendingChurch < ApplicationRecord
  belongs_to :volunteer

  has_one :address, as: :addressable

  accepts_nested_attributes_for :address, reject_if: :all_blank
end
