class Contact < ApplicationRecord
  belongs_to :partner
  validate :first_name, :phone_number, presence: true
end
