FactoryGirl.define do
  factory :account do
    name "MyString"
    ancestry "MyString"
    kind "MyString"
    owner nil
  end
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password 'qaswed'
  end
end
