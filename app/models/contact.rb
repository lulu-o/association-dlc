class Contact < ApplicationRecord
  belongs_to :partner
  validates :first_name, :phone_number, presence: true
end
