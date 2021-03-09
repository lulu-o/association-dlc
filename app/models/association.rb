class Association < ApplicationRecord
  has_many :users
  has_many :harvests
  has_many :association_partners
  validates :name, :address, :zipcode, :city, presence: true
end
