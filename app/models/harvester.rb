class Harvester < ApplicationRecord
  belongs_to :users
  belongs_to :harvests
end
