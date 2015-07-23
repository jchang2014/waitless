class UsersController < ApplicationController
  before_action :authorize, :except => [:index, :new, :create]
  def index

  end

  def show
    if !current_user
      redirect_to '/'
    end

    @user = User.find(params[:id])

    if current_user.admin
      @restaurant = @user.restaurants.first
      if @restaurant
        @restaurant_hash = Yelp.client.business(@restaurant.yelp_id).as_json['hash']
      else
        @restaurant_hash = nil
      end
    else
      @user = User.find(params[:id])
      @reservations = @user.reservations
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
