FactoryGirl.define do
  factory :subject do
    content {Faker::Name.name}
    description {Faker::Lorem.sentence}
  end
end
