class Teachers::SessionsController < Devise::SessionsController
   # To change this template use File | Settings | File Templates.
  before_filter :authenticate_teacher!, except: [:login, :logout]
  after_filter :set_access_control_headers

  def login
    build_params
    resource = Teacher.find_for_database_authentication(email: params[:email])

    return invalid_login_attempt unless resource
    return invalid_login_attempt unless resource.valid_password?(params[:password])

    resource.ensure_authentication_token! #make sure the tracker has a token generated
    render :json => {auth_token: resource.authentication_token, teacher_id: resource.id}, callback: params[:callback], :status => :created

  end

  def logout
    # expire auth token
    @teacher=Teacher.where(:authentication_token => params[:auth_token]).first

    return invalid_logout_attempt unless @teacher

    @teacher.reset_authentication_token!
    render :json => {:message => ['Session deleted.']}, callback: params[:callback], :success => true, :status => :ok
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render :json => {:errors => ['Invalid email or password.']}, :success => false, :status => :unauthorized
  end

  def invalid_logout_attempt
    warden.custom_failure!
    render :json => {:errors => ['Invalid token.']}, :success => false, :status => :unauthorized
  end

  def build_params
    params[:email] ||= request.headers['HTTP_EMAIL']
    params[:password] ||= request.headers['HTTP_PASSWORD']
    params[:auth_token] ||= request.headers['HTTP_AUTH_TOKEN']
  end

  def set_access_control_headers
    logger.info "===HTTP_ORIGIN #{request.headers['HTTP_ORIGIN']}"
    headers['Access-Control-Allow-Origin'] = request.headers['HTTP_ORIGIN'] || '*'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
    headers['Access-Control-Allow-Credentials'] = 'true'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET' # ???
    headers['Access-Control-Max-Age'] = '1728000' # ???
  end

end