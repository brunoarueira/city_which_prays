class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :name, :number, :neighborhood, :city,
            :state, :zipcode, presence: true
  validates :number, numericality: true, allow_blank: true
end
