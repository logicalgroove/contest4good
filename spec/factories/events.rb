# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    subject :subject
    starts_at "2014-02-08 03:14:29"
    ends_at "2014-02-08 03:14:29"
    event_duration_in_minutes 1
  end
end
