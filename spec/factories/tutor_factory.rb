FactoryBot.define do
  factory :tutor do
    sequence(:first_name) { |n| "First Name #{n}" }
    sequence(:last_name) { |n| "Last Name #{n}" }
    sequence(:email) { |n| "tutor#{n}@gmail.com" }
    experience { [0, 1, 2, 3, 4, 5].sample }

    association :course, factory: :course
  end
end
