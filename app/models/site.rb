class Site < ApplicationRecord
  belongs_to :course


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
