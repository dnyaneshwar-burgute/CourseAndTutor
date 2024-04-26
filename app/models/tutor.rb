# Tutor Model
class Tutor < ApplicationRecord

  # Associations
  belongs_to :course

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

end
