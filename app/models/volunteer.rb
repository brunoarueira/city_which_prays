class Volunteer < ApplicationRecord
  has_one :cellphone, -> { where(kind: Phone.kinds[:cell]) },
                      class_name: "Phone",
                      foreign_key: "volunteer_cellphone_id"
  has_one :residential_phone, -> { where(kind: Phone.kinds[:residential]) },
                              class_name: "Phone",
                              foreign_key: "volunteer_residential_phone_id"

  validates :name, :email, presence: true
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i },
                    allow_blank: true

  accepts_nested_attributes_for :cellphone, reject_if: :all_blank
  accepts_nested_attributes_for :residential_phone, reject_if: :all_blank
end
