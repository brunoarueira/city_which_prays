# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address do
  describe 'associations' do
    it { should belong_to(:addressable).optional }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :number }
    it { should validate_presence_of :neighborhood }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }

    it { should validate_numericality_of :number }
  end
end
