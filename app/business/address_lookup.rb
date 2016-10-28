class AddressLookup
  ZIP_CODE_REGEX = /\A(?<num>\d{8})\Z/

  def self.find(*args)
    new(*args).find
  end

  def initialize(value)
    self.value = value
  end

  def find
    return [] if self.value.blank?

    if value =~ ZIP_CODE_REGEX
      [correios_cep_finder.get(value)]
    else
      scraper_finder.get(value)
    end
  end

  protected

  attr_accessor :value

  private

  def correios_cep_finder
    Correios::CEP::AddressFinder
  end

  def scraper_finder
    AddressScraper
  end
end
