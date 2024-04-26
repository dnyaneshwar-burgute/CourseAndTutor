# Course Model
class Course < ApplicationRecord

  # Associations
  has_many :tutors

  # Validations
  validates :title,
            presence: true,
            uniqueness: true

end
