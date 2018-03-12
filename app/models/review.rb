class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :course
end
