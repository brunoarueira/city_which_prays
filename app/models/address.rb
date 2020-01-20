# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  validates :name, :number, :neighborhood, :city,
            :state, :zipcode, presence: true
  validates :number, numericality: true, allow_blank: true
end
