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

    return unless value.match?(ZIP_CODE_REGEX)

    address = correios_cep_finder.new(value)

    [
      {
        address: address.street,
        neighborhood: address.neighborhood,
        city: address.city,
        state: address.state,
        complement: address.complement,
        zipcode: value
      }
    ]
  end

  protected

  attr_reader :value

  private

  def correios_cep_finder
    ViaCep::Address
  end
end
