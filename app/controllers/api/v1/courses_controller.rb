class  Api::V1::CoursesController < ApplicationController
  def index
    courses = Course.includes(:tutors)
    render json: courses, each_serializer: CourseSerializer, root: "courses"
  end

  def create
    course = Course.new(courses_params)
    if course.save
      render json: course, serializer: CourseSerializer, root: "course"
    else
      render json: { errors: course.errors.full_messages }
    end
  end

  private

  def courses_params
    params.require(:course).permit(:title, :description, :code, :level, :price, tutors_attributes: [:id, :first_name, :last_name, :email, :experience, :_destroy])
  end
end