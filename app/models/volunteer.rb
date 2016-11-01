class Volunteer < ApplicationRecord
  has_one :cellphone, -> { where(kind: Phone.kinds[:cell]) },
                      class_name: "Phone",
                      foreign_key: "volunteer_cellphone_id"
  has_one :residential_phone, -> { where(kind: Phone.kinds[:residential]) },
                              class_name: "Phone",
                              foreign_key: "volunteer_residential_phone_id"
  has_one :address, as: :addressable
  has_one :home_distribution, inverse_of: :volunteer
  has_one :attending_church, inverse_of: :volunteer

  validates :name, :email, presence: true
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i },
                    allow_blank: true

  accepts_nested_attributes_for :cellphone, reject_if: :all_blank
  accepts_nested_attributes_for :residential_phone, reject_if: :all_blank
  accepts_nested_attributes_for :address, reject_if: :all_blank
  accepts_nested_attributes_for :home_distribution, reject_if: :all_blank
  accepts_nested_attributes_for :attending_church, reject_if: :all_blank
end
