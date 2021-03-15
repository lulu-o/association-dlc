class Distribution < ApplicationRecord
  belongs_to :harvest
  belongs_to :user

  validates :date, :hour, :address, :zipcode, :city, :baskets_number, :description, :need_bag, :need_cooler, :informations, presence: true
end
