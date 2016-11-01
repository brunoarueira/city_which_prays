require 'rails_helper'

RSpec.describe Volunteer do
  describe 'associations' do
    it { should have_one(:cellphone).conditions(kind: Phone.kinds[:cell])
                                    .class_name("Phone")
                                    .with_foreign_key("volunteer_cellphone_id") }
    it { should have_one(:residential_phone).conditions(kind: Phone.kinds[:residential])
                                            .class_name("Phone")
                                            .with_foreign_key("volunteer_residential_phone_id") }
    it { should have_one :address }
    it { should have_one :home_distribution }
    it { should have_one :attending_church }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    it { is_expected.not_to allow_value("foo.com").for(:email) }
    it { is_expected.to allow_value("john.smith@example.com").for(:email) }
  end
end
