FactoryGirl.define do
  factory :question do
    content {Faker::Name.name}
    question_type :single_choice
    subject {FactoryGirl.create :subject}
  end
end
