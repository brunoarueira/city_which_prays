require 'rails_helper'

RSpec.describe Phone do
  describe 'associations' do
    it { should belong_to(:volunteer_cellphone).class_name("Volunteer")
                                               .with_foreign_key("volunteer_cellphone_id") }
    it { should belong_to(:volunteer_residential_phone).class_name("Volunteer")
                                                       .with_foreign_key("volunteer_residential_phone_id") }
  end

  describe 'validations' do
    it { should validate_presence_of :ddd }
    it { should validate_presence_of :number }

    it { is_expected.not_to allow_value(999).for(:ddd) }
    it { is_expected.to allow_value(99).for(:ddd) }

    it { is_expected.not_to allow_value("123abc").for(:number) }
    it { is_expected.to allow_value("12345678").for(:number) }

    context 'kind' do
      describe 'is cell' do
        before do
          subject.kind = Phone.kinds[:cell]
        end

        it { should validate_presence_of(:volunteer_cellphone).with_message(:required) }

        it { is_expected.not_to allow_value("12345678").for(:number) }
        it { is_expected.to allow_value("123456789").for(:number) }
      end

      describe 'is residential' do
        before do
          subject.kind = Phone.kinds[:residential]
        end

        it { should validate_presence_of(:volunteer_residential_phone).with_message(:required) }

        it { is_expected.not_to allow_value("123456789").for(:number) }
        it { is_expected.to allow_value("12345678").for(:number) }
      end
    end
  end
end
