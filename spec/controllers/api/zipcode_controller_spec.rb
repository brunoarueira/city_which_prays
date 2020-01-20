# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ZipcodeController do
  describe 'GET #search' do
    it 'returns the found addresses by zipcode' do
      get :search, params: { value: '28010271' }, format: :json

      expect(json.length).to eq 1

      result = json.first

      expect(result[:address]).to eq 'Rua Saldanha Marinho'
      expect(result[:neighborhood]).to eq 'Centro'
      expect(result[:city]).to eq 'Campos dos Goytacazes'
      expect(result[:state]).to eq 'RJ'
      expect(result[:zipcode]).to eq '28010271'
      expect(result[:complement]).to eq '- de 157 ao fim - lado ímpar'
    end
  end
end
