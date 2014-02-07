module ControllerMacros
  def login_teacher
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:teacher]
      teacher = FactoryGirl.create(:teacher) # Using factory girl as an example
      teacher.accept_invitation! #
      sign_in teacher
    end
  end

  def login_student
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:student]
      student = FactoryGirl.create(:student)
      sign_in student
    end
  end
end