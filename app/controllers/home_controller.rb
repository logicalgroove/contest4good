class HomeController < ApplicationController

  def index
    if current_student
      redirect_to students_home_path
    end
    if current_teacher
      redirect_to teachers_home_path
    end
  end
end
