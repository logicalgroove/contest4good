# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_default_users

  puts 'DEFAULT TEACHER'
  teacher = Teacher.where(email: 'teacher@example.com').first_or_create name: 'teacher',
                                                                        email: 'teacher@example.com', password: '12341234',
                                                                        password_confirmation: '12341234',
                                                                        confirmed_at: Time.now
  teacher.accept_invitation!

  student = Student.where(email: 'student@example.com').first_or_create name: 'student',
                                                                        email: 'student@example.com', password: '12341234',
                                                                        password_confirmation: '12341234',
                                                                        confirmed_at: Time.now


end

def create_default_objects

  subject = Subject.create!(name: 'Math')
  Event.create!(subject: subject,
                name: 'Math Event',
                starts_at: Time.now,
                ends_at: Time.now + 2.days,
                event_duration_in_minutes: 300)
end

create_default_users()
create_default_objects()