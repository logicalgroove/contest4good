class Teachers::TeachersController < TeacherController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :correct_password, only: [:update]
  before_action :gen_password, only: [:create]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def home

  end

  def show
  end

  def edit
  end

  def update
    authorize! :assign_roles, @teacher if params[:teacher][:role_ids]
    respond_to do |format|

      if @teacher.update_attributes(teacher_params)
        format.html { redirect_to @teacher, notice: 'Information is updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id] || current_teacher.to_res)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:email, :name)
    #params[:teacher]
  end

  def correct_password

    if params[:teacher][:password].blank?
      params[:teacher].delete(:password)
      params[:teacher].delete(:password_confirmation)
    end
  end

  def gen_password

    if params[:teacher][:password].blank?
      params[:teacher][:password]=params[:teacher][:password_confirmation]= Array.new(6) { [*'0'..'9', *'A'..'Z',*'a'..'z'].sample }.join
    end
  end

end