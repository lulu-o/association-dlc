class Distribution < ApplicationRecord
  belongs_to :harvest
  belongs_to :user

  validates :date, :hour, :user_id, :harvest_id, presence: true
  validates :baskets_number, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50, message: 'doit être un nombre entre 1 et 50'}
end


  # validates :date, :hour, :address, :zipcode, :city, :baskets_number, :description, :need_bag, :need_cooler, :informations, presence: true
