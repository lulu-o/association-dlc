class Partner < ApplicationRecord
  belongs_to :brand
  has_many :harvest_slots
  has_many :harvests
  has_many :contacts
  has_many :association_partners
  has_many :favorites
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_address
  [address, zipcode, city].compact.join(' ')
  end

  def coordinates
    [latitude, longitude]
  end
end
