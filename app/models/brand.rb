class Brand < ApplicationRecord
  has_many :partner
  validates :name, presence: true, uniqueness: true
end
