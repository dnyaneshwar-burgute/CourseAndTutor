class CourseSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :code,
             :level,
             :price

  has_many :tutors
end