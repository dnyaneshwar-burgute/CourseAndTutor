# Course Model
class Course < ApplicationRecord

  # Associations
  has_many :tutors

  # Validations
  validates :title,
            presence: true,
            uniqueness: true

  accepts_nested_attributes_for :tutors, reject_if: :all_blank
end
