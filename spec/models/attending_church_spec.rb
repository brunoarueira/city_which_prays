require 'rails_helper'

RSpec.describe AttendingChurch do
  describe 'associations' do
    it { should belong_to :volunteer }

    it { should have_one :address }
  end
end
