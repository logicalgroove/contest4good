# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "teacher#{n}@example.com"
  end

  factory :teacher do
    name 'Test Teacher'
    email
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now
  end
end
