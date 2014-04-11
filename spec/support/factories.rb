FactoryGirl.define do
  factory :user do
    sequence (:email) {|n|"kate#{n}@example.com"}
    password '12345678'
  end
end
