class Partner < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_address
  [address, zipcode, city].compact.join(' ')
  end
end
