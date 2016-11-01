require 'rails_helper'

describe VolunteerCreator do
    let(:cellphone_valid_attributes) do
    cellphone_valid_attributes = attributes_for(:phone)
    cellphone_valid_attributes.delete(:kind)

    cellphone_valid_attributes
  end

  let(:residential_phone_valid_attributes) do
    residential_phone_valid_attributes = attributes_for(:phone, :residential)
    residential_phone_valid_attributes.delete(:kind)
    residential_phone_valid_attributes.delete(:whatsapp)

    residential_phone_valid_attributes
  end

  let(:address_valid_attributes) do
    attributes_for(:address)
  end

  let(:attending_church_attributes) do
    attributes_for(:attending_church, address_attributes: address_valid_attributes)
  end

  let(:attributes) {
    attributes_for(:volunteer, cellphone_attributes: cellphone_valid_attributes,
                               residential_phone_attributes: residential_phone_valid_attributes,
                               address_attributes: address_valid_attributes,
                               attending_church_attributes: attending_church_attributes)
  }

  describe '#call' do
    it 'should creates the volunteer and their associated data' do
      expect {
        described_class.new(attributes).call
      }.to change(Volunteer, :count).by(1)
    end
  end
end
