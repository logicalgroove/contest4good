Given /^I exist as a student$/ do
  @student = FactoryGirl.create(:student, name: 'Jim', email: 'student@g.com', password: 'secret_secret', confirmed_at: Time.now)
end
