require "rails_helper"

RSpec.describe Api::V1::CoursesController, type: :controller do

  before do
    @course1 = FactoryBot.create(:course)
    @course2 = FactoryBot.create(:course)
    @tutor1 = FactoryBot.create(:tutor, course: @course1)
    @tutor2 = FactoryBot.create(:tutor, course: @course2)
  end

  describe "GET #index" do
    it "should return course with tutors" do
      get :index
      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data.map {|d| d['id']}).to eq([@tutor1.id, @tutor2.id])
    end
  end

  describe "POST #create" do
    it "successfully created course" do
      initial_count = Course.count
      get :create, params: {
        "course": {
          "title": "Mathematics",
          "description": "This is a description for Mathematics",
          "code": "MATH123",
          "level": 0,
          "price": 5000,
          "tutors_attributes": [
              {
                  "first_name": "Suman",
                  "last_name": "Mali",
                  "email": "suman.mali@gmail.com",
                  "experience": 5
              }
          ]
        }
      }
      final_count = Course.count
      expect(response).to have_http_status(:ok)
      expect(final_count - initial_count).to eq(1)
    end

    it "failed to create course" do
      initial_count = Course.count
      get :create, params: {
        "course": {
          "title": "",
          "description": "This is a description for Mathematics",
          "code": "MATH123",
          "level": 0,
          "price": 5000,
          "tutors_attributes": [
              {
                  "first_name": "Suman",
                  "last_name": "Mali",
                  "email": "suman.mali@gmail.com",
                  "experience": 5
              }
          ]
        }
      }
      final_count = Course.count
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({"errors"=>["Title can't be blank"]})
      expect(final_count - initial_count).to eq(0)
    end
  end
end
