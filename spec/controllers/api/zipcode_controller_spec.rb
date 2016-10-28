require 'rails_helper'
require 'address_scraper'

RSpec.describe Api::ZipcodeController do
  describe 'GET #search' do
    it 'returns the found addresses by zipcode' do
      get :search, params: { value: '28021001' }, format: :json

      expect(json.length).to eq 1

      result = json.first

      expect(result[:address]).to eq 'Rua Rossine Quintanilha Chagas'
      expect(result[:neighborhood]).to eq 'Parque Penha'
      expect(result[:city]).to eq 'Campos dos Goytacazes'
      expect(result[:state]).to eq 'RJ'
      expect(result[:zipcode]).to eq '28021001'
      expect(result[:complement]).to eq '- até 121 - lado ímpar'
    end

    it 'returns the found addresses by the street name' do
      get :search, params: { value: 'Rossine Quintanilha' }, format: :json

      expect(json.length).to eq 5
    end
  end
end
