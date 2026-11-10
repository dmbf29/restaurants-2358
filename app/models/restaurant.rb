class Restaurant < ApplicationRecord
  # associations -> has_many / belongs_to
  # validations
  # validates :column_name, validation: true
  validates :name, presence: true
  validates :rating, inclusion: { in: [ 1, 2, 3, 4, 5 ] }
end
