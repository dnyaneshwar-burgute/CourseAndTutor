FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Course #{n}" }
    sequence(:description) { |n| "Course Description #{n}" }
    code { SecureRandom.hex(4) }
    level { [0, 1, 2, 3, 4, 5].sample }
    price { [5000, 6000, 7000].sample }
  end
end
