class HarvestSlot < ApplicationRecord
  belongs_to :partner
  validates :day_of_the_week, :hour, presence: true
end
