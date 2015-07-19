class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      @errors = ["Invalid Username or Password."]
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def show
    @user = User.new
    if session[:user_id]
      redirect_to '/'
    else
      render :login
    end
  end

end
