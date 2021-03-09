class HarvestSlot < ApplicationRecord
  belongs_to :partner
  validate :day_of_the_week, :hour, presence: true
end
