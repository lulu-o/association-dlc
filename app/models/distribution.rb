class Distribution < ApplicationRecord
  belongs_to :harvest
  has_many :distributors
end
