class Harvest < ApplicationRecord
  belongs_to :association
  belongs_to :partner
  has_many :harvesters
  validate :date, :harvesters_number, presence: true
end
