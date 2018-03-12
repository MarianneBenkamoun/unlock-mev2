class Profile < ApplicationRecord
mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :courses
end
