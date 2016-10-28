module Helpers
  def json
    (@json ||= {}).fetch(response.body) {
      JSON.parse(response.body, symbolize_names: true)
    }
  end
end

RSpec.configure do |config|
  config.include Helpers, type: :controller
end
