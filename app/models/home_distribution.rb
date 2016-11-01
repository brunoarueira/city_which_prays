class HomeDistribution < ApplicationRecord
  belongs_to :volunteer, inverse_of: :home_distribution
end
