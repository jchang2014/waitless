class ReservationsController < ApplicationController
	before_action :authorize
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
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
			@restaurant.update_wait_time
			@reservation.update_timer
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

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		p @destroyed

		respond_to do |format|
      format.json {
        render json: @reservation.id
      }
    end
	end
end
