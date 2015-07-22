class ReservationsController < ApplicationController
	before_action :authorize
	 
	def index

	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new(
			number_in_party: params[:reservation][:number_in_party],
			user_id: session[:user_id],
			restaurant_id: params[:restaurant_id],
			timer: @restaurant.wait_time, name: params[:reservation][:name])

		if @reservation.save
			NotifyUsersWorker.perform_in(15.seconds, @reservation.id)
			redirect_to "/users/#{session[:user_id]}"
		else
			@errors = @reservation.errors.full_messages
			redirect "/restaurant/#{params[:restaurant_id]}"
		end
	end

	def show

	end

	def update

	end

	# private
	# 	def reservation_params
	# 		params.require(:reservation).permit(:number_in_party, :user_id, :restaurant_id)
	# 	end

end
