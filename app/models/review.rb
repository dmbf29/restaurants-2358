class Review < ApplicationRecord
  # associations
  belongs_to :restaurant # review.restaurant =
  # validations
  validates :content, presence: true
end
