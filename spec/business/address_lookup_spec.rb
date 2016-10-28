require 'rails_helper'
require 'address_scraper'

describe AddressLookup do
  describe '#find' do
    context 'using streets name' do
      it 'returns the addresses' do
        result = described_class.new('Rossine Quintanilha').find

        expect(result.length).to eq 5

        first_result = result.first

        expect(first_result[:address]).to eq 'Rua Rossine Quintanilha Chagas'
        expect(first_result[:neighborhood]).to eq 'Parque Penha'
        expect(first_result[:city]).to eq 'Campos dos Goytacazes'
        expect(first_result[:state]).to eq 'RJ'
        expect(first_result[:zipcode]).to eq '28021001'
        expect(first_result[:complement]).to eq '- até 121 - lado ímpar'
      end
    end

    context 'using zipcode' do
      it 'returns the addresses' do
        result = described_class.new('28021001').find

        expect(result.length).to eq 1

        first_result = result.first

        expect(first_result[:address]).to eq 'Rua Rossine Quintanilha Chagas'
        expect(first_result[:neighborhood]).to eq 'Parque Penha'
        expect(first_result[:city]).to eq 'Campos dos Goytacazes'
        expect(first_result[:state]).to eq 'RJ'
        expect(first_result[:zipcode]).to eq '28021001'
        expect(first_result[:complement]).to eq '- até 121 - lado ímpar'
      end
    end
  end
end
