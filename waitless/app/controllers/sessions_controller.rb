class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/restaurants'
    else
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def new
    if session[:user_id]
      redirect_to '/'
    else
      render :login
    end
  end

end
