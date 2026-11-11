class Restaurant < ApplicationRecord
  # associations -> has_many / belongs_to
  # has_many :reviews # restaurant.reviews
  has_many :reviews, dependent: :destroy # this will delete the reviews associated with the restaurant
  # validations
  # validates :column_name, validation: true
  validates :name, presence: true
  validates :rating, inclusion: { in: [ 1, 2, 3, 4, 5 ] }
end
