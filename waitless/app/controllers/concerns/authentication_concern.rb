module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :admin?
    helper_method :authorize
  end

  private

  def login_as_user(user)
  end

  def logout!
    session.clear
  end

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.where(id: session[:user_id]).first
    logout! if @current_user.nil?
    @current_user
  end

  def authorize
    redirect_to '/session' unless current_user
  end

  def admin?
    unless current_user && @current_user.admin?
      flash[:error] = "You do not have permission to do that!!!"
      redirect_to '/'
    end
  end

end
