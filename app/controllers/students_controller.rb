class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :correct_password, only: [:update]
  before_action :gen_password, only: [:create]
  #before_filter :authenticate_student!
  load_and_authorize_resource

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def update
    authorize! :assign_roles, @student if params[:student][:role_ids]
    respond_to do |format|

      if @student.update_attributes(student_params)
        format.html { redirect_to @student, notice: 'Information is updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:email, :name, :study_place)
    #params[:student]
  end

  def correct_password

    if params[:student][:password].blank?
      params[:student].delete(:password)
      params[:student].delete(:password_confirmation)
    end
  end

  def gen_password

    if params[:student][:password].blank?
      params[:student][:password]=params[:student][:password_confirmation]= Array.new(6) { [*'0'..'9', *'A'..'Z',*'a'..'z'].sample }.join
    end
  end

end