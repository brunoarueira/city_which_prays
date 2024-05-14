# frozen_string_literal: true

require 'rails_helper'

describe AddressLookup do
  describe '#find' do
    context 'using zipcode' do
      it 'returns the addresses' do
        result = described_class.new('28010271').find

        expect(result.length).to eq 1

        first_result = result.first

        p first_result

        expect(first_result[:address]).to eq 'Rua Saldanha Marinho'
        expect(first_result[:neighborhood]).to eq 'Centro'
        expect(first_result[:city]).to eq 'Campos dos Goytacazes'
        expect(first_result[:state]).to eq 'RJ'
        expect(first_result[:zipcode]).to eq '28010271'
        expect(first_result[:complement]).to eq 'de 157 ao fim - lado ímpar'
      end
    end
  end
end
