class Harvest < ApplicationRecord
  # belongs_to :association
  belongs_to :my_association, class_name: "Association", foreign_key: "association_id"
  belongs_to :partner
  has_many :harvesters
  has_many :distributions
  validates :date, :harvesters_number, presence: true

  def full?
    self.harvesters.count == self.harvesters_number
  end

  def user_registered?(user_id)
    self.harvesters.any? {|harvester| harvester.user_id == user_id}
  end
end
