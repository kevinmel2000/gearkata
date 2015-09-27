class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:home]

  before_action :set_request_host

  def set_request_host
    @request_host = request.host || 'www.gearkata.com'
    @request_port = request.port || ''
  end

  # -------------------- End-points --------------------

  def home
    @user = current_user
  end

  def flash_test
    flash[:notice] = "This is a flash notice"
    flash[:alert] = "This is a flash alert"
    flash[:error] = "This is a flash error"
  end
end
