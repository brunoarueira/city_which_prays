# frozen_string_literal: true

class AddressLookup
  ZIP_CODE_REGEX = /\A(?<num>\d{8})\Z/.freeze

  def self.find(*args)
    new(*args).find
  end

  def initialize(value)
    @value = value
  end

  def find
    return [] if value.blank?

    return unless value =~ ZIP_CODE_REGEX

    [correios_cep_finder.get(value)]
  end

  protected

  attr_reader :value

  private

  def correios_cep_finder
    Correios::CEP::AddressFinder
  end
end
