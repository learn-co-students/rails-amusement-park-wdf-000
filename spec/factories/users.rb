FactoryGirl.define do
  factory :user do
    name "MyString"
    password_digest "MyText"
    nausea 1
    happiness 1
    tickets 1
    height 1
    admin false
  end
end
