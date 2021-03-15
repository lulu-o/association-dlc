class Harvest < ApplicationRecord
  # belongs_to :association
  belongs_to :my_association, class_name: "Association", foreign_key: "association_id"
  belongs_to :partner
  has_many :harvesters
  has_many :distributions
  validates :date, :harvesters_number, presence: true
end
