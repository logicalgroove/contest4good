class TeacherController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_teacher! unless :devise_controller?
  before_filter :check_registration

  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_path, :alert => exception.message
  #end
  layout "teacher_application"

  private

  def check_registration
    if current_teacher && !current_teacher.valid?
      flash[:warning] = "Please finish your registration before continuing.".html_safe
    end
  end

end
