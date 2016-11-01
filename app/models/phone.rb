class Phone < ApplicationRecord
  enum kind: { cell: 1, residential: 2 }

  belongs_to :volunteer_cellphone, class_name: "Volunteer",
                                   foreign_key: "volunteer_cellphone_id",
                                   optional: true
  belongs_to :volunteer_residential_phone, class_name: "Volunteer",
                                           foreign_key: "volunteer_residential_phone_id",
                                           optional: true

  validates :ddd, :number, presence: true
  validates :ddd, format: { with: /\A[0-9]{2}\Z/ }, allow_blank: true
  validates :number, format: { with: /\A(?<num>\d+)\Z/ }, allow_blank: true
  validates :number, length: { is: 9 }, if: :cell?
  validates :number, length: { is: 8 }, if: :residential?

  validates :volunteer_cellphone, presence: true, if: :cell?
  validates :volunteer_residential_phone, presence: true, if: :residential?
end
