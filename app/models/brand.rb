class Brand < ApplicationRecord
  belongs_to :partner
  validates :name, presence: true, uniqueness: true
end
