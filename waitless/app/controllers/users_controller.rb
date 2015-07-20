class UsersController < ApplicationController

  def index
    if !current_user
      redirect_to '/'
    end
  end

  def show
    render :index
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.password != @user.password_confirmation
      @errors = ["Passwords do not match."]
      render :new
    elsif  @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
