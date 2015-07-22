class ReservationsController < ApplicationController
	before_action :authorize
	 
	def index

	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
<<<<<<< HEAD
		@reservation = @restaurant.reservations.new(
			number_in_party: params[:reservation][:number_in_party],
			user_id: session[:user_id],
			restaurant_id: params[:restaurant_id],
			timer: @restaurant.wait_time, name: params[:reservation][:name])

		if @reservation.save
			NotifyUsersWorker.perform_in(15.seconds, @reservation.id)
=======
		@reservation = @restaurant.reservations.new(reservation_params)

		if @reservation.save
			# NotifyUsersWorker.perform_in(3.minutes, @reservation.id)

>>>>>>> 8fcdd97417ede989b331d0370a5532e68441397c
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

<<<<<<< HEAD
	# private
	# 	def reservation_params
	# 		params.require(:reservation).permit(:number_in_party, :user_id, :restaurant_id)
	# 	end
=======
	private
		def reservation_params
			params.require(:reservation).permit(:number_in_party, :user_id, :restaurant_id)
		end

>>>>>>> 8fcdd97417ede989b331d0370a5532e68441397c

end
