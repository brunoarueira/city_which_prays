require 'rails_helper'

RSpec.describe HomeDistribution do
  describe 'associations' do
    it { should belong_to :volunteer }
  end
end
