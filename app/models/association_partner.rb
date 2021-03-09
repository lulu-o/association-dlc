class AssociationPartner < ApplicationRecord
  belongs_to :association
  belongs_to :partner
end
