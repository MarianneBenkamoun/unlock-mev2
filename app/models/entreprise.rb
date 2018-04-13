class Entreprise < ApplicationRecord
  belongs_to :maisonmere
  has_one :profile
end
