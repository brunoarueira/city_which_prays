require 'net/http'

class AddressScraper
  COMPLEMENT_REGEX = /-\s\b(até|de)\b.*$/

  def self.get(value)
    new(value).get
  end

  def initialize(value)
    self.value = value
  end

  def get
    return [] if self.value.blank?

    format_data || []
  end

  protected

  attr_accessor :value

  private

  def url
    URI.parse("http://m.correios.com.br/movel/buscaCepConfirma.do")
  end

  def params
    {
      'cepEntrada' => value,
      'tipoCep' => '',
      'cepTemp' => '',
      'metodo' => 'buscarCep'
    }
  end

  def response
    @response ||= Net::HTTP.post_form(url, params)
  end

  def response_body
    @response_body ||= response.body.force_encoding(document_encoding).encode("UTF-8")
  end

  def document
    @document ||= Oga.parse_html(response_body, encoding: 'UTF-8')
  end

  def raw_data
    @raw_data ||= document.xpath("//div[starts-with(@class, 'caixacampo')]")
  end

  def records_count
    @records_count ||= document[/\d a \d+ de \d+/]
  end

  def content_type_regex
    /<meta[^>]*HTTP-EQUIV=["']Content-Type["'][^>]*content=["'](.*)["']/i &&
      $1 =~ /charset=(.+)/i &&
      $1.upcase
  end

  def document_encoding
    return @document_encoding if @document_encoding

    response.type_params.each_pair do |k,v|
      @document_encoding = v.upcase if k =~ /charset/i
    end

    @document_encoding ||= response.body =~ content_type_regex
  end

  def format_data
    formatted_data = []

    raw_data.each do |data|
      values = data.xpath("./span[contains(@class, 'respostadestaque')]")
                   .map(&:text)
                   .map { |item| item.gsub(/(\n|\t)/, '') }
                   .map(&:strip)

      address = values[0].gsub(COMPLEMENT_REGEX, '').strip
      complement = values[0][COMPLEMENT_REGEX] || ''
      city, state = values[2].split('/').map(&:strip)

      formatted_data << {
        address: address,
        neighborhood: values[1],
        city: city,
        state: state,
        zipcode: values[3],
        complement: complement
      }
    end

    formatted_data
  end
end
