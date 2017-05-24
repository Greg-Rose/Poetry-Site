FactoryGirl.define do
  factory :poem do
    sequence(:title) { |n| "Poem#{n}" }
    sequence(:body) { |n| "Roses are red#{n}" }
  end
end
