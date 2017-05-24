FactoryGirl.define do
  factory :admin do
    email "johnsmith@example.com"
    password "password1"
    password_confirmation "password1"
  end
end
