class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin?
  helper_method :authorize

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/session' unless current_user
  end

  protected

  def admin?
    unless current_user && @current_user.admin?
      flash[:error] = "You do not have permission to do that!!!"
      redirect_to '/'
    end
  end
end
