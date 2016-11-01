require 'rails_helper'

RSpec.describe Api::VolunteersController do
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

  let(:valid_attributes) {
    attributes_for(:volunteer, cellphone: cellphone_valid_attributes,
                               residential_phone: residential_phone_valid_attributes,
                               address: address_valid_attributes)
  }

  let(:invalid_attributes) {
    attributes_for(:volunteer, email: '',
                               cellphone_attributes: cellphone_valid_attributes,
                               residential_phone_attributes: residential_phone_valid_attributes,
                               address_attributes: address_valid_attributes)
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Volunteer" do
        expect {
          post :create, params: { volunteer: valid_attributes }, format: :json
        }.to change(Volunteer, :count).by(1)
      end

      it "assigns a newly created volunteer as @volunteer" do
        post :create, params: { volunteer: valid_attributes }, format: :json

        expect(assigns(:volunteer)).to be_a(Volunteer)
        expect(assigns(:volunteer)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved volunteer as @volunteer" do
        post :create, params: { volunteer: invalid_attributes }, format: :json

        expect(assigns(:volunteer)).to be_a_new(Volunteer)
      end
    end
  end
end
