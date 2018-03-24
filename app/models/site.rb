class Site < ApplicationRecord
  belongs_to :course
validates_presence_of :address

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
