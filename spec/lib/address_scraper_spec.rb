require 'rails_helper'
require 'address_scraper'

describe AddressScraper do
  describe '.get' do
    it 'returns the same result of #get' do
      result = described_class.get('Rossine Quintanilha')

      expect(result.length).to eq 5
    end
  end

  describe '#get' do
    it 'returns an empty array if pass a blank string' do
      result = described_class.new('').get

      expect(result.length).to eq 0
    end

    it 'returns an empty array if pass a nil string' do
      result = described_class.new(nil).get

      expect(result.length).to eq 0
    end

    it 'returns the search by value' do
      result = described_class.new('Rossine Quintanilha').get

      expect(result.length).to eq 5

      first_result = result.first

      expect(first_result[:address]).to eq 'Rua Rossine Quintanilha Chagas'
      expect(first_result[:neighborhood]).to eq 'Parque Penha'
      expect(first_result[:city]).to eq 'Campos dos Goytacazes'
      expect(first_result[:state]).to eq 'RJ'
      expect(first_result[:zipcode]).to eq '28021001'
      expect(first_result[:complement]).to eq '- até 121 - lado ímpar'

      second_result = result[1]

      expect(second_result[:address]).to eq 'Rua Rossine Quintanilha Chagas'
      expect(second_result[:neighborhood]).to eq 'Parque Penha'
      expect(second_result[:city]).to eq 'Campos dos Goytacazes'
      expect(second_result[:state]).to eq 'RJ'
      expect(second_result[:zipcode]).to eq '28021002'
      expect(second_result[:complement]).to eq '- até 124 - lado par'

      third_result = result[2]

      expect(third_result[:address]).to eq 'Rua Rossine Quintanilha Chagas'
      expect(third_result[:neighborhood]).to eq 'Parque Imperial'
      expect(third_result[:city]).to eq 'Campos dos Goytacazes'
      expect(third_result[:state]).to eq 'RJ'
      expect(third_result[:zipcode]).to eq '28022321'
      expect(third_result[:complement]).to eq '- de 123 ao fim - lado ímpar'

      last_result = result.last

      expect(last_result[:address]).to eq 'Travessa Rossine Quintanilha Chagas'
      expect(last_result[:neighborhood]).to eq 'Parque Penha'
      expect(last_result[:city]).to eq 'Campos dos Goytacazes'
      expect(last_result[:state]).to eq 'RJ'
      expect(last_result[:zipcode]).to eq '28021005'
      expect(last_result[:complement]).to eq ''
    end
  end
end
