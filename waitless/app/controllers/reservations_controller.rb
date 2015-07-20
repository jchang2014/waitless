class ReservationsController < ApplicationController
	def index

	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.new(number_in_party: params[:reservation][:number_in_party], 
																	 user_id: session[:user_id], restaurant_id: params[:restaurant_id], timers: @restaurant.timer)
		if @reservation.save
			redirect_to "/users/#{session[:user_id]}"
		else
			@errors = @reservation.errors.full_messages
			redirect restaurant_path
		end
	end

	def show

	end

	def update

	end
end
