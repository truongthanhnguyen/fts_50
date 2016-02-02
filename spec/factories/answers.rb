FactoryGirl.define do
  factory :answer do
    content {Faker::Name.name}
    correct_answer false
    association :question, method: :build
  end
end
